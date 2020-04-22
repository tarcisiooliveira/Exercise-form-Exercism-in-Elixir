defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA
  * `G` -> `C`
  * `C` -> `G`
  * `T` -> `A`
  * `A` -> `U`
  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    [head | tail] = dna

    case head do
      ?G -> 'C' ++ if length(tail) > 0, do: to_rna(tail), else: ''
      ?C -> 'G' ++ if length(tail) > 0, do: to_rna(tail), else: ''
      ?T -> 'A' ++ if length(tail) > 0, do: to_rna(tail), else: ''
      ?A -> 'U' ++ if length(tail) > 0, do: to_rna(tail), else: ''
    end
  end
end
