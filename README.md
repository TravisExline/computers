# Computers

Gives a quick, detailed summary of the top computers of 2019 thus far.  Can display specs as well as brands according to the available computer models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'computers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install computers

## Usage

Follow the instructions given in the CLI, and explore the different computers!

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'incredible-demo-1397'/computers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Computers project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'incredible-demo-1397'/computers/blob/master/CODE_OF_CONDUCT.md).

Deliverables for next review

Refactoring:

*  Brand class
    Create a find_or_create_by class method
    Create a find_by_index class method

*  cli.rb - lines 32-34
    Can we find a brand based on user input, save it to a variable, and then call an instance method on that brand to get us back its computers?

* cli.rb - line 40
    Allow a user to see more information about a particular computer from the Brand options, and create the necessary logic to allow a user to return to all computers, brands, exit, etc.
