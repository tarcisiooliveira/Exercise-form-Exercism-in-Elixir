defmodule Strain do

  @doc """
  Strain.keep([1,2,3,4],fn(x) -> x * x end)
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    lista_retorno=[]
    lista_booleana = Enum.map(list, fun)
    Enum.map((lista_booleana, list),
    fn (bolean, valor)  ->
      case bolean do
        true -> [lista_retorno | valor]
        false -> nil

    end end)
    lista_retorno
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    list=Enum.map(list, fun)
    list
  end







end
