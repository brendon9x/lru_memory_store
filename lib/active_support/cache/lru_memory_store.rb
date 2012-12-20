require 'active_support'

module ActiveSupport
  module Cache
    class LruMemoryStore < Store
      attr_reader :store, :num_slots

      # Returns a memory store with LRU eviction.
      def initialize(options = {})
        super
        @store = ActiveSupport::OrderedHash.new
        @num_slots = options[:num_slots] || 10
      end

      # Inserts the value into the cache collection or updates the existing value.
      def write(key, value, options=nil)
        @store.delete(key)
        @store[key] = value
        @store.delete(@store.keys.first) if @store.size > @num_slots
      end

      # Reads the value from the cache collection.
      def read(key, options=nil)
        value = @store.delete(key)
        @store[key] = value if value
        value
      end

      # Takes the specified value out of the collection.
      def delete(key, options=nil)
        @store.delete(key)
      end

      # Takes the value matching the pattern out of the collection.
      def delete_matched(key, options=nil)
        keys = @store.keys.each.select { |k| k =~ key }
        keys.each { |k| @store.delete k }
      end

      # Wipes the whole cache.
      def clear
        @store.clear
      end
    end
  end
end