defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(fn x -> rot(x, shift) end)
    |> to_string
  end

  def rot(char, shift) when char >= ?a and char <= ?z do
    if shift >= 26 do
      if char + (shift - 26) > ?z do
        ?a + (shift - 26)
      else
        char + (shift - 26)
      end
    else
      if char + shift > ?z do
        new_shift = char+shift - ?z - 1
        ?a + new_shift
      else
        char + shift
      end
    end
  end

  def rot(char, shift) when char >= ?A and char <= ?Z do
    if shift >= 26 do
      if char + (shift - 26) > ?Z do
        ?A + (shift - 26)
      else
        char + (shift - 26)
      end
    else
      if char + shift > ?Z do
        new_shift = char+shift - ?Z - 1
        ?A + new_shift
      else
        char + shift
      end
    end
  end

  def rot(char,shift), do: char
end
