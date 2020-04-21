defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @earth_time 31_557_600

  @solar_system %{
    :Earth => 1,
    :Mercury => 0.2408467,
    :Venus => 0.61519726,
    :Mars => 1.8808158,
    :Jupiter => 11.862615,
    :Saturn => 29.447498,
    :Uranus => 84.016846,
    :Neptune => 164.79132
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    value =
      seconds
      |> String.split("_")
      |> Enum.join()
      |> String.to_integer()

    new_value = value / @earth_time

    if @solar_system[planet] > 0 do
      Float.round(new_value / @solar_system[planet], 2)
    else
      Float.round(new_value * @solar_system[planet], 2)
    end
  end
end
