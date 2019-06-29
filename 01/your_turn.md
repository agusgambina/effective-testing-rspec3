# Your Turn

1. We’ve shown you three primary ways to reduce duplication in RSpec: hooks, helper methods, and let declarations. Which way did you like best for this example? Why? Can you think of situations where the others might be a better option?

The `let` method was the one I liked the most, because of three reasons

* It only runs when the variable is declared, it is the most efficient
* I don't have to change my previous variables as instance variables
* If I have a typo, the error would be more clear

2. Run rspec --help and look at the available options. Try using a few of them to run your sandwich examples.
