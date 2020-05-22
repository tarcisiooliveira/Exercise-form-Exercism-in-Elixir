defmodule BMI do

  def compute(height_in_m, weight_in_kg) do
    weight_in_kg/(height_in_m*height_in_m)
  end

  def test_bmi() do
    22.395413419331717 = BMI.compute(1.83, 75)
    37.10937499999999 = BMI.compute(1.60, 95)
    82.64462809917354 = BMI.compute(1.10, 100)
    :ok
  end
end

:ok = BMI.test_bmi()
