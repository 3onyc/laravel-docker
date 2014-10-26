## Laravel Docker

**NOTE** Only works if Docker is running on the same host.

*Currently working on a replacement, but feel free to use this*

### Software used

* [HHVM](http://hhvm.com/)
* [NGINX](http://nginx.org/)
* [runit](http://smarden.org/runit/)

### Quickstart (For development)

1. Create a project using composer
   `composer create-project 3onyc/laravel-docker <name>`

2. Copy `Makefile.example` to `Makefile`

3. Configure the `Makefile` to your liking:

```
# Port on host to listen on
PORT=8080
# App name, used in docker image name
APP=laravel
# Used in docker image name <VENDOR>>/<APP>-prod
VENDOR=acme
# User in Dockerfile
MAINTAINER=Foo <foo@acme.tld>
# Name for the `make run` docker container
CONTAINER=$(VENDOR)-$(APP)-web
# your UID on the host, nginx/hhvm will run as this UID so they can read/write files.
UID=1000
```

4. Execute `make run` and wait until it's completed

5. Navigate to `http://localhost:<PORT>` (Default port: 8080) in your browser

6. The Laravel 'You have arrived' page should now display, you can edit the application as
   you would normally. Logs from the container are available in `app/storage/logs/dev`

### Todo

1. Figure out way to skip `composer install` when building for dev (a base image for both?)
2. Look at alternatives to Makefile (artisan commands?)
3. Linking to database/other containers (sounds like this could be neatly integrated using artisan or at least PHP)

### Contributing

Pull requests, bug reports and suggestions are welcome, use GitHub's built-in features.

## Laravel PHP Framework

[![Build Status](https://travis-ci.org/laravel/framework.svg)](https://travis-ci.org/laravel/framework)
[![Total Downloads](https://poser.pugx.org/laravel/framework/downloads.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Stable Version](https://poser.pugx.org/laravel/framework/v/stable.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Unstable Version](https://poser.pugx.org/laravel/framework/v/unstable.svg)](https://packagist.org/packages/laravel/framework)
[![License](https://poser.pugx.org/laravel/framework/license.svg)](https://packagist.org/packages/laravel/framework)

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable, creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as authentication, routing, sessions, and caching.

Laravel aims to make the development process a pleasing one for the developer without sacrificing application functionality. Happy developers make the best code. To this end, we've attempted to combine the very best of what we have seen in other web frameworks, including frameworks implemented in other languages, such as Ruby on Rails, ASP.NET MVC, and Sinatra.

Laravel is accessible, yet powerful, providing powerful tools needed for large, robust applications. A superb inversion of control container, expressive migration system, and tightly integrated unit testing support give you the tools you need to build any application with which you are tasked.

## Official Documentation

Documentation for the entire framework can be found on the [Laravel website](http://laravel.com/docs).

### Contributing To Laravel

**All issues and pull requests should be filed on the [laravel/framework](http://github.com/laravel/framework) repository.**

### License

The Laravel framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
