class MergeSort
  attr_accessor :array
  def initialize(array=[])
    @array = array
  end

  def do_sort
    merge_sort @array, 0, @array.length - 1
  end

  def merge_sort(array, p, r)
    if p < r
      q = ((p + r) / 2).floor
      merge_sort(array, p, q)
      merge_sort(array, q + 1, r)
      merge(array, p, q, r)
    end
  end

  def merge(array, p, q, r)
    n1 = q - p + 1
    n2 = r - q
    left_array = array[p..q]
    right_array = array[q + 1..r]
    left_array[n1] = 1.0 / 0
    right_array[n2] = 1.0 / 0
    i = 0
    j = 0
    (p..r).each{ |k|
      if left_array[i] <= right_array[j]
        array[k] = left_array[i]
        i += 1
      else
        array[k] = right_array[j]
        j += 1
      end
    }
  end
end

if __FILE__ == $0
  while true
    puts 'MergeSort Algorithm'
    puts 'This algorithm will sort an array of n length'
    print 'n: '
    begin
      n = Integer(gets)
      if n == 0
        puts 'Bye...'
        break
      elsif n >= 99999
        puts "Don't get too excited!"
        break
      end

      array = []
      (0..n - 1).each { |i|
        array[i] = rand max=n
      }
      merge_sort = MergeSort.new(array)

      puts merge_sort.array.join(', ')

      start_time = Time.new

      merge_sort.do_sort

      end_time = Time.new - start_time
      puts merge_sort.array.join(', ')

      puts "#{array.length} elements sorted in #{(end_time * 1000).round(2)}ms"
      puts '----------------------------------------------'
    rescue
      puts "That's not an integer!"
    end
  end
end