=begin

PROBLEM:

Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name.
The first time you boot them up, a random name is generated,
such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory
settings, which means that their name gets wiped.
The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable
sequence. Random names means there is a risk of collisions.
Your solution should not allow the use of the same
name twice when avoidable.

INPUT:
-None

OUTPUT:
-A string

RULES:
-Since robot names are created randomly without input
from a user, our program doesn't need to expect any
input argument. The name we later return will be a string.

-A robot's name is generated the first time it is booted up
after being manufactured as well as the first time it
is booted up after a factory reset.

-The randomly generated names seem to follow a pattern
of 2 uppercase alphabetic characters followed by three digits.

-a method named name that returns the robots randomly
generated name (a string). The format of the name is 2
uppercase alphabet characters followed by three digits.

-a method named reset that restores the robot to factory
functions. This means that any previously existing name
for the robot is wiped and a new one must be generated.

EXAMPLES:
-RX837
-BC811

ALGORITHM/PSEUDOCODE:
-Instantiate a new Robot object
-Generate name method called
-Check if name exists already, if so, call generate name again
-If no, return name

=end
class Robot
  ROBOT_NAMES = []

  def initialize
    @name = ''
    name
  end

  def name
    if @name == ''
      generate_name
      generate_name while ROBOT_NAMES.include?(@name) || @name == 'AA000'
      ROBOT_NAMES << @name
    end
    @name
  end

  def generate_letters
    letters = ('a'..'z').to_a
    letters.sample(2)
  end

  def generate_numbers
    numbers = (0..9).to_a
    numbers.sample(3)
  end

  def generate_name
    @name = ''
    generate_letters.each { |letter| @name += letter.upcase }
    generate_numbers.each { |number| @name += number.to_s }
    @name
  end

  def reset
    if ROBOT_NAMES.length > 0
      i = ROBOT_NAMES.index(@name)
      ROBOT_NAMES[i] = 'AA000'
      @name = 'AA000'
    end
  end
end
