# Rubimas

[![Build Status](https://travis-ci.org/imas/rubimas.png?branch=master)](https://travis-ci.org/imas/rubimas)

A reference for 765PRO all stars (include million stars)

This gem is inspired by [sue445/rubicure](https://github.com/sue445/rubicure) strongly.

## Installation

Add this line to your application's Gemfile:

    gem 'rubimas'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubimas

## Usage

    require 'rubimas'
    765.pro.haruka.name
    # "天海春香"
    765.pro.haruka.birthday
    # "04/03"
    765.pro.haruka.favorites
    # ["歌うこと"]

    # idol_id search
    765.pro.find_by_id(39).name
    # "馬場このみ"

## Contributing

1. Fork it ( https://github.com/imas/rubimas/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
