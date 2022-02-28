class HashSet
  attr_reader :count
  attr_accessor :store
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count >= num_buckets
    if !self[key].include?(key)
      self[key] << key
      @count += 1
      return true
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].shift
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[(num.hash)% num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    re_storing = @store
    @store = Array.new(num_buckets*2){ Array.new }
    @count = 0
    re_storing.each {|key| self.insert(key)}
  end
end
