# Generate image from .scad file
# author - prasanna

# Set up some variables
RENDERCMD='flatpak run org.openscad.OpenSCAD/x86_64/stable'

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

    local TMP="$(dirname $OUT)/$(basename $OUT .png)_tmp.png"

    ${RENDERCMD} -o "${TMP}" \
        --autocenter \
        --viewall \
        --imgsize 3840,2160 \
        --render \
        --projection p \
        --colorscheme "${THEME}" \
        "${FILE}"

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
    local OPTIND SRCFILE STLFILE PICFILE THEME o
    while getopts ":i:o:p:t:" o; do
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
            *)
                usage
                ;;
        esac
    done

    if [ -z "${SRCFILE}" ] || [ -z "${STLFILE}" ] || [ -z "${PICFILE}" ]
    then
        usage
        exit 1
    fi

    if [ -z "${THEME}" ]; then
        THEME=Tomorrow
    fi

    # first render stl
    render_stl "${SRCFILE}" "${STLFILE}"

    # Then render image
    render_image "${SRCFILE}" "${PICFILE}" "${THEME}"
}

main "$@"

