class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.inject do |acc, ele|
      if ele.nil?
        acc
      else
        ele1 = (acc).to_s(2)
        ele2 = (ele).to_s(2)
        acc = (ele1 ^ ele2).to_s(2)
      end
    end
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
