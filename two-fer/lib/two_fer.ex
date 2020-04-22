defmodule TwoFer do


  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
   """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name) do
    if is_binary(name) do
      "One for #{name}, one for me"
    else
      raise(FunctionClauseError)
    end
  end

  @spec two_fer() :: String.t()
  def two_fer() do
    two_fer("you")
  end


  @doc """
  Great public solution on exercism
  https://exercism.io/tracks/elixir/exercises/two-fer/solutions/a850579412db49b5b5eab4ae053232fc
  MMessy code for i review in the future or maybe a quick access or solve some problem based on this.
  """
  # @spec two_fer(String.t()) :: String.t()
  # def two_fer(name \\ "you") when is_binary(name) do
  #   "One for #{name}, one for me"
  # end

  # @doc"""
  # deprecated
  # """
  # @spec two_fer() :: String.t()
  # def two_fer() do
  #   "One for you, one for me"
  # end
end
