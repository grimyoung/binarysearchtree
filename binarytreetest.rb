require_relative "binarysearchtree"

test = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]

bin_tree = BinarySearchTree::Node.new()
bin_tree.build_tree(test)
p bin_tree.breadth_first_search(9)
