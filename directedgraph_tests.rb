require "minitest/autorun"
require_relative "directedgraph.rb"
class DirectedGraphTest < Minitest::Test

  def setup
    @test = DirectedGraph.new
    @test.create_graph
  end

  def test_one_equals_one
    assert_equal(1,1)
  end

  def test_route_one_shortest_path
    path = ["A","B","C"]
    assert_equal(path, @test.find_shortest_path("A","C"))
  end

  def test_route_two_shortest_path
    path = ["A", "D"]
    assert_equal(path, @test.find_shortest_path("A","D"))
  end

  def test_route_one_cost
    path1 = ["A","B","C"]
    path = @test.find_path_cost(path1)
    assert_equal(path, 9)
  end


end