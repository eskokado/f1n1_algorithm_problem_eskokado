def missing_chars(str)
  max_chars = 26
  present = []
  for i in 0..(max_chars - 1)
    present[i] = false
  end
  str_result = ""

  for i in 0..(str.size - 1)
    if 'A' <= str[i] && str[i] <= 'Z'
      present[str.getbyte(i) - 'A'.getbyte(0)] = true
    elsif 'a' <= str[i] && str[i] <= 'z'
      present[str.getbyte(i) - 'a'.getbyte(0)] = true
    end
  end

  for i in 0..(max_chars - 1)
    if present[i] == false
      str_result += (i + 'a'.getbyte(0)).chr
    end
  end
  str_result
end

describe "Missing Characters" do
  it "should call missing characters 'The quick brown fox jumps over the dog' result 'alyz'" do
    str = "The quick brown fox jumps over the dog"
    result = missing_chars(str)

    expect(result).to eq("alyz")
  end
  it "should call missing characters 'welcome to geeksforgeeks' result 'abdhijnpquvxyz'" do
    str = "welcome to geeksforgeeks"
    result = missing_chars(str)

    expect(result).to eq("abdhijnpquvxyz")
  end
  it "should call missing characters 'The quick brown fox jumps' result 'adglvyz'" do
    str = "The quick brown fox jumps"
    result = missing_chars(str)

    expect(result).to eq("adglvyz")
  end
end