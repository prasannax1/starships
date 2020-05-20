# Assumption - images to make movie out of are going to be in same dir
# and they are going to be named framexxxxx.png

# First make background black
echo "Making background black"
mogrify \
    -fuzz 0% \
    -fill none \
    -draw "matte 0,0 floodfill" \
    -background black \
    -flatten \
    *.png
echo "making background black done"

# Then resize image
echo "resizing images to 1280x720"
mogrify \
    -resize 1280x720 \
    *.png
echo "resizing images done"

# Image will have different aspect ratio - fix it or ffmpeg complains
echo "applyimng black border"
mogrify \
    -background black \
    -gravity center \
    -extent 1280x720 \
    *.png
echo "applying black border done"


# Finally make movie
echo "making movie"
ffmpeg \
    -r 60 \
    -f image2 \
    -s 1280x720 \
    -i frame%05d.png \
    -vcodec libx264 \
    -crf 25 \
    -pix_fmt yuv420p \
    anim.mp4
echo "making movie done"

# If movie successfully created, delete frame images
if [ $? -eq 0 ]
then
    echo "deleting frame images"
    rm frame?????.png
    echo "delting frame images done"
else
    echo "making movie failed"
fi

