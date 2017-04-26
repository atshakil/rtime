# RTime

RTime is a random timestamp generator.

## Installation

This app is intended to be used as a command-line utility.

Installation is as simple as,

    $ gem install rtime

If you eventually develop a taste for `rtime`'s tiny API, you may want to follow the steps below.

Add this line to your application's Gemfile:

```ruby
gem 'rtime'
```

And then execute:

    $ bundle

## Usage

```sh
rtime <start_date> <end_date> <coverage> [--night-only]
```

Here's an example use case:
```sh
$ rtime 20170127 20170130 100% --night
2017-01-27 20:48:48 +0000
2017-01-28 03:51:15 +0000
2017-01-29 01:15:47 +0000
2017-01-30 23:41:54 +0000
```

## Contributing

If you are interested in contributing, please [submit a pull request](https://help.github.com/articles/about-pull-requests/).

## License

[MIT](http://opensource.org/licenses/MIT).
