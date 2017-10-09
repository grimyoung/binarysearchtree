module BinarySearchTree
  class Node
    attr_reader :value
    attr_accessor :left_child, :right_child
    def initialize(value = nil, left_child = nil, right_child = nil)
      @value = value
      @left_child = left_child
      @right_child = right_child
    end

    def add_child(value)
      if @value == nil
        @value = value
      else
        case @value <=> value
        when 1
          add_left(value)
        when -1
          add_right(value)
        end
      end
    end

    def add_left(value)
      if self.left_child == nil
        self.left_child = Node.new(value)
      else
        left_child.add_child(value)
      end
    end

    def add_right(value)
      if self.right_child == nil
        self.right_child = Node.new(value)
      else
        right_child.add_child(value)
      end
    end

    def build_tree(array)
      array.each do |element|
        self.add_child(element)
      end
    end
  end
end