defmodule HexString do

  def decode(input) do
    (for <<x::8, y::8 <- input>>, do: <<convert_string_to_hex(x)::4, convert_string_to_hex(y)::4>>)
    |> Enum.join
  end

  def convert_string_to_hex(x) when x >= ?0 and x <= ?9 do
    x - ?0
  end

  def convert_string_to_hex(x) when x >= ?a and x <= ?f do
    x - ?a + 10
  end

  def convert_string_to_hex(x) when x >= ?A and x <= ?F do
    x - ?A + 10
  end

  def encode(input) do
    (for <<x::4, y::4 <- input>>,
    do: <<convert_hex_to_string(x)::8, convert_hex_to_string(y)::8>>)
    |> Enum.join
  end

  def convert_hex_to_string(x) when x >= 0 and x <= 9 do
    x + ?0
  end

  def convert_hex_to_string(x) when x >= 10 and x <= 15 do
    x + ?A - 10
  end


end
