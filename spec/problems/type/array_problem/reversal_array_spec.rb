def reverse_array(arr, start, final)
  while start < final
    temp = arr[start]
    arr[start] = arr[final]
    arr[final] = temp
    start += 1
    final -= 1
  end
end

def right_rotate(arr, d, n)
  reverse_array(arr, 0, n - 1)
  reverse_array(arr, 0, d - 1)
  reverse_array(arr, d, n - 1)
end

def result_array(arr)
  result = ""
  for i in 0..(arr.size - 1)
    if i == (arr.size - 1)
      result += arr[i].to_s
    else
      result += arr[i].to_s + " "
    end
  end
  result
end

describe "Reversal array" do
  it 'should call reversal array return string' do
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    n = arr.size
    k = 3

    right_rotate(arr, k, n)
    result = result_array(arr)

    expect(result).to eq("8 9 10 1 2 3 4 5 6 7")
  end
end