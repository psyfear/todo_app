class TodoList < Array
  def self.load(file)
    todo_list = TodoList.new
    File.open(file).each_line{ |line|
      todo_list << line.chomp
    }
    todo_list
  end

  def initialize
  end

  def add(item)
    if item.is_a? TodoItem
      push item
    else
      push TodoItem.new(item)
    end
    
  end

  alias_method :<<, :add

  def write(file)
    File.open(file, 'w') do |f|
      select(&:done).each do |line|
        f.write("#{line}\n")
      end
    end

  end
end
