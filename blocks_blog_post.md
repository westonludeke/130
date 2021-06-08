## Blocks in Ruby

In the Ruby programming language, `blocks` are unnamed snippets, or chunks of code that we create to execute at a later time. We pass blocks into methods as an argument to give the person calling the method flexibility in using the method during method invocation time. This makes the method more powerful because it is able to be more generic by deferring some of the implementation decisions to the developer. 

Blocks in Ruby are written using either curly braces `{ }` or `do..end` blocks. The method implementor must decide: 1) how the method will use the block, and 2) what the return value of the method will be (i.e. will it use values returned by the block or ignore them)?

For example: The `Array#each` method uses a block to do something with each of the values in the calling object. It is powerful because we decide what it is we want to do with these values/objects - print them? add them to a new collection? It is up to the developer to decide at method invocation time.

```ruby
[1, 2, 3].each { |num| puts num } # => output: 1, 2, 3 on new lines
```

A method doesn't necessarily have to "use" a block in order to be able to accept it as an argument. This is one way in which passing in blocks as an argument to a method is different from passing in values to explicit parameters. The block is passed to the method as an implicit argument during method invocation time, but whether this block is used by the method depends on the method definition.

#### Implicit Blocks

In Ruby, implicit block passing works by calling the `yield` keyword inside of a method. The `yield` keyword finds the block within the current scope, which allows us to implicitly pass the block. However, because the block is not assigned to a variable, the code cannot access the block directly.

In the example below, the method `a_method` takes one explicit argument, but it also accepts a block as an implicit argument, even though it doesn't do anything with the block. `b_method` also accepts a block as an implicit argument, but it actually uses it via the keyword `yield`, which executes the code that is in the block:

```ruby
def a_method(str)
  str
end

a_method("hi") { puts "HOWDY" } # => return value: "hi"

def b_method
  yield
end

b_method { puts "HOWDY" } # => output: HOWDY, return value: nil
```

#### Explicit Blocks

If we prepend the `&` symbol to a method's parameter, the method can then explicitly accept a block. The `&` ampersand symbol in the method's parameter converts the block to a Proc object, assigning it to the local variable `block`.

Since our `proc` object is assigned to the variable `block`, it can also be passed in like a normal argument to a method call. `procs` behave like blocks, but have more flexibility as they can be stored within a variable.

We can then call the block using the `.call` method inside of our method's body, instead of using the `yield` keyword.

```ruby
def my_method(&block)
  p block
  block.call
end
my_method { puts "I'm a block" }
```

In our example above on lines 1-4, we are defining a new method `my_method` that takes one parameter `&block`.

On line 5 - We are calling our method with no arguments and a block `{ puts "I'm a block" }`.

On line 1 - Because the `&` ampersand is prepending our method's parameter name (i.e. because it's prepending `block`), Ruby will convert the block to a `Proc` object assigned to the local variable `block`.

On line 2 - We are calling `p` method on the `block` variable. Since `block` is a `Proc` object, Ruby will print the `Proc` object, which will look something like: `#<Proc:0x000055d310c7a748 solution.rb:9>`. This confirms our block has been converted to a `Proc` object.

On line 3 - We are using the `.call` method on the `block` variable (i.e. on the `Proc` object) to call the block. Because our block has been assigned to a `Proc` object, we call the block using `.call` instead of `yield`.

The `.call` method calls the block which calls the `puts` method on the string `"I'm a block`".







