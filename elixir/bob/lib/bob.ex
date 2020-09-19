defmodule Bob do
  def hey(input) do
    # Case
    # String with letters ends with ? -> "Sure."
    #   if all caps (only letters) -> "calm down"
    # Anything that is all caps (only letters) -> "Whoa, chill out!"
    # No characters -> "Fine. Be that way!"
    # ANything else -> "Whatever."
    cond do
      is_question?(input) ->
        if is_shouting?(input), do: "Calm down, I know what I'm doing!", else: "Sure."
      String.length(String.trim(input)) == 0 -> # ONly white space
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
end
