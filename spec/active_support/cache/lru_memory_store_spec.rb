require 'active_support/cache/lru_memory_store'

module ActiveSupport
  module Cache
    describe LruMemoryStore do
      describe :initialize do
        it "can take no args" do
          store = ActiveSupport::Cache.lookup_store :lru_memory_store
          store.should be_a ActiveSupport::Cache::LruMemoryStore
        end

        it "can num_slots argument" do
          store = ActiveSupport::Cache.lookup_store :lru_memory_store, 10
          store.num_slots.should == 10
        end
      end

      describe :caching do
        before :each do
          @store = ActiveSupport::Cache.lookup_store :lru_memory_store, 2
        end

        it "should cache up to the number of slots" do
          @store.write(:a, "a")
          @store.write(:b, "b")
          @store.read(:a).should == "a"
          @store.read(:b).should == "b"
          @store.write(:c, "c")
          @store.read(:a).should be_nil
        end

        it "should delegate delete_matched" do
          @store.write "hello", "hello"
          @store.write "hello world", "hello world"
          @store.delete_matched /world/
          @store.read("hello").should_not be_nil
          @store.read("hello world").should be_nil
        end

        it "should delegate clear" do
          @store.write :a, "a"
          @store.clear
          @store.read(:a).should be_nil
        end

      end
    end
  end
end