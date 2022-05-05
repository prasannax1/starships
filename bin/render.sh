# Generate image from .scad file
# author - prasanna

# Set up some variables
# Arch independent
RENDERCMD="$(which openscad)"
if flatpak list | grep -q openscad; then
    RENDERCMD='flatpak run org.openscad.OpenSCAD/x86_64/stable'
elif snap list | grep -q openscad; then
    RENDERCMD='snap run openscad-nightly'
fi

# Util functions
usage() {
    echo "Usage: $0i"\
        " -i <input_file>"\
        " -o <stl_file>"\
        " -p <image_file>"\
        " [-t <theme>]"
}

render_stl() {
    local INFILE="$1"
    local OUTFILE="$2"

    ${RENDERCMD} -o "${OUTFILE}" "${INFILE}"
}

render_image() {
    local FILE="$1"
    local OUT="$2"
    local THEME="$3"
    local IMGSIZE="$4"
    local CAMERA="$5"

    local TMP="$(dirname $OUT)/$(basename $OUT .png)_tmp.png"

    if [ -z "${CAMERA}" ]; then
        ${RENDERCMD} -o "${TMP}" \
            --autocenter \
            --viewall \
            --imgsize "${IMGSIZE}" \
            --render \
            --projection p \
            --colorscheme "${THEME}" \
            "${FILE}"
    else
        ${RENDERCMD} -o "${TMP}" \
            --camera="${CAMERA}" \
            --imgsize "${IMGSIZE}" \
            --render \
            --projection p \
            --colorscheme "${THEME}" \
            "${FILE}"
    fi

    blacken "${TMP}" "${OUT}"
    rm "${TMP}"
}

blacken() {
    local IN="$1"
    local OUT="$2"
    convert "${IN}" \
        -fuzz 0% \
        -fill none \
        -draw "matte 0,0 floodfill" \
        -background black \
        -flatten \
        "${OUT}"
}

# main part
main() {
    local OPTIND SRCFILE STLFILE PICFILE THEME CAMERA IMGSIZE o
    while getopts ":i:o:p:t:c:s:" o; do
        case "${o}" in
            i)
                SRCFILE="${OPTARG}"
                ;;
            o)
                STLFILE="${OPTARG}"
                ;;
            p)
                PICFILE="${OPTARG}"
                ;;
            t)
                THEME="${OPTARG}"
                ;;
            c)
                CAMERA="${OPTARG}"
                ;;
            s)
                IMGSIZE="${OPTARG}"
                ;;
            *)
                usage
                ;;
        esac
    done

    if [ -z "${SRCFILE}" ] 
    then
        usage
        exit 1
    fi

    if [ -z "${STLFILE}" ] && [ -z "${PICFILE}" ]
    then
        usage
        exit 1
    fi

    if [ -z "${THEME}" ]; then
        THEME=Tomorrow
    fi

    if [ -z "${IMGSIZE}" ]; then
        IMGSIZE="3840,2160"
    fi

    # first render stl
    if [ ! -z "${STLFILE}" ]
    then
        render_stl "${SRCFILE}" "${STLFILE}"
    fi

    # Then render image
    if [ ! -z "${PICFILE}" ]
    then
        render_image "${SRCFILE}" "${PICFILE}" \
            "${THEME}" "${IMGSIZE}" "${CAMERA}"
    fi
}

main "$@"

