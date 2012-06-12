# LruMemoryStore

An extremely simple LRU Memory Store designed to replace the Rails MemoryStore with an LRU cache eviction strategy.
Currently, Rails 2.x only.

## Installation

Add this line to your application's Gemfile:

    gem 'lru_memory_store'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lru_memory_store

## Usage

Add this line to environment.rb for a 100 slot cache:

    config.cache_store :lru_memory_store, 100

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
