defmodule Crypto do

  def hex_to_base64(input) do
    HexString.decode(input) |> Base64String.encode
  end


  def fixedXOR(a, b) do
    astring = for <<x::1 <- a>>, do: x
    bstring = for <<y::1 <- b>>, do: y
    zipped = Enum.zip astring, bstring
    (for {c, d} <- zipped, into: <<>>, do: <<_fixedXOR(c, d)::size(1)>>)
  end

  defp _fixedXOR(x, x) do
    0
  end

  defp _fixedXOR(_, _) do
    1
  end

end
