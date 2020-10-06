defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    of_rna(rna, [])
  end

  def of_rna("", codons) when is_atom(codons) do
    {:error, "invalid RNA"}
  end

  def of_rna("", codons) do
    {:ok, codons}
  end

  def of_rna(rna, codons) do
    {codon, rest} = String.split_at(rna, 3)

    case of_codon(codon) do
      {:ok, c} ->
        if c == "STOP" do
          of_rna("", codons)
        else
          of_rna(rest, codons ++ [c])
        end
      {:error, _} ->
        of_rna("", :error)
    end

  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    codons = %{
      ugu: "Cysteine",
      ugc: "Cysteine",
      uua: "Leucine",
      uug: "Leucine",
      aug: "Methionine",
      uuu: "Phenylalanine",
      uuc: "Phenylalanine",
      ucu: "Serine",
      ucc: "Serine",
      uca: "Serine",
      ucg: "Serine",
      ugg: "Tryptophan",
      uau: "Tyrosine",
      uac: "Tyrosine",
      uaa: "STOP",
      uag: "STOP",
      uga: "STOP"
    }
    case Map.fetch(codons, codon |> String.downcase() |> String.to_atom()) do
      {:ok, c} -> {:ok, c}
      :error -> {:error, "invalid codon"}
    end
  end
end
