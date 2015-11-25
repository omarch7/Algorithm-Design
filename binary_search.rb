class BinarySearch
  attr_accessor :array
  def initialize(array=[])
    @array = array
  end

  def do_search(key=0)
    return binary_search(@array, key, 0, @array.length - 1)
  end

  def binary_search(array, key, min, max)
    if max < min
      return nil
    else
      mid = (min + max) / 2
      if array[mid] > key
        return binary_search(array, key, min, mid - 1)
      elsif array[mid] < key
        return binary_search(array, key, mid + 1, max)
      else
        return mid
      end
    end
  end
end

if __FILE__ == $0
  array = [5, 3, 7, 8, 32, 1, 75, 32, 74, 78, 99, 12]
  array = array.sort
  binary_search = BinarySearch.new(array)
  puts binary_search.array.join(', ')
  puts binary_search.do_search(74)
end