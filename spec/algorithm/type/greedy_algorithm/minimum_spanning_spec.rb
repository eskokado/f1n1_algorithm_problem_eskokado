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
  puts "Funcionando function kruskals"
  puts @subsets
end

describe "Minimum Spanning" do
  it "description" do
    @k = KruskalsMST.new
    @k.main()
  end  
end
