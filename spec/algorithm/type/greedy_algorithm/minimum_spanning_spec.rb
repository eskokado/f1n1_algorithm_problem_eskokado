class Graph
  attr_accessor :V, :E, :edge

  def initialize(v, e)
    @V = v
    @E = e
    @edge = []
    for i in 0..e - 1
      @edge.push(Edge.new)
    end
  end

  def find(subsets, i)
    if (subsets[i].parent != i)
      subsets[i].parent = find(subsets, subsets[i].parent)
    end
    return subsets[i].parent
  end

  def Union(subsets, x, y)
    xroot = find(subsets, x)
    yroot = find(subsets, y)

    if subsets[xroot].rank < subsets[yroot].rank
      subsets[xroot].parent = yroot
    elsif  subsets[xroot].rank > subsets[yroot].rank
      subsets[yroot].parent = xroot
    else
      subsets[yroot].parent = xroot
      subsets[xroot].rank += 1
    end
  end

  def KruskalMST
    result = []
    for i in 0..(@V - 1)
      result.push(Edge.new)
    end
    @edge.sort_by! {|e| e.weight}

    subsets = []
    for i in 0..(@V - 1)
      subsets.push(Subset.new)
      subsets[i].parent = i
      subsets[i].rank = 0
    end
    i = 0
    e = 0
    while e < (@V - 1) do
      next_edge = Edge.new
      next_edge = edge[i]

      x = find(subsets, next_edge.src)
      y = find(subsets, next_edge.dest)

      if x != y
        result[e] = next_edge
        Union(subsets, x, y)
        e += 1
      end
      i += 1
    end

    puts "Following are the edges in the constructed MST"
    minimumCost = 0
    for i in 0.. e - 1
      puts "#{result[i].src} -- #{result[i].dest} == #{result[i].weight}"
      minimumCost += result[i].weight
    end
    puts "Minimum Cost Spanning Tree: #{minimumCost}"
  end

end

class Edge
  attr_accessor :src, :dest, :weight
end

class Subset
  attr_accessor :parent, :rank
end

describe "Minimum Spanning" do
  it "description" do
    # Number of vertices in graph
    v = 4
    # Number of edges in graph
    e = 5
    graph = Graph.new(v, e)

    # add edge 0-1
    graph.edge[0].src = 0
    graph.edge[0].dest = 1
    graph.edge[0].weight = 10

    # add edge 0-2
    graph.edge[1].src = 0
    graph.edge[1].dest = 2
    graph.edge[1].weight = 6

    # add edge 0-3
    graph.edge[2].src = 0
    graph.edge[2].dest = 3
    graph.edge[2].weight = 5

    # add edge 1-3
    graph.edge[3].src = 1
    graph.edge[3].dest = 3
    graph.edge[3].weight = 5

    # add edge 2-3
    graph.edge[4].src = 2
    graph.edge[4].dest = 3
    graph.edge[4].weight = 4

    graph.KruskalMST()
  end
end
