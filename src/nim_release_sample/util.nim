## util is utilities submodule of `nim_release_sample module <nim_release_sample.html>`_.

proc fizzbuzz*(i: int): string =
  ## Returns fizz buzz.
  runnableExamples:
    assert fizzbuzz(3) == "Fizz"
    assert fizzbuzz(5) == "Buzz"
    assert fizzbuzz(15) == "FizzBuzz"
    assert fizzbuzz(1) == "1"
  if i mod 3 == 0:
    result.add "Fizz"
  if i mod 5 == 0:
    result.add "Buzz"
  if result == "":
    result.add $i