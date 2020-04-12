defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    count(strand, nucleotide, 0)
  end

  def count(word, letter, amount \\ 0)
  def count([letter | word], letter, amount), do: count(word, letter, amount + 1)
  def count([_letter | word], letter, amount), do: count(word, letter, amount)
  def count(_word, _letter, amount), do: amount

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    histogram_count(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0})
  end

  def histogram_count([letter | word], amount) do
    case letter do
      ?A -> histogram_count(word, %{amount | ?A => amount[?A] + 1})
      ?T -> histogram_count(word, %{amount | ?T => amount[?T] + 1})
      ?C -> histogram_count(word, %{amount | ?C => amount[?C] + 1})
      ?G -> histogram_count(word, %{amount | ?G => amount[?G] + 1})
      _ -> histogram_count(word, amount)
    end
  end

  def histogram_count(_word, amount) do
    amount
  end
end
