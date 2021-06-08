## Clock challenge

#### Duration

This exercise took me 3 hours and four minutes to complete. 

#### Approach

This challenge wasn't too difficult, however the reason it took me so long to complete the exercise is due to me making some poor design choices up front.

The biggest mistake I made wasn't writing up a strong Algorithm in my PEDAC before I started to code. In my mind I told myself, *"I know how clocks work, this should be a piece of cake."* Big mistake.

I had finished most of the code, including the `+` method, but ran into some complicated issues with the `-` method. Due to my lack of Algorithm, I was struggling keeping all of the logic in my head as I was trying to deal with the `-` test cases.

Two hours after initially starting to code, I stopped coding and took a few steps back. I went and wrote up a detailed Algorithm for the `+` and `-` methods on how the logic should work.

After writing up the Algorithm logic, I then realized that many of logic I previously had written would work better as simple loops, as opposed to the unnessesarily complicated `if..else` conditional logic I was using up until that point. I also realized that some of the logic would likely be duplicated between both the `+` and `-` methods, so it would likely be extrapolated out into separate methods to keep the code DRY.

I then completely scrapped all of my existing `+` and `-` methods' code, then completely re-wrote it based on the new Algorithm.

Note: It was easier completely starting over from scratch (for those two methods) because I knew I would have to later be doing some complicated refactoring if I tried modifying those existing methods as-is. By scrapping the existing code, I would be writing the methods more cleanly from the beginning, thus reducing the amount of time I'd need to spend refactoring after passing the test cases.

The way I solve the challenges is: Write code => Make sure the code passes all test cases => Refactor code to pass Rubocop tests.

#### Refactoring

After writing up an Algorithm and re-writing the `+` and `-` methods, the code then passed all of the test cases. However, upon running Rubocop, it said my `-` method was too complex. I then did some refactoring of both the `+` and `-` methods to break out these two methods into smaller methods, through the use of helper methods.

I added such helper methods such as `adjust_mins_if_over_1440`, `reduce_hours_if_mins_greater_than_sixty`, and `reduce_hours_if_greater_than_twenty_four`. Rubocop then passed with no errors!

I was also using a lot of local variables within the `+` and `-` methods, which wouldn't work with the added helper methods. I then scrapped the local variables and decided to use the instance variables `@hours` and `@minutes` directly, so I wouldn't run into scoping issues when using the helper methods.

I'm sure there's further refactoring that can be done, but as-is the code passes all of the test cases with no Rubocop issues.

