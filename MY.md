

## on mac
```bash

brew update
brew install shared-mime-info
brew install libpq
gem install pg -v '1.2.3' -- --with-pg-config=/opt/homebrew/opt/libpq/bin/pg_config
brew install imagemagick@6
#brew install imagemagick

#export LDFLAGS="-L/opt/homebrew/opt/imagemagick@6/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/imagemagick@6/include"
#export C_INCLUDE_PATH=/opt/homebrew/opt/imagemagick@6/include/ImageMagick-6/
PKG_CONFIG_PATH="/opt/homebrew/opt/imagemagick@6/lib/pkgconfig" gem install rmagick -v 4.2.4

```

docker build  \
--build-arg "HTTP_PROXY=http://host.docker.internal:10809/" \
--build-arg "HTTPS_PROXY=http://host.docker.internal:10809/" \
--build-arg "NO_PROXY=localhost,127.0.0.1,.example.com" \
-t sucicada/notebook.ai:latest  .

docker build . --network host -t sucicada/notebook.ai:latest  

## knowledge
Sidekiq need redis 

## fuck log
- pkg-config from brew is bad  
  segmentation fault  pkg-config --list-all
  (spend 3h)
- https://github.com/thoughtbot/paperclip/issues/2151
