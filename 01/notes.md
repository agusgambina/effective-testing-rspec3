# Getting Started with RSpec

A good test will provide at least one of these three benefits

* Design guidance: helping you to distill all those fantastic ideas in your head into running, maintainable code.
* Safety net: finding errors in your code before customers do.
* Documentation: capturing the behavior of a working system to help its mantainers.

## Installing RSpec

RSpec is made of three independent Ruby Gems:

* rspec-core
* rspec-expectations
* rspec-mocks

```bash
gem install rspec
```

## Groups, Examples and Expectations

> What is the difference between tests, specs, and examples?
>
>They will all refer to the code you write to check your program's behaviour. The terms are semi-interchangeable, but each carries a different emphasis:
>
> * A *test* validates that a bit of code is working properly. 
> * A *spec* describes the desired behavior of a bit of code.
> * An *example* shows how a particular API is intended to be used.

You will follow the Arrange/Act/Assert pattern: set up an object, do something with it, and check that it behaved the way you wanted.

* `RSpec.describe` creates an example group (set of related tests).
* `it` creates an example (individual test).
* `expect` verifies an expected outcome (assertion).

## Understading Failure

Run `rspec` command from your project directory. RSpec will look inside the **spec** subdirectory for files named **\<\<something\>\>_spec.rb** and run them.

RSpec gives us a detailed report showing which spec failed, the line of code where the error ocurred, and a description of the problem.

Starting with a failing spec, is the first step of the Red/Green/Refactor development practice essential to TDD and BDD. With this workflow, you will make sure each example catches failing or missing code before you implement the behavior.

## Sharing Setup

RSpec provides ways to share common setup across several examples.

* RSpec *hooks* run automaticaly at specific times during testing.
* Helper methods are regular Ruby methods; you control when these run.
* RSpec's *let* construct initializes data on demand.

### Hooks

RSpec *before hook* will run automatically before each example.

Hooks are great for running common setup code that has real-world side effects. When you initialize an instance variable in a **before** hook, you pay the cost of that setup time for all examples in the group, even if some of them never use the instance variable. That's inefficient and can be quite noticeable when setting up large or expensive objects.

### Helper Methods

Each example group is a Ruby class, which means we can define methods on it. Each call of the helper method creates a new instance. The traditional solution is a common technique called *memoization*, where we store the results of an operation and refer to the stored copy from then on.

This pattern is pretty easy to find in Ruby code in the wild, but it is not without its pitfalls. The `||=` operator works by seeing if the instance variable is false or nil. That means it won't work if we're actually trying to store something falsey.

### Sharing Objects With let

RSpec gives an alternative construct **let**. You can think of **let** as a binding name to the result of the computation. Just as with a memoized helper method, RSpec will run the block the first time any example makes the call.
