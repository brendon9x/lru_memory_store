require "lru_memory_store/version"

module ActiveSupport
  module Cache
    autoload :LruMemoryStore, 'active_support/cache/lru_memory_store'
  end
end
