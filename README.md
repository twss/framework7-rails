# Framework7::Rails

[![Gem Version](https://badge.fury.io/rb/framework7-rails.svg)](http://badge.fury.io/rb/framework7-rails)

Brings the excellent [Framework7](https://github.com/nolimits4web/framework7/)
into the Rails 3.1+ Asset Pipeline.

The gem version number ``x.y.z`` is kept in sync with the version of Framework7
being supported.

## Installation

Add this line to your application's Gemfile:

    gem 'framework7-rails'

And then execute:

    $ bundle

Or, install it yourself as:

    $ gem install framework7-rails

## Usage

The easiest way to set up ready for use is to use the generator

    $ rails g f7:install

You can do it manually if you want to, as outlined below:

### Development/Debugging

In your application.js file, add the line:

    //= require framework7
   
In your application.css file, add the line:

    *= require framework7

### Production

In your application.js file, add the line:

    //= require framework7.min
   
In your application.css file, add the line:

    *= require framework7.min

## Generators

### f7:install

This generator will add the necessary require statements as outlined above.

### f7:layout

This sets up an application-level layout, and will generate two files:

    app/assets/javascripts/<app_name>.js.coffee
    app/views/layouts/application.html.erb
    
The javascript file creates a wrapping class around the main `Framework7` class.
This new class is named after your application, an instance is created with the
lower camel-cased application.

e.g If you did `rails new contacts_app` the javascript file will contain:

    var contactsApp;
    
    ContactsApp = function() {
      ...
    };
    
    contactsApp = new ContactsApp();

If you ever need to get back to the Framework7 application instance, this is
achieved as follows:

    app = contactsApp.getInstance();
    
This may be necessary for future plans, but not too sure. For now it will be
left in, but you can always fallback to the Framework7 native way of doing
things by using the above line and never touching that `contactsApp` variable
again.
    
### And there's more...

To find out about the rest of the generators, be sure to 
[check out the wiki][wiki], which will
be updated as more become available.

## Helpers

None yet, but this will be listed here, and refer to the [wiki] for the
documentation.

## Future Improvements

Currently, the gem only brings in the assets. But it is the intention to add
layout/view generators and helpers.

## Contributing

1. Fork it ( http://github.com/twss/framework7-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[wiki]: https://github.com/twss/framework7-rails/wiki "wiki"
