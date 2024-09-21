# rspec-framework-led-matrix

A gem to display the results of your RSpec specs on your Framework LED Matrix.

## Installation


Install the gem and add to the application's Gemfile by executing:

```bash
bundle add rspec-framework-led-matrix
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install rspec-framework-led-matrix
```

## Usage

Run Rspec normally and the gem will hook in, generate a 9x34 image, and flash it to the LED Matrix for display using the vendored inputmodule-control_cli_linux.

It will ask you for `sudo` for now, which we can fix using a `udev` rule, but this works for all cases so keeping it for now.

See [inputmodule-rs releases](https://github.com/FrameworkComputer/inputmodule-rs/releases/tag/v0.2.0) in case the CLI needs to be updated. We can vendor in a new version if needed.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zachfeldman/rspec-framework-led-matrix. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/zachfeldman/rspec-framework-led-matrix/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rspec::Framework::Led::Matrix project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rspec-framework-led-matrix/blob/main/CODE_OF_CONDUCT.md).
