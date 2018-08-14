#!/usr/bin/env ruby

require 'set'

class Queue
  def initialize
    @q = []
  end

  def enqueue(v)
    @q.push(v)
  end

  def dequeue
    @q.shift
  end

  def empty?
    @q.empty?
  end
end

Node = Struct.new(:value, :left, :right) do
  def preorder(&block)
    yield value
    left&.preorder(&block)
    right&.preorder(&block)
  end

  def inorder(&block)
    left&.inorder(&block)
    yield value
    right&.inorder(&block)
  end

  def postorder(&block)
    left&.postorder(&block)
    right&.postorder(&block)
    yield value
  end

  def bfs(root = nil, &block)
    q = Queue.new
    q.enqueue(self)

    while !q.empty?
      root = q.dequeue
      yield root.value

      q.enqueue(root.left) if root.left
      q.enqueue(root.right) if root.right
    end
  end
end

TREE = Node.new(
  1,
  Node.new(
    2,
    Node.new(
      4,
      Node.new(7)
    ),
    Node.new(5)
  ),

  Node.new(
    3,
    Node.new(
      6,
      Node.new(8),
      Node.new(9)
    )
  )
)

def main
  preorder   = TREE.to_enum(:preorder).to_a.join('-')
  inorder    = TREE.to_enum(:inorder).to_a.join('-')
  postorder  = TREE.to_enum(:postorder).to_a.join('-')
  bfs        = TREE.to_enum(:bfs).to_a.join('-')

  puts "Preorder: #{preorder}"
  puts "Inorder: #{inorder}"
  puts "Postorder: #{postorder}"
  puts "BFS: #{bfs}"
end

main() if __FILE__ == $0
