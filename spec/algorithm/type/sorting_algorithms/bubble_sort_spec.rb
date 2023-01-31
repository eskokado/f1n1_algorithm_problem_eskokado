describe "Bubble Sort" do
  array = [5, 1, 4, 2, 8]
  it "Sorting ascending" do
    result = array.sort
    expect(result).to eq([1, 2, 4, 5, 8])
  end
  it "Sorting reverse" do
    result = array.sort {|a, b| b <=> a }
    expect(result).to eq([8, 5, 4, 2, 1])
  end
end