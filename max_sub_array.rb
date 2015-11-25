class MaxSubArray
  attr_accessor :array
  def initialize(array=[])
    @array = array
  end

  def find_maximum
    return find_maximum_sub_array(@array, 0, @array.length - 1)
  end

  def find_max_crossing_sub_array(array, low, mid, high)
    max_left, max_right = 0
    left_sum = -1.0 / 0
    sum = 0
    (mid..low).each{ |i|
      sum = sum + array[i]
      if sum > left_sum
        left_sum = sum
        max_left = i
      end
    }
    right_sum = -1.0 / 0
    sum = 0
    (mid + 1..high).each{ |j|
      sum = sum + array[j]
      if sum > right_sum
        right_sum = sum
        max_right = j
      end
    }
    return max_left, max_right, left_sum + right_sum
  end

  def find_maximum_sub_array(array, low, high)
    if high == low
      return low, high, array[low]
    elsif (mid = ((low + high) / 2))
      left_low, left_high, left_sum = find_maximum_sub_array(array, low, mid)
      right_low, right_high, right_sum = find_maximum_sub_array(array, mid + 1, high)
      cross_low, cross_high, cross_sum = find_max_crossing_sub_array(array, low, mid, high)
      if left_sum >= right_sum and left_sum >= cross_sum
        return left_low, left_high, left_sum
      elsif right_sum >= left_sum and right_sum >= cross_sum
        return right_low, right_high, right_sum
      else
        return cross_low, cross_high, cross_sum
      end
    end
  end
end

if __FILE__ == $0
  array = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]
  max_sub_array = MaxSubArray.new(array)
  puts max_sub_array.find_maximum
end