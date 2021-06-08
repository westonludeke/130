=begin

PROBLEM:

Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from
the time represented by a given clock object. Two clock objects
that represent the same time should be equal to each other.

RULES:
-You may not use any built-in date or time functionality;
just use arithmetic operations.

-Our clock objects should track hours and minutes.

-We should be able to add minutes to and subtract
minutes from our clock objects.

-If two clock objects have the same time (both hour and
minutes), they should be considered equal.

-We may want our clock object to use 24-hour notation
rather than 12-hour notation since we only need to track
hours and minutes, not the date.

DATA STRUCTURES:
-The hours and minutes will be represented with numbers,
and we will be working with numbers each time we add or
subtract from the time.

-The method that returns the clock's current time as a
string must convert the hour and minutes to a string
that is formatted properly: XX:XX.

ALGORITHM/PSEUDOCODE:

-Intialize a new clock object by calling the .at method
  -Hour will be given. If no minutes given, minutes will
  default to 0.

-When the "+" method is called:
  -If mins argument is greater than 1440,
    -Loop: Reduce by 1440 and reassign to `num`.

  -If updated hours is >= 24
    -Reduce hours by 24
    -Repeat until < 24

  -If updated minutes is >= 60
    -Add one to hour
    -Reassign updated minutes by 60
    -Repeat if updated minutes is still >= 60

-When the "-" method is called:
  -If the 'mins' argument is greater than 1440,
    -Loop: Reduce by 1440 and reassign to `num`.

  -Loop: If existing minutes is less than 'mins',
    -subtract 1 hour
    -Reassign existing minutes to -= 60
    -Repeat until less than 'mins'

=end
class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, mins=0)
    Clock.new(hours, mins)
  end

  def convert_hours
    if @hours >= 0 && @hours < 10
      @twenty_four_hours = "0" + @hours.to_s
    elsif @hours >= 10 && @hours <= 24
      @twenty_four_hours = @hours.to_s
    end
  end

  def convert_minutes
    if @minutes >= 0 && @minutes < 10
      @sixty_mins = "0" + @minutes.to_s
    elsif @minutes >= 10 && @minutes <= 60
      @sixty_mins = @minutes.to_s
    end
  end

  def adjust_mins_if_over_1440
    @mins -= 1440 while @mins > 1440
  end

  def reduce_hours_if_mins_greater_than_sixty
    while @mins >= 60
      @hours -= 1
      @mins -= 60
    end
  end

  def reduce_hours_if_greater_than_twenty_four
    @hours -= 24 while @hours >= 24
  end

  def +(mins)
    @mins = mins
    adjust_mins_if_over_1440

    while @mins >= 60
      @hours += 1
      @mins -= 60
    end

    reduce_hours_if_greater_than_twenty_four
    @mins = @minutes + @mins
    Clock.new(@hours, @mins)
  end

  def -(mins)
    @mins = mins
    adjust_mins_if_over_1440
    reduce_hours_if_mins_greater_than_sixty
    reduce_hours_if_greater_than_twenty_four

    @mins = @minutes - @mins

    while @mins < 0
      @mins += 60
      @hours -= 1
    end

    @hours = 23 if @hours < 0
    Clock.new(@hours, @mins)
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def to_s
    convert_hours
    convert_minutes
    "#{@twenty_four_hours}:#{@sixty_mins}"
  end
end
