def print3largest(arr)
  arr_size = arr.size
  if arr_size < 3
    return "Invalid Input"
  end
  third = 0
  first = 0
  second = 0
  for i in 0..(arr_size - 1)
    if arr[i] > first
      third = second
      second = first
      first = arr[i]
    elsif arr[i] > second && arr[i] != first
      third = second
      second = arr[i]
    elsif arr[i] > third && arr[i] != second
      third = arr[i]
    end
  end
  "Three largest elements are #{first} #{second} #{third}"
end

describe "Print 3 largest" do
  it "should array size < 3 return message error" do
    arr = [1, 2]
    result = print3largest(arr)
    expect(result).to eq("Invalid Input")
  end

  it "Given array size correct return message" do
    arr = [12, 13, 1, 10, 34, 1]
    result = print3largest(arr)
    expect(result).to eq("Three largest elements are 34 13 12")
  end
end