[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
## Group Info
Group Name: The Bishops

Group Members: Will Nzeuton, Seth Huse
## Overview
We have a working chess game in which the two players alternate turns moving pieces and capturing players. The first player clicks on the piece they want to move and every possible location they could move that piece to lights up. They then click where they would like to move that piece, that move executes, and the game automatically advances to the next player's turn. This continues until one player checkmates the other or a stalemate occurs, at which point the game would end and the winner is displayed. The game also ends if the timer runs out. Players can also pause the game and have the option to drag pieces instead of clicking where to go.

[Video Presentation](https://drive.google.com/file/d/1G6ajnyPI3OOFzu4p_K-DotodGfuqsagg/view?usp=sharing)

[Updated Prototype](https://docs.google.com/document/d/1Qc9mvtx9Sfayk_KAUpcITQKfFgd-5aIoiJ5Eti2WXYs/edit?usp=sharing)

The one major bug is using skips with a piece selected. More details are provided in keybind instructions.
## Instructions
You MUST install the Sound library. Otherwise, nothing else is required to run our program. To restart the game, press p or the pause button and then press the "New Game" button. To pause the game, press p or the pause button. From the pause menu screen, you can choose to resume your game by pressing the "Resume" button. Other keybind instructions for skips are found in keybind instructions.
### Keybind Instructions
IMPORTANT NOTE: DO NOT use these keybinds when you have a piece selected or you will encounter a Null Pointer Exception. In order to use these keybinds, press the desired key (when a piece is not selected) and then click once for the board to change.

c - checkmate detection demonstration

e - en passant demonstration

t - castling demonstration