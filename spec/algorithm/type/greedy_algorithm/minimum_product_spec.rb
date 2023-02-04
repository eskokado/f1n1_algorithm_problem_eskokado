def minimum_product(arr)
  result = 1
  for i in 0..(arr.size - 1)
    result *= arr[i]
  end
  result
end

describe "Miminum product subset of an array" do
  it 'Given array a, we have to find the minimum product in the array' do
    arr = [-1, -1, -2, 4, 3]
    result = minimum_product(arr)
    expect(result).to eq(-24)
  end
end