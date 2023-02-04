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

  def find(subsets, x)
    unless subsets[x].parent == x
      subsets[x].parent = find(subsets, subsets[x].parent)
    end
    subsets[x].parent
  end

  def Union(subsets, x, y)
    xroot = find(subsets, x)
    yroot = find(subsets, y)

    if subsets[xroot].rank < subsets[yroot].rank
      subsets[xroot].parent = yroot
    elsif subsets[yroot].rank < subsets[xroot].rank
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
      i += 1

      x = find(subsets, next_edge.src)
      y = find(subsets, next_edge.dest)

      if x != y
        result[e] = next_edge
        e += 1
        Union(subsets, x, y)
      end
    end

    textResult = "Following are the edges in the constructed MST\n"
    minimumCost = 0
    for i in 0.. e - 1
      textResult += "#{result[i].src} -- #{result[i].dest} == #{result[i].weight}\n"
      minimumCost += result[i].weight
    end
    textResult += "Minimum Cost Spanning Tree: #{minimumCost}\n"

    return textResult
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

    textResult = graph.KruskalMST()

    puts textResult

    expect(textResult).to be_include("2 -- 3 == 4")
    expect(textResult).to be_include("0 -- 3 == 5")
    expect(textResult).to be_include("0 -- 1 == 10")
    expect(textResult).to be_include("Minimum Cost Spanning Tree: 19")
  end
end
