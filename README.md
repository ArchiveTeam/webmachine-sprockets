# webmachine-sprockets [![Build Status](https://travis-ci.org/lgierth/webmachine-sprockets.png?branch=master)](https://travis-ci.org/lgierth/webmachine-sprockets)

Webmachine for Ruby: Sprockets integration

> Sprockets is a Ruby library for compiling and serving web assets. It features declarative dependency management for JavaScript and CSS assets, as well as a powerful preprocessor pipeline that allows you to write assets in languages like CoffeeScript, Sass, SCSS and LESS.

[github.com/sstephenson/sprockets](https://github.com/sstephenson/sprockets)

> webmachine-ruby is a port of Webmachine, which is written in Erlang. The goal of both projects is to expose interesting parts of the HTTP protocol to your application in a declarative way. This means that you are less concerned with handling requests directly and more with describing the behavior of the resources that make up your application. Webmachine is not a web framework per se, but more of a toolkit for building HTTP-friendly applications. For example, it does not provide a templating engine or a persistence layer; those choices are up to you.

[github.com/seancribbs/webmachine-ruby](https://github.com/seancribbs/webmachine-ruby)


Usage
-----

```ruby
require 'webmachine'
require 'webmachine/sprockets'

MyApp = Webmachine::Application.new do |app|
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'app/assets/javascripts'

  Webmachine::Sprockets::Resource.sprockets = sprockets
  app.add_route [ 'assets', '*' ], Webmachine::Sprockets::Resource
end
```


Contributing
------------

1. Fork at [github.com/lgierth/webmachine-sprockets](https://github.com/lgierth/webmachine-sprockets)
2. Create a branch and add your commits
4. Open a Pull Request

You can also open an issue for discussion first, if you like.


Unlicense
---------

webmachine-sprockets is free and unencumbered public domain software. For more
information, see [unlicense.org](http://unlicense.org/) or the accompanying
UNLICENSE file.
