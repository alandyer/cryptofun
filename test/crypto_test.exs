defmodule CryptoTest do
  use ExUnit.Case

  test "convert hex to base 64"  do
    assert Crypto.hex_to_base64("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d") == "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
  end

  test "fixed XOR" do
    str1 = HexString.decode("1c0111001f010100061a024b53535009181c")
    str2 = HexString.decode("686974207468652062756c6c277320657965")
    assert Crypto.fixedXOR(str1, str2) |> HexString.encode
    ==
    "746865206b696420646f6e277420706c6179" |> String.upcase
  end

  test "that a bitstring contains 75% or more alphnum characters" do
    assert Crypto.isAlphaNum("Hello, World!", 0.75) == :true
    assert Crypto.isAlphaNum("++++1", 0.75) == :false
  end

  test "decoding a single byte XOR cipher" do
    str = HexString.decode("1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736")
    scores = for m <- 0..255, do: {m, Crypto.decodeSingleCharXOR(str, <<m>>) |> Crypto.alphaNumScore}
    {char, _score} = Enum.max_by(scores, fn({_, score}) -> score end)
    assert "Cooking MC's like a pound of bacon"
    == Crypto.decodeSingleCharXOR(str, <<char>>)
  end

end
