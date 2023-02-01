class KruskalsMST
  def main()
    @V = 4
    @graphEdges = [
      Edge.new(0, 1, 10),
      Edge.new(0, 2, 6),
      Edge.new(0, 3, 5),
      Edge.new(1, 3, 5),
      Edge.new(1, 3, 15),
      Edge.new(2, 3, 4)
    ]
    @graphEdges.sort {|a,b| a.weight <=> b.weight}
  
    kruskals(@V, @graphEdges)
  end
end

class Edge < KruskalsMST
  attr_accessor :src, :dest, :weight
  def initialize(src, dest, weight)
    @src = src
    @dest = dest
    @weight = weight
  end
end

class Subset
  attr_accessor :parent, :rank
  def initialize(parent, rank)
    @parent = parent
    @rank = rank
  end
end

def kruskals(v, edges)
  @j = 0
  @noOfEdges = 0

  @subsets = []
  for i in 0..(v-1)
    @subsets.push(Subset.new(i, 0))
  end

  @results = []
  for i in 0..(v-1)
    @results.push(Edge.new(0, 0, 0))
  end

  puts "Funcionando function kruskals"
  puts @subsets
  puts @results

  while @noOfEdges < (v - 1)
    @nextEdge = edges[@j]
    @x = findRoot(@subsets, @nextEdge.src)
    @y = findRoot(@subsets, @nextEdge.dest)

    if (@x != @y)
      @results[@noOfEdges] = @nextEdge
      union(@subsets, @x, @y)
      @noOfEdges += 1
    end
    @j += 1
  end

  puts "Following are the edges of the constructed MST:"
  puts "-----------------------------------------------"
  @minCost = 0
  for i in 0..@noOfEdges do
    puts "#{@results[i].src} - #{@results[i].dest} : #{@results[i].weight}"
    @minCost += @results[i].weight
  end
  puts "-----------------------------------------------"
  puts "Total cost of MST: #{@minCost}"
end

def union(subsets, x, y)
  rootX = findRoot(subsets, x)
  rootY = findRoot(subsets, y)

  if (subsets[rootY].rank < subsets[rootX].rank)
    subsets[rootY].parent = rootX
  elsif (subsets[rootX].rank < subsets[rootY].rank)
    subsets[rootX].parent = rootY
  else
    subsets[rootY].parent = rootX
    subsets[rootX].rank += 1
  end
end

def findRoot(subsets, i)
  if (subsets[i].parent == i) 
    return subsets[i].parent
  end
  
  subsets[i].parent = findRoot(subsets, subsets[i].parent)
  return subsets.parent
end

describe "Minimum Spanning" do
  it "description" do
    @k = KruskalsMST.new
    @k.main()
  end  
end
