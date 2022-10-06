

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

## prepare database
```bash
source ./load_env.sh
rake db:create
rake db:migrate
rake billing_plans:initialize_defaults
rake data_migrations:create_default_billing_plans
rake data_migrations:billing_plan_bandwidths
rake data_migrations:initialize_user_bandwidths
rake data_migrations:create_developer_billing_plans

rake db:seed


```

docker build  \
--build-arg "HTTP_PROXY=http://host.docker.internal:10809/" \
--build-arg "HTTPS_PROXY=http://host.docker.internal:10809/" \
--build-arg "NO_PROXY=localhost,127.0.0.1,.example.com" \
-t sucicada/notebook.ai:latest  .

docker build . --network host -t sucicada/notebook.ai:latest  

docker run -itd --name notebook.ai -p 41410:3000 --env-file .env sucicada/notebook.ai


## knowledge
Sidekiq need redis 

## fuck log
- pkg-config from brew is bad  
  segmentation fault  pkg-config --list-all
  (spend 3h)
- https://github.com/thoughtbot/paperclip/issues/2151
