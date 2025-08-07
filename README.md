# War Card Game

A Ruby implementation of a War card game.

### Running the Game

The game accepts exactly 2 or 4 players

# Two players
bin/war Clyde Tom

# Four players  
bin/war Clyde Tom Charlie David

### Example Output
Clyde wins with 52 cards!
or
Game reached maximum rounds—no winner (stalemate).

## Tests
rake spec 
or
bundle exec rspec