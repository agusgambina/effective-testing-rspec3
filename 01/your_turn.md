# Your Turn

1. We’ve shown you three primary ways to reduce duplication in RSpec: hooks, helper methods, and let declarations. Which way did you like best for this example? Why? Can you think of situations where the others might be a better option?

For this situation the **before hook** technique is the one I liked the most, because the cost of setting up the instance variable is small, and this technique is the best one to isolate one test from each other.

2. Run rspec --help and look at the available options. Try using a few of them to run your sandwich examples.
