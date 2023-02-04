def count_upper(str)
  result = 0
  for i in 0..(str.size - 1)
    if str[i] >= 'A' && str[i] <= 'Z'
      result += 1
    end
  end
  result
end

describe "Count string" do
  str = "#GeeKs01fOr@gEEks07"
  it "Ensure count char upper in string" do
    upper = count_upper(str)
    expect(upper).to eq(5)
  end
end