def print3largest(arr)
  arr_size = arr.size
  if arr_size < 3
    return "Invalid Input"
  end
end

describe "Print 3 largest" do
  it "should array size < 3 return message error" do
    arr = [1, 2]
    result = print3largest(arr)
    expect(result).to eq("Invalid Input")
  end
end