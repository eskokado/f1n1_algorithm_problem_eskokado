def count_upper(str)
  result = 0
  for i in 0..(str.size - 1)
    if str[i] >= 'A' && str[i] <= 'Z'
      result += 1
    end
  end
  result
end

def count_lower(str)
  result = 0
  for i in 0..(str.size - 1)
    if str[i] >= 'a' && str[i] <= 'z'
      result += 1
    end
  end
  result
end

def count_number(str)
  result = 0
  for i in 0..(str.size - 1)
    if str[i] >= '0' && str[i] <= '9'
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

  it "Ensure count char lower in string" do
    lower = count_lower(str)
    expect(lower).to eq(8)
  end

  it "Ensure count number in string" do
    number = count_number(str)
    expect(number).to eq(4)
  end

end