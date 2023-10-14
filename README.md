# DnD Dice roller
\
A script to simulate dice rolls with any combination\
combination of dice types and both positive and\
negative modifiers.\

# Parameters
Any Dice type can specified as a parameter.\
Dice types must be specified in the following formats:\
1d4\
1d6+1\
2d12-2\
\
If rolling more than one dice type they must be separated\
by a comma.\
\
# Examples
Roll 1d4\
Rolls a 4 sided die. Returning the valuw of thr roll.\
\
Roll 1d6+1\
Rolls a 6 sided die and adds +1 to the roll and returns that value.\
\
Roll 2d6+2, 1d8-4, 1d12\
Rolls two 6 sided dice adding 2 to the roll, one 8 sided die\
subtracting 4 from the roll and finally one 12 sided die and\
returns the total sum of all dice rolled.\
\
Requires the RPGDice module by Gilbert Sanchez.\
https://github.com/HeyItsGilbert/RPGDice\
