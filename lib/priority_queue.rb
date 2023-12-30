class PriorityQueue
  def initialize
    @elements = [nil]
  end

  def <<(element)
    @elements << element
    bubble_up(@elements.length - 1)
  end

  def pop
    exchange(1, @elements.length - 1)
    max = @elements.pop
    bubble_down(1)
    max
  end

  def empty?
    @elements.length == 1
  end

  private

  def bubble_up(index)
    parent_index = (index / 2)
    return if index <= 1
    comparison = @elements[parent_index] <=> @elements[index]
    return if comparison == -1
    exchange(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = (index * 2)
    return if child_index > @elements.length - 1
    not_the_last_element = child_index < @elements.length - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]
    left_right_comparison = left_element <=> right_element
    child_index += 1 if not_the_last_element && left_right_comparison == 1
    child_comparison = @elements[index] <=> @elements[child_index]
    return if child_comparison == -1
    exchange(index, child_index)
    bubble_down(child_index)
  end

  def exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end
end