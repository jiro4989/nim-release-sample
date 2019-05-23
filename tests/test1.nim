import unittest
import sequtils, strutils

include nim_release_sample/util

suite "fizzbuzz":
  test "Fizz":
    check fizzbuzz(3) == "Fizz"
    check fizzbuzz(6) == "Fizz"
  test "Buzz":
    check fizzbuzz(5) == "Buzz"
    check fizzbuzz(10) == "Buzz"
  test "FizzBuzz":
    check fizzbuzz(15) == "FizzBuzz"
    check fizzbuzz(30) == "FizzBuzz"
  test "Orgin":
    check fizzbuzz(1) == "1"
    check fizzbuzz(2) == "2"
    check fizzbuzz(4) == "4"
    check fizzbuzz(7) == "7"