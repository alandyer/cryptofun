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

  def decodeSingleCharXOR(str, char) do
    chunkedstr = for <<x::size(8) <- str>>, do: <<x>>
    (for chunk <- chunkedstr, do: Crypto.fixedXOR(chunk, char)) |> Enum.join
  end

  def isAlphaNum(string, rate) do
    len = String.length(string)
    hitCount = alphaNumCount(string)
    hitCount / len >= rate
  end

  def alphaNumScore(string) do
    len = String.length(string)
    hitCount = alphaNumCount(string)
    hitCount / len
  end

  defp alphaNumCount(string) do
    _alphaNumCount(string, 0)
  end

  defp _alphaNumCount("", acc) do
    acc
  end

  defp _alphaNumCount(<<x::size(8), rest::binary>>, acc) when x >= ?a and x <= ?z do
    _alphaNumCount(rest, acc + 1)
  end

  defp _alphaNumCount(<<x::size(8), rest::binary>>, acc) when x >= ?A and x <= ?Z do
    _alphaNumCount(rest, acc + 1)
  end

  defp _alphaNumCount(<<x::size(8), rest::binary>>, acc) when x >= ?1 and x <= ?9 do
    _alphaNumCount(rest, acc + 1)
  end

  defp _alphaNumCount(<<x::size(8), rest::binary>>, acc) when x == ? or x == ?! do
    _alphaNumCount(rest, acc + 1)
  end

  defp _alphaNumCount(<<_x::size(8), rest::binary>>, acc) do
    _alphaNumCount(rest, acc)
  end
end
