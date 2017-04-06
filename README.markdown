# How I set this up

I don't like having things installed.

It's better to use docker.


``` shell
docker build -t mine:tumblr .
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 bundle install
docker run --rm --label=tumblr --volume=$(pwd):/root/ -it -p 127.0.0.1:4567:4567 mine:tumblr tumblr authorize
```

This will do a number of things.

1. Build the container and tag it as `mine:tumblr`
2. Generate a `Gemfile.lock` if it doesn't exist.
3. Send you to a local page in which to put in your consumer and secret key. You will need to go to [this](http://0.0.0.0:4567) page to do that. Once that's done just `Ctrl-C`.
