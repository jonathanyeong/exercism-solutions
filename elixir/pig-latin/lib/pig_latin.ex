defmodule PigLatin do
  @vowel_sounds ["a", "e", "i", "o", "u", "yt", "xr"]
  @consecutive_consonants ["ch", "qu", "squ", "th", "thr", "sch"]
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    if String.starts_with?(phrase, @vowel_sounds) do
      phrase <> "ay"
    else if String.starts_with?(phrase, @consecutive_consonants) do

    else
      String.slice(phrase, 1..String.length(phrase)) <> String.at(phrase, 0) <> "ay"
    end
  end
end
