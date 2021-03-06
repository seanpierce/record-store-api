# Record Store API
*using ruby-2.4.2*

Backend API developed using Ruby on Rails, using <a href="https://github.com/plataformatec/devise">devise</a> and <a href="https://github.com/gonzalo-bulnes/simple_token_authentication">simple_token_authentication</a> to authorize the API's endpoints. The frontend application was developed using VueJS.

### Dependencies
```
$ # Ruby Version 2.4.2
$ ruby -v

$ # Rails:
$ sudo gem install rails

$ # Bundler:
$ sudo gem install bundler

$ # postgresql:
$ brew install postgres

$ # configure postgres defaults
$ echo "export PGDATA=/usr/local/var/postgres" >> ~/.bash_profile
$ echo "export PGHOST=/tmp" >> ~/.bash_profile
$ source ~/.bash_profile

$ # NodeJS
$ brew install node
```

### Installing the API
```
$ git clone https://github.com/seanpierce/record-store-api
$ cd record-store-api
$ bundle install
$ postgres
$ rails db:setup
$ rails s # will serve on localhost:3000 by default
```

### Installing the App
```
$ cd record-store
$ npm install
$ npm run dev # will serve on localhost:8080 by default
```


### TODOs
* create server side pagination method for items
* create async search functionality for items
* implement legit front end grid system
