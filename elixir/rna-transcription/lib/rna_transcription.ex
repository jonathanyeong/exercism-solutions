defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn x -> rna_mapping(x) end)
  end

  @doc """
  Maps a DNA nucleotide to an RNA nucleotide

  ## Examples

  RnaTranscription.rna_mapping('A')
  'U'
  """
  @spec rna_mapping(char) :: char
  def rna_mapping(nucleotide) do
    case nucleotide do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end
  end
end
