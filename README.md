# Framework7::Rails

[![Gem Version](https://badge.fury.io/rb/framework7-rails.svg)](http://badge.fury.io/rb/framework7-rails)

Brings the excellent [Framework7](https://github.com/nolimits4web/framework7/)
into the Rails 3.1.x - 4.x Asset Pipeline.

The gem version number `x.y.z` is kept in sync with the version of Framework7
being supported.

## Installation

Add this line to your application's Gemfile:

    gem 'framework7-rails'
    
If you want bleeding edge, not yet in ruby gems version, add this instead:

    gem 'framework7-rails', :git => 'https://github.com/twss/framework7-rails.git'`

And then execute:

    $ bundle

Or, install it yourself as:

    $ gem install framework7-rails

## Usage

The easiest way to set up ready for use is to use the generator

    $ rails g f7:install

You can do it manually if you want to, as outlined below:

In your application.js file, add the line:

    //= require framework7
   
In your application.css file, add the line:

    *= require framework7
    *= require framework7.theme

## Generators

### f7:install

This generator will add the necessary require statements as outlined above.

### f7:layout

This sets up an application-level layout, and will generate two files:

    app/assets/javascripts/<app_name>.js or app/assets/javascripts/<app_name>.coffee
    app/views/layouts/application.html.erb

For now, at least, the javascript generated has been scaled back, to be:

```javascript
window.F7H = {
  app: new Framework7(),
  dom: Dom7
};

window.Phone = {
  Views: {}
};

Phone.Views.Main = F7H.app.addView('.view-main', {
  dynamicNavbar: true
});
```

### f7:install:examples

*Removed, as they didn't really add anything of value.*

### And there's more...

To find out about the rest of the generators, be sure to 
[check out the wiki][wiki], which will
be updated as more become available.

## Helpers

Refer to the [wiki] for the usage/documentation.

* [f7_app]
* [f7_views]
* [f7_view]
* [f7_navbar]
* [f7_pages]
* [f7_page]

## Future Improvements

In the immediate future we'd like to:

* Make the code a bit more DRY.
* Move all the grunt work out of the helpers, into Presenters/Decorators.
* Add javascript generation for the more dynamic elements.

## Contributing

1. Fork it [http://github.com/twss/framework7-rails/fork](http://github.com/twss/framework7-rails/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create new Pull Request.


[wiki]: https://github.com/twss/framework7-rails/wiki "wiki"
[f7_app]: https://github.com/twss/framework7-rails/wiki/helpers/f7_app
[f7_navbar]: https://github.com/twss/framework7-rails/wiki/helpers/f7_navbar
[f7_page]: https://github.com/twss/framework7-rails/wiki/helpers/f7_page
[f7_pages]: https://github.com/twss/framework7-rails/wiki/helpers/f7_pages
[f7_view]: https://github.com/twss/framework7-rails/wiki/helpers/f7_view
[f7_views]: https://github.com/twss/framework7-rails/wiki/helpers/f7_views
