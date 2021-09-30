=begin
Write your code for the 'Protein Translation' exercise in this file. Make the tests in
`protein_translation_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/protein-translation` directory.
=end
class InvalidCodonError < StandardError; end

class Translation
  CODON_TO_AMINO = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  def self.of_codon(codon)
    CODON_TO_AMINO[codon]
  end

  def self.of_rna(rna)
    aminos = []
    rna.scan(/.{3}/).each do |codon|
      raise InvalidCodonError unless of_codon(codon)
      break if of_codon(codon) == "STOP"

      aminos << of_codon(codon)
    end
    aminos
  end
end
