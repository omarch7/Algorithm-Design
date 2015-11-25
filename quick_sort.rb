class QuickSort
  attr_accessor :array
  def initialize(array = [])
    @array = array
  end

  def do_sort
    sort @array, 0, @array.length - 1
  end

  def sort(array, p, r)
    if p < r
      q = partition array, p, r
      sort array, p, q - 1
      sort array, q + 1, r
    end
  end

  def partition(array, p, r)
    x = array[r]
    i = p - 1
    (p..r - 1).each { |j|
      if array[j] <= x
        i += 1
        array[i], array[j] = array[j], array[i]
      end
    }
    array[i + 1], array[r] = array[r], array[i + 1]
    return i + 1
  end
end

if __FILE__ == $0
  while true
    puts 'QuickSort Algorithm'
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

      quick_sort = QuickSort.new(array)

      puts quick_sort.array.join(', ')

      start_time = Time.new

      quick_sort.do_sort

      end_time = Time.new - start_time

      puts quick_sort.array.join(', ')

      puts "#{array.length} elements sorted in #{(end_time * 1000).round(2)}ms"
      puts '----------------------------------------------'
    rescue
      puts "That's not an integer!"
    end
  end
end