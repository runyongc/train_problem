require 'rgl/adjacency'
require 'rgl/dijkstra'

class DirectedGraph

  def initialize
    @weights = {
        ["A","B"] => 5,
        ["B","C"] => 4,
        ["C","D"] => 8,
        ["D","C"] => 8,
        ["D","E"] => 6,
        ["A","D"] => 5,
        ["C","E"] => 2,
        ["E","B"] => 3,
        ["A","E"] => 7
    }
  end

  def create_graph
    @graph = RGL::DirectedAdjacencyGraph.new
    @graph.add_vertices("A","B","C","D")
    @weights.each { |(vertice1, vertice2), weight| @graph.add_edge(vertice1, vertice2) }
  end

  def find_shortest_path(source, target)
    @graph.dijkstra_shortest_path(@weights, source, target)
  end

  def find_path_cost(path)
    @totalcost = 0
    path.each.with_index do |vertice, ndx|
      if path[ndx + 1] == nil
        return @totalcost
      else
        cost = (path[ndx] + path[ndx + 1])
        @totalcost = @totalcost + @weights[cost.chars]
      end
    end
  end
end