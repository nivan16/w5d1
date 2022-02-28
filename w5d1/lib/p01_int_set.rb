class MaxIntSet
  attr_reader :set
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(@max) {false}
  end

  def insert(num)
    return false unless is_valid?(num) && !self.include?(num)
    @store[num] = true
    return true
  end

  def remove(num)
    return false if !is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    return @store[num] == true
  end

  private

  def is_valid?(num)
    raise 'Out of bounds' if num > @max || num < 0
    return true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num  unless self.include?(num)
  end

  def remove(num)
    # (0...@store.length).each{|i| @store[i].shift if @store[i].include?(num) }
    self[num].shift if self[num].include?(num)
  end

  def include?(num)
    @store.include?([num])
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self.include?(num)
    resize! if @count == num_buckets
    # i = 0
    # until self.include?(num) || i == num_buckets
    #   if @store[i].empty?
    #     @store[i] << num 
    #     @count += 1
    #   end
    #   i += 1
    # end
    if self[num].empty?
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].shift
      @count -= 1
    end
    # @store.each_with_index do |bucket, i|
    #   if @store[i].include?(num)
    #     @store[i].shift
    #     @count -= 1
    #   end
    # end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize! #is there no way to make this faster that O(n)?
    re_storing = @store
    @store += Array.new(num_buckets) { Array.new }
    # @store.sort
    @count = 0
    re_storing.each {|subarr| self.insert(subarr.shift) if subarr.length !=0}
  end
end

