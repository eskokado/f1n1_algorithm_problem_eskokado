class KruskalsMST
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

describe "Minimum Spanning" do
  it "description" do
    @k = KruskalsMST.new
    @k.main()
  end  
end
