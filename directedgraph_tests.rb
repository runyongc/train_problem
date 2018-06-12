require "minitest/autorun"
require_relative "directedgraph"
class DirectedGraphTest < Minitest::Test

  def test_one_equals_oneg
    assert_equal(1,1)
  end

  def test_route_one_distance
    assert_equal(9, find_distance(A, C))
  end

end