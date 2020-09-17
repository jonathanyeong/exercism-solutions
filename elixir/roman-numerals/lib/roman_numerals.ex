defmodule RomanNumerals do
  # We want to build a map of combinations of numerals
  # This needs to be ordered desc
  @numeral_mapping [
    {:M, 1000},
    {:CM, 900},
    {:D, 500},
    {:CD, 400},
    {:C, 100},
    {:XC, 90},
    {:L, 50},
    {:XL, 40},
    {:X, 10},
    {:IX, 9},
    {:V, 5},
    {:IV, 4},
    {:I, 1}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(0) do
    ""
  end

  def numeral(number) do
    {roman, num} = Enum.find(@numeral_mapping, fn {_, v} -> number >= v end)
    to_string(roman) <> numeral(number - num)
  end
end
