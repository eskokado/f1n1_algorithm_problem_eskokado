def maximumSum(arr, n, k)
  for i in 1..k
    min = 2147483647
    index = -1

    for j in 0..(n - 1)
      if arr[j] < min
        min = arr[j]
        index = j
      end
    end

    if (min == 0)
      break
    end

    arr[index] = -arr[index]
  end

  sum = 0
  for i in 0..(n -1)
    sum += arr[i]
  end
  sum
end

describe "Maximum Sum" do
  it "program to find maximum array sum after at most k negations " do
    arr = [-2, 0, 5, -1, 2]
    k = 4
    n = arr.size
    result = maximumSum(arr, n, k)

    expect(result).to eq(10)
  end
end