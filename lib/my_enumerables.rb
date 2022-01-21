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
