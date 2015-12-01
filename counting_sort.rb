class CountingSort
  attr_accessor :array
  def initialize(array=[])
    @array = array
  end

  def do_sort
    counting_sort(@array, @array.max)
  end

  def counting_sort(arrayA, k)
    arrayC = Array.new
    arrayB = Array.new
    (0..k).each{ |j|
      arrayC[j] = 0
    }
    (0..arrayA.length - 1).each{ |j|
      arrayC[arrayA[j]] += 1
    }
    (0..k).each{ |i|
      arrayC[i] = arrayC[i] + arrayC[i - 1]
    }
    (arrayA.length - 1).downto(0).each{ |j|
      arrayB[arrayC[arrayA[j]] - 2] = arrayA[j]
      arrayC[arrayA[j]] -= 1
    }
    @array = arrayB
  end
end

if __FILE__ == $0
  array = []
  n = 100
  (0..n - 1).each { |i|
    array[i] = rand max=n
  }
  counting_sort = CountingSort.new(array)
  puts counting_sort.array.join(', ')
  start_time = Time.new

  counting_sort.do_sort

  end_time = Time.new - start_time
  puts counting_sort.array.join(', ')
  puts "#{array.length} elements sorted in #{(end_time * 1000).round(2)}ms"
  puts
end