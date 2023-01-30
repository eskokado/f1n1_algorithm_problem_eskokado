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
end
