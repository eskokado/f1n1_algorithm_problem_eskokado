def binarySearch(array, search, low, high) 
  if (low && high)
    if low > high
      return -1
    end

    mid = ((low + high) / 2).to_i
  
    if search == array[mid] 
      return mid
    end
  
    if search > array[mid]
      return array[mid]
    else
      return binarySearch(array, search, low, mid - 1)
    end
  else
    array.sort
    array.each_with_index do |value, index|
      if value == search 
        return index
      end
    end
    return -1
  end
end

describe "Binary Search" do
  it "Ensure function binarySearch in array search 110 return 6" do
    array = [10, 20, 30, 50, 60, 80, 110, 130, 140, 170]
    index = binarySearch(array, 110, nil, nil)
    expect(index).to eq(6)
  end

  it "Ensure function binarySearch in array search 175 return -1" do
    array = [10, 20, 30, 50, 60, 80, 110, 130, 140, 170]
    index = binarySearch(array, 175, nil, nil)
    expect(index).to eq(-1)
  end

  it "Ensure function binarySearch in array search 23 return -1" do
    array = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
    index = binarySearch(array, 23, 0, array.size)
    expect(index).to eq(5)
  end

end
