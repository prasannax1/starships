# Generate image from .scad file
# author - prasanna

# First get command line args
INFILE="$1"
OUTFILE="$2"
if [ $# -eq 3 ]; then
    THEME="$3"
else
    THEME="Tomorrow"
fi

# Set up some variables
RENDERCMD='flatpak run org.openscad.OpenSCAD/x86_64/stable'

# Util functions
render() {
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
render "${INFILE}" "${OUTFILE}" "${THEME}"

