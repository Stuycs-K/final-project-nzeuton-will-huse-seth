# Work Log

## Will

### 5/22

Finished setting up Piece class, some methods still pending. Finished main function for Bishop class.

### 5/23

Optimized isValidPosition() + changed and created many new Piece accessor methods and created new Piece subclasses for Queen and Rook.

### 5/24

Created the logic for moving pawns and knights

### 5/25

Fixed the logic for moving pawns, fixed a bug present in all Piece subclasses

### 5/26
I changed the color pallette of our chess game, and improved the way we retreive the images of each piece. I began working on creating check detection, which almost entirely works. I also replaced some repetitive code with helper methods and created more variables to clean up the main program.

### 5/27
I added check detection and added checkmate detection. We should now have a completed MVP.

### 5/28
I began working on implementing special moves like en passant.

### 5/29
I continued to work on en passant and made some progress. En passant still has issues and a new pawn issue was found to do as a result of en passanting.

### 5/30
I completed en passant. 

### 5/31
I started working on castling. It works except a player can currently castle themself into a check.

### 6/2
I created a castling keybind for the demo. I fixed castling so that players cannot castle into or across a check and also cannot castle when in check.

### 6/3
I finished castling to adapt it to work with the new aesthetic changes Seth made. I also added stalemate detection.

### 6/4
I added simple sound effects to the game and reorganized our assets.

### 6/8
I finally finished the timers I had been working on for a couple of days.

### 6/9
I merged my timer changes to work with Seth's pause menu.
## Seth

### 5/22

I worked on the constructor for the chess class, which includes initializing all the pieces to their correct starting place on the board.

### 5/23

I worked on thinking through the logic with Will, which involved writing new accessor methods and figuring out more efficient ways to implement this. I also wrote more of the chess class, including the methods that modify the board and facilitate the turns.

### 5/24

I worked on more methods in the Chess class that better link it with Piece and then I started working on setup and mouseClicked.

### 5/25

I finished writing the game mechanics. Then, I merged my code so far with Will's and dealt with debugging and merge errors until the pieces showed up on the board in the correct spot. Some pieces move around, but not correctly yet.

### 5/26

I fixed a turn skip error. Then, I enabled a feature where a player can see valid positions a piece can go to once they select it. Then, I fixed valid position code for King, Rook, Bishop, and Queen. I also added images for all the pieces. This should be a working bare bones version of Chess now.

### 5/27

I added labels to the board and integrated them with the error system to improve the user experience.

### 5/28

I removed unnecessary variables in several subclasses and created a demo class for our MVP. I also made the square identification labels smaller and less invasive and I started updating our documentation in our project proposal, since we changed some methods from our original plans (added new ones, moved some).

### 5/29

I began to update our UML diagram to reflect changes in our implementation. I also made a keybind for a position that is one move away from a checkmate.

### 5/30

I conntinued to update our UML diagram. I also pushed the latest working version of our code to the demo branch.

### 5/31

I implemented a bare bones version of pawn promotion. I also pushed the latest working version to demo.

### 6/1

I made pawn promotion mandatory, fixed several bugs with it, and then improved the UI by showing the images of the pieces as options for promotion rather than just text.

### 6/2

Since castling didn't work, I spent a lot of time reverting commits on main. I made some slight UI improvements on my own end and pushed pawn promotion to demo. Castling will not make the demo.

### 6/3

I added a feature that shows all captured pieces on the side that captured them and made it work with all captures, including en pessant captures. I also added a dragging pieces feature that allows players to drag pieces instead of clicking on the squares twice.

### 6/4

I fixed a visual bug with moving pieces.

### 6/5

I began working on menu screens for the start and pause features.

### 6/6

I improved the looks and functionality of the start and pause features.

### 6/7

I added a pause button and created space at the bottom of the screen for the timer feature.

### 6/8

I started updating the README file with our project description and instructions. I also found a bug in checkmate detection.

### 6/9

I bug tested, reorganized the display, and recorded our demo video. I also updated our UML diagrams and README.