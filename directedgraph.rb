require 'rgl/adjacency'
require 'rgl/dijkstra'
require 'rgl/traversal'


class DirectedGraph
  attr_accessor :graph, :allpaths

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
    @allpathsgraph = Hash.new {|hash, key| hash[key] = []}
    @allpaths = []
  end

  def addEdge(a, b)
    @allpathsgraph[a] << b
  end

  def create_graph
    @graph = RGL::DirectedAdjacencyGraph.new
    @weights.each { |(vertice1, vertice2), weight| @graph.add_edge(vertice1, vertice2) }
    addEdge('A','B')
    addEdge('B','C')
    addEdge('C','D')
    addEdge('D','C')
    addEdge('D','E')
    addEdge('A','D')
    addEdge('C','E')
    addEdge('E','B')
    addEdge('A','E')
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
        if @weights.has_key?(cost.chars) == false
          return "NO SUCH ROUTE"
        end
        @totalcost = @totalcost + @weights[cost.chars]
      end
    end
  end

  def getAllPaths(u, d, visited, path, pathdepth = 1)
    visited[u] = true if u != d
    path = path + [u]

    if u == d && pathdepth > 1
      @allpaths << [path]
    else
      @allpathsgraph[u].each do |i|
        if visited[i] == false
          getAllPaths(i, d, visited, path, pathdepth + 1)
          path.pop() if u != d
          visited[u] = false
        end
      end
    end
  end

  def startGetAllPaths(s, d, maxpathlength)
    visited = Hash.new(false)
    path = []
    totalpaths = []
    getAllPaths(s, d, visited, path)
    allpaths.uniq.each do |v|
      if v[0].length <= maxpathlength + 1
        totalpaths << v
      end
    end
    totalpaths.length
  end

end