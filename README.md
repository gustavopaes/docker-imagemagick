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

## performance

    gpaes@cebola:~/temp$ du -h original.png 
    45M	original.png

    gpaes@cebola:~/temp$ time docker run -v `pwd`:/temp -w /temp docker-imagemagick convert -quality 70 original.png docker.jpg
    real	0m3.327s
    user	0m0.020s
    sys     0m0.020s

    gpaes@cebola:~/temp$ time convert -quality 70 original.png local.jpg
    real	0m2.556s
    user	0m2.316s
    sys	    0m0.224s

    gpaes@cebola:~/temp$ du -h *
    3.5M	docker.jpg
    3.5M	local.jpg
    45M	    original.png
