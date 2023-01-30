describe "Searching Algorithm" do
  it "Linear Search with found 20" do
    array = [10, 50, 30, 70, 80, 60, 20, 90, 40]
    valueSearch = 20
    message = "Element is not found"
    for value in array do
      if value == valueSearch 
        message = "Target element is found"
        break
      end
    end    
    expect(message).to eq("Target element is found")
  end  
  it "Ensure Search element(75) result not found" do
    array = [10, 50, 30, 70, 80, 60, 20, 90, 40]
    valueSearch = 75
    message = "Element is not found"
    for value in array do
      if value == valueSearch 
        message = "Target element is found"
        break
      end
    end    
    expect(message).to eq("Element is not found")
  end  
  it "Linear Search found 110 in array result index element" do
    array = [10, 20, 80, 30, 60, 50, 110, 100, 130, 170]
    valueSearch = 110
    findIndex = -1
    message = "Element 110 is not present in array"
    array.each_with_index do |value, index|
      if value == valueSearch 
        findIndex = index
        message = "Element #{valueSearch} is present at index #{index}"
        break
      end
    end    
    expect(message).to eq("Element 110 is present at index 6")
  end  
  it "Linear Search element 175 is not present in array" do
    array = [10, 20, 80, 30, 60, 50, 110, 100, 130, 170]
    valueSearch = 175
    findIndex = -1
    message = "Element 175 is not present in array[]"
    array.each_with_index do |value, index|
      if value == valueSearch 
        findIndex = index
        message = "Element #{valueSearch} is present at index #{index}"
        break
      end
    end    
    expect(message).to eq("Element 175 is not present in array[]")
  end  
end
