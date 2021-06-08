## Robot Name challenge

### Duration

This challenge took me 98 minutes to complete. This is including time to pass all of the tests, refactoring my solution, and also passing the Rubocop tests.

### Approach

Note: At the top of my final code, I included my PEDAC, just in case it's useful.

At the beginning of the `Robot` class, I'm initializing a `ROBOT_NAMES` constant assigned to an emtpy array. This constant is to store all previously created `@name` values for all `robot` objects instantiated. It was originally a class variable `@@robot_names` but, upon finishing the exercise, Robocop told me to replace the class variable with a class instance variable. I decided using a constant would be easiest.

Based on how the test cases were written, I knew I would be instantiating multiple `Robot` objects. I then decided to have an `initialize` constructor method which would initialize `@name` instance method and assign it to an empty string. Each new `Robot` object would start off with an empty `@name` string, followed by calling the `name` method to name the robot.

#### Name Method

The `name` instance method then checks if the `@name` value is an empty string with an `if` conditional. It then generates a new, random robot name by calling the `generate_name` method if the conditional evaluates to `true`.

The `name` method also has a `while loop` to confirm if the `ROBOT_NAMES` array already contains the current object's `@name` value, or if the current `@name` value is the placeholder value of `AAOOO`. It generates a new name by re-calling the `generate_name` method if it evaluates to `true`.

The easiest part of the exercise was generating the random numbers and letters and adding it to the `@name` string, through the use of the method `generate_name` and it's helper methods `generate_letters` and `generate_numbers`.

It was a bit difficult to figure out exactly how I wanted to approach the `name` method and it took me a few different tries to get the code exactly how I wanted it.

#### Reset Method

Originally, when the `reset` method was called to clear the current `@name` value and remove the value from the `ROBOT_NAMES` array, my placeholder value was `nil` (i.e. `@name` would be reassigned to `nil`). However, this was giving errors upon running the test suite. I then decided it would make more sense to have a placeholder robot name with the same syntax as the randomly generated names. I then went back and updated the `name` method's `while loop` to rename a robot if it's name matched the placeholder.

The `reset` method was a little difficult for me to decide on the logic. I eventually decided when `reset` is called, to reset the robot's name in place. That is, not to delete it and add on the placeholder at the end of the `ROBOT_NAMES` array, but instead to modify the element's value while leaving it at the same index within the array.




