# docker-imagemagick
Docker with ImageMagick tools

## build

    git clone https://github.com/gustavopaes/docker-imagemagick.git
    cd docker-imagemagick/
    docker build -t docker-imagemagick .

## run command

You need mount volume where your target image is:

    docker run -v /home/gpaes/images/:/temp -w /temp docker-imagemagick convert -quality 70 original.png converted.jpg

The `converted.jpg` will be created on the same `original.png` path.

If you are in the same target image path, you can run:

    docker run -v `pwd`:/temp -w /temp docker-imagemagick convert -quality 70 original.png converted.jpg
