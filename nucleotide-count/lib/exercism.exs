mapa = %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
IO.puts(mapa[65])
%{mapa | ?A => 6}
IO.puts(mapa[65])
