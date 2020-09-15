defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    # Regex matches anything NOT a letter, number, whitespace, or hyphen
    normalized_sentence =
      sentence
      |> String.downcase()
      |> String.replace(~r/[_]/u, " ")
      |> String.replace(~r/[^\p{N}\p{L}\p{Z}-]/u, "")
      |> String.split()

    count_words(normalized_sentence, %{})
  end

  def count_words([], counts) do
    counts
  end

  def count_words([h|t], counts) do
    if counts[h] do
      count = counts[h] + 1
      count_words(t, %{counts | h => count })
    else
      count_words(t, Map.put(counts, h, 1))
    end
  end
end
