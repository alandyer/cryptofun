defmodule Base64StringTest do
  use ExUnit.Case

  test "decode hex encoded string" do
    assert Base64String.decode("SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t")
    == "I'm killing your brain like a poisonous mushroom"
  end

  test "encode string into hex string" do
    assert Base64String.encode("I'm killing your brain like a poisonous mushroom")
    == "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
  end

end
