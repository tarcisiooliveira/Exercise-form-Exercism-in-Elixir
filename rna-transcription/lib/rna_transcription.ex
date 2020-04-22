defmodule RnaTranscription do
  @rna %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(fn x -> @rna[x] end )

    # bad answear
    # [head | tail] = dna
    # case head do
    #   ?G -> 'C' ++ if length(tail) > 0, do: to_rna(tail), else: ''
    #   ?C -> 'G' ++ if length(tail) > 0, do: to_rna(tail), else: ''
    #   ?T -> 'A' ++ if length(tail) > 0, do: to_rna(tail), else: ''
    #   ?A -> 'U' ++ if length(tail) > 0, do: to_rna(tail), else: ''
    # end
  end
end
