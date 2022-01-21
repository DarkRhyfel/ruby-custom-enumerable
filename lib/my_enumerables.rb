# frozen-string-literal: true

# Enumerable module
module Enumerable
  # Your code goes here
  def my_each_with_index(*args)
    return to_enum(__method__, *args) unless block_given?

    i = 0
    for element in self
      yield element, i
      i += 1
    end

    self
  end

  def my_select
    return to_enum(__method__) unless block_given?

    selected_elements = []

    for element in self
      selected_elements << element if yield(element)
    end

    selected_elements
  end

  def my_all?(pattern = nil)
    if block_given?
      for element in self
        return false unless yield(element)
      end
      true
    elsif !block_given? && pattern == nil
      for element in self
        return false unless element
      end
      true
    else
      for element in self
        case element
        in ^pattern
            result = true
        else
          result = false
        end

        break unless result
      end

      result
    end
  end

  def my_any?(pattern = nil)
    if block_given?
      for element in self
        return true if yield(element)
      end
      false
    elsif !block_given? && pattern == nil
      for element in self
        return true unless element
      end
      false
    else
      for element in self
        case element
        in ^pattern
            result = true
        else
          result = false
        end

        break if result
      end

      result
    end
  end

  def my_none?(pattern = nil)
    if block_given?
      for element in self
        return false if yield(element)
      end
      true
    elsif !block_given? && pattern == nil
      for element in self
        return false if element
      end
      true
    else
      for element in self
        case element
        in ^pattern
            result = false
        else
          result = true
        end

        break unless result
      end

      result
    end
  end

  def my_count(item = nil)
    count = 0

    if block_given?
      for element in self
        count += 1 if yield element
      end
    elsif item != nil
      for element in self
        count += 1 if element == item
      end
    else
      for _ in self
        count +=1
      end
    end
    
    count
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(__method__) unless block_given?

    for element in self
      yield element
    end

    self
  end
end
