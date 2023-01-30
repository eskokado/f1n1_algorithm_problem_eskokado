def binarySearch(array, search) 
  array.sort
  array.each_with_index do |value, index|
    if value == search 
      return index
    end
  end
  return -1
end

describe "Binary Search" do
  it "Ensure function binarySearch in array search 110 return 6" do
    array = [10, 20, 30, 50, 60, 80, 110, 130, 140, 170]
    index = binarySearch(array, 110)
    expect(index).to eq(6)
  end
end
