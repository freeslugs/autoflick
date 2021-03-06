# AutoFlick

Upload photos directly to flickr to utilize the 1TB of free storage. Uses Phantomjs to hack Flickr's oauth. 
Inspired by kzeng10 and stegastore. 

## Installation

Note: This gem uses phantomjs. `brew install phantomjs` or `npm install phantomjs`. 

Add this line to your application's Gemfile:

```ruby
gem 'auto_flick'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install auto_flick

Note: In order to use the Gem, you must first have a flickr account and sign up and create a flickr app. https://www.flickr.com/services/apps/create/

## Usage

Configure the gem:

```ruby
AutoFlick.config({
  username: "my_username_here",
  password: "my_password_here",
  api_key: "my_api_key_here",
  shared_secret: "my_api_secret_here"
})
```

And then `AutoFlick.upload('path_to_photo')` will upload the photo and return the full res url.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Publishing

**This is for me to remember**
update version number.
`rake install`
`gem push pkg/auto_flick-0.1.1.gem`
done. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/freeslugs/auto_flick. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).