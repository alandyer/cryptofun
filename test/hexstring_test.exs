defmodule HexStringTest do
  use ExUnit.Case

  test "decode hex encoded string" do
    assert HexString.decode("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")
    == "I'm killing your brain like a poisonous mushroom"
  end

  test "encode string into hex string" do
    assert HexString.encode("I'm killing your brain like a poisonous mushroom")
    == "49276D206B696C6C696E6720796F757220627261696E206C696B65206120706F69736F6E6F7573206D757368726F6F6D"
  end

end
