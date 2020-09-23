defmodule Bob do
  def hey(input) do
    cond do
      is_question?(input) ->
        if is_shouting?(input), do: "Calm down, I know what I'm doing!", else: "Sure."
      only_whitespace?(input) ->
        "Fine. Be that way!"
      is_shouting?(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  defp is_shouting?(input) do
    String.match?(input, ~r/\p{L}/) && String.upcase(input) == input
  end

  defp is_question?(input) do
    input
    |> String.trim_trailing()
    |> String.ends_with?("?")
  end

  defp only_whitespace?(input) do
    input
    |> String.trim()
    |> String.length()
    == 0
  end
end
