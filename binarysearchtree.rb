module BinarySearchTree
  class Node
    attr_reader :value
    attr_accessor :left_child, :right_child, :root
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
      if @left_child == nil
        @left_child = Node.new(value)
      else
        @left_child.add_child(value)
      end
    end

    def add_right(value)
      if @right_child == nil
        @right_child = Node.new(value)
      else
        @right_child.add_child(value)
      end
    end

    def build_tree(array)
      @root = Node.new(array[0])
      array[1..-1].each do |element|
        @root.add_child(element)
      end
    end

    #can ignore left child if target is bigger than the value at node
    #can ignore right child if target is lesser than the value at node
    def breadth_first_search(target)
      queue = [@root]
      while ! queue.empty?
        node = queue.shift
        if node.value == target
          return node
        else
          if node.value > target && node.left_child != nil
            queue = queue << node.left_child
          end
          if node.value < target && node.right_child != nil  
            queue = queue << node.right_child
          end
        end
      end
      return nil
    end

    #preorder root left right
    def depth_first_search(target)
      stack = [@root]
      while ! stack.empty?
        node = stack.pop
        if node.value == target
          return node
        else 
          if node.value < target && node.right_child != nil
            stack = stack << node.right_child
          end
          if node.value > target && node.left_child != nil
            stack = stack << node.left_child
          end
        end
      end
      return nil
    end

    def dfs_rec(node, target)
      if node == nil
        return
      elsif node.value == target
        return node
      else
        if node.value > target
          dfs_rec(node.left_child, target)
        else
          dfs_rec(node.right_child, target)
        end
      end
    end
  end
end