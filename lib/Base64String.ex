defmodule Base64String do

  def decode(input) do
    (for <<w::8, x::8, y::8, z::8 <- input>>,
      do: <<convert_string_to_base64(w)::6, convert_string_to_base64(x)::6,
            convert_string_to_base64(y)::6, convert_string_to_base64(z)::6>>)
    |> Enum.join
  end

  def convert_string_to_base64(x) when x >= ?0 and x <= ?9 do
    x + 4
  end

  def convert_string_to_base64(x) when x >= ?a and x <= ?z do
    x - 71
  end

  def convert_string_to_base64(x) when x >= ?A and x <= ?Z do
    x - 65
  end

  def convert_string_to_base64(x) when x == ?+ do
    x + 19
  end

  def convert_string_to_base64(x) when x == ?/ do
    x + 16
  end

  def encode(input) do
    (for <<x::6 <- input>>, do: <<convert_base64_to_string(x)>>) |> Enum.join
  end

  def convert_base64_to_string(x) when x <= 25 do
    x + 65
  end

  def convert_base64_to_string(x) when x <= 51 do
    x + 71
  end

  def convert_base64_to_string(x) when x <= 61 do
    x - 4
  end

  def convert_base64_to_string(x) when x == 62 do
    x - 19
  end

  def convert_base64_to_string(x) when x == 63 do
    x - 16
  end

end
