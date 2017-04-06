#!/usr/bin/env sh


setup()
{
    docker build -t mine:tumblr .
    docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 bundle install
    docker run --rm --label=tumblr --volume=$(pwd):/root/ -it -p 127.0.0.1:4567:4567 mine:tumblr tumblr authorize
}

post()
{
    #docker run --rm --label=tumblr -v $(pwd)/.tumblr:/root/.tumblr -v $(pwd):/usr/src/app/ -it mine:tumblr tumblr post $
    echo $fname
}

case "$1" in
	  setup)
		   setup
		    ;;
	  post)
	  	   fname=$2
		   post
		    ;;
	  *)
		    echo $"Usage: $0 {setup,post} [fname]"
		    exit 1
esac
