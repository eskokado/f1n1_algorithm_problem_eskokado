def calculate_age(current_date, current_month, current_year, birth_date, birth_month, birth_year)
  month = [31, 28, 31, 30, 31, 30,
         31, 31, 30, 31, 30, 31]

  if birth_date > current_date
    current_month -= 1
    current_date += month[birth_month - 1]
  end

  if birth_month > current_month
    current_year -= 1
    current_month += 12
  end

  calculated_date = current_date - birth_date
  calculated_month = current_month - birth_month
  calculated_year = current_year - birth_year

  result = "Present Age\n"
  result += "Years: #{calculated_year} Months: #{calculated_month} Days: #{calculated_date}"
end

describe "Calculate AGe" do
  it "Function call calculated age" do
    current_date = 7
    current_month = 12
    current_year = 2017

    birth_date = 16
    birth_month = 12
    birth_year = 2009

    result = calculate_age(current_date, current_month, current_year, birth_date, birth_month, birth_year)

    expect(result).to be_include("Years: 7")
    expect(result).to be_include("Months: 11")
    expect(result).to be_include("Days: 22")
  end
end