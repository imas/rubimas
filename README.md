# Rubimas

[![Build Status](https://travis-ci.org/imas/rubimas.png?branch=master)](https://travis-ci.org/imas/rubimas)

A reference for 765PRO all stars (include million stars)

This gem is inspired by [sue445/rubicure](https://github.com/sue445/rubicure) strongly.

## Installation

Add this line to your application's Gemfile:

```
gem 'rubimas'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install rubimas
```

## Usage

```ruby
require 'rubimas'
765.pro.haruka.name.full # => "天海春香"
765.pro.haruka.birthday # => "04/03"
765.pro.haruka.favorites # => ["歌うこと"]

# idol_id search
765.pro.find_by_id(39).name.full # => "馬場このみ"

# `Rubimas` is simple way to use rubimas.
Rubimas.find_by_id(39).name.full # => "馬場このみ"
Rubimas.find_by_name("馬場このみ").favorite # => ["日本酒"]
```


### How to use theaterdays idols

If you want to use new members of theaterdays, you can use them by calling `Rubimas.theaterdays!`

```ruby
require 'rubimas'

Rubimas.find_by_name('紬') # => Rubimas::Idol::UnknownIdolError (unknown idol: 紬)

Rubimas.theaterdays!

# You can search new idols
Rubimas.find_by_name("紬").favorite # => #<Rubimas::Idol: @idol_id=51, @key=:tsumugi, @name=#<Rubimas::Idol::Name: @family="白石", @family_kana="しらいし", @given="紬", @given_kana="つむぎ", @shorten="紬">...
```

## Contributing

1. Fork it ( https://github.com/imas/rubimas/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
