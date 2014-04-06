# Framework7::Rails

Brings the excellent [Framework7](https://github.com/nolimits4web/framework7/) into the Rails 3.1+ Asset Pipeline.

The gem version number ``x.y.z`` is kept in sync with the version of Framework7 being supported.

## Installation

Add this line to your application's Gemfile:

    gem 'framework7-rails'

And then execute:

    $ bundle

Or, install it yourself as:

    $ gem install framework7-rails

## Usage

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

## Future Improvements

Currently, the gem only brings in the assets. But it is the intention to add layout/view generators and helpers.

## Contributing

1. Fork it ( http://github.com/twss/framework7-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
