def minSum(array, n)
  minValue = array.min
  return (minValue * (n -1));
end

describe "Minimum sum" do
  it "ensure minimum sum" do
    @array = [3, 6, 2, 8, 7, 5]
    @n = @array.size
    @minValue = minSum(@array, @n)
    expect(@minValue).to  eq(10)
  end
end
