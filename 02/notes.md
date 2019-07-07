# From writing Specs to Running Them

The following practices will help find problems in code more quickly

* See your specs' output printed as documentation, to help your future self understand the intent of the code when something goes wrong
* Run a specific set of examples, to focus on one slice of your program at a time
* Fix a bug and rerun just the specs that failed last time
* Mark work in progress to remind you to finish something later

## Customizing Your Specs' Output

### The Progress Formatter

The `context` block, this method groups a set of examples and their setup code together with a common description.

This format is good for showing the progress of your specs as they execute.

On the other hand, this output doesn't give any indication of which example is currently running, or what the expected behavior is.

When you need more detail in your test report, or need a specific format such as HTML, RSpec's got you covered. By choosing a different formatter, you can tailor the output to your needs.

### The Documentation Formatter

RSpec's built-in *documentation formatter* lists the specs' output in an outline format, using indentation to show grouping.

### Syntax Highlight

```bash
gem install coderay
```

When this gem is installed, the Ruby snippets in your specs' output will be color-coded.

## Identifying Slow Examples

RSpec's spec runner can help you to understand where the biggest bottlenecks are in your suite.

```bash
rspec --profile 2
```

## Running Just What You Need

If you are trying to get rapid feedback on your design, you can bypass slow or unrelated specs.

The easiest way to narrow down your test run is to pass a list of file or directory names to **rspec**.

### Running Examples by Name

Rather than running all the loaded specs, you can choose a specific example by name, using the **--example** or **-e** option plus a search term.

### Running Specific Failures

Often what you really want to do is run just the most recent failing spec. RSpec gives you a handy shortcut here. If you pass a filename and a line number separated by a colon, RSpec will run the example that starts on that line.

### Rerunning Everything That Failed

You can run all the failing tests with the flag **--only-failures**. This flag requires a little bit of configuration, but RSpec will coach you through the setup process. RSpec needs a place to store information about which examples are failing so that it knows what to rerun. You need to supply a filename through the **RSpec.configure** method, which is a catch-all for lots of different runtime options.

```ruby
RSpec.configure do |config|
  config.example_status_persistence_file_path='spec/examples.txt'
end
```

### Focusing Specific Examples

If you find yourself running the same subset of specs repeatedly, you can save time by marking them as *focused*. To do so, simply add an **f** to the beginning of the RSpec method name:

* **context** becomes **fcontext**
* **it** becomes **fit**
* **describe** becomes **fdescribe**

```ruby
RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
end
```

It will only run the examples in the focused context. If you haven't marked any specs as focused, RSpec will run all all of them.

### Tag Filtering

Any time you define an example or group, you can add a hash like **focus: true** tag. This hash, known as *metadata*, can contain arbitrary keys and values.

Behind the scenes, RSpec will add metadata of its own, such as **last_run_status** to indicate whether each spec passed or failed the last time it ran.

You can filter examples directly from the command line using **--tag** option.

## Marking Work In Progress

In BDD, you're typically working on getting just one spec at a time to pass.

On the other hand, it can be extremly productive to *sketch out* several examples in a batch. RSpec supports this workflow really well, through *pending* examples.

### Starting With the Description

While you were writing the specs, you may have been thinking ahead to other properties. While these behaviours are on your mind, go ahead and add them inside the *description* or *context*.

There is no need to fill these in; just let them stand as they are while you are working on other specs.

These examples are marked with yellow asterisks on the progress bar and are listed as "Pending" in the output

### Marking Incomplete Work

When you are sketching out future work, you may actually have an idea of what you want the body of the spec to look like.

RSpec provides the **pending** method for this purpose. You can mark a spec as pending by adding the word **pending** anywhere inside the spec body, along with an explanation of why the test shouldn't pass yet. The location matters; any lines before the pending call will still be expected to pass. We typically add it at the top of the example.

### Completing Work in Progress

One of the nice thigns about marking examples as **pending** is that RSpec will let you know when they start passing.