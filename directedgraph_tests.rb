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

  def test_route_two_cost
    path1 = ["A", "D"]
    path = @test.find_path_cost(path1)
    assert_equal(path, 5)
  end

  def test_route_three_cost
    path1 = ["A", "D", "C"]
    path = @test.find_path_cost(path1)
    assert_equal(path, 13)
  end

  def test_route_four_cost
    path1 = ["A", "E", "B", "C", "D"]
    path = @test.find_path_cost(path1)
    assert_equal(path, 22)
  end

  def test_route_five_cost
    path1 = ["A", "E", "D"]
    path = @test.find_path_cost(path1)
    assert_equal(path, "NO SUCH ROUTE")
  end


end