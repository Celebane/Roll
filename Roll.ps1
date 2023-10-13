<#
.SYNOPSIS
DnD Dice roller

.DESCRIPTION
A script to simulate dice rolls with any combination
combination of dice types and both positive and 
negative modifiers.

.PARAMETER
Any Dice type can specified.
Dice types must be specified in the following formats:

1d4
1d6+1
2d12-2

If rolling more than one dice type they must be separated
by a comma.

.EXAMPLE
Roll 1d4
Rolls a 4 sided die. Returning the valuw of thr roll.

.EXAMPLE
Roll 1d6+1
Rolls a 6 sided die and adds +1 to the roll and returns that value.

.EXAMPLE
Roll 2d6+2, 1d8-4, 1d12
Rolls two 6 sided dice adding 2 to the roll, one 8 sided die
subtracting 4 from the roll and finally one 12 sided die and
returns the total sum of all dice rolled.

.NOTES
Requires the RPGDice module by Gilbert Sanchez.
https://github.com/HeyItsGilbert/RPGDice

.COMPONENT
RPGDice
#>




param (
    [Parameter(mandatory=$true)][string[]]$Dice=@()
)

$Subtotal = 0
$Total = 0
$Modifier = 0


foreach ( $Die in $Dice )
{
    "Rolling $Die"

    #Check if the Die has a positive modifier
    if ($Die -like "*+*") {
       #It does so we grab the modifier and strip it from the Die
       $Die = $Die -split "\+"
       $Modifier = $Modifier + $Die[1]
       $Die = $Die -ne $Die[1]
    }

    #Check if the Die has a negative modifier
    if ($Die -like "*-*") {
        #It does so we grab the modifier and strip it from the Die
        $Die = $Die -split "-"
        $Modifier = $Modifier - $Die[1]
        $Die = $Die -ne $Die[1]
     }

    #Split the Dice type from the number to throw
    $Die = $Die -split "d"

    #What type of Die do we want
    $D = New-Dice -Sides $Die[1]

    #Roll the number of dice specified
    for ($i = 0; $i -lt $Die[0]; $i++)
    {
        $Roll = New-DiceRoll -NoCrits -Dice $D
        
        #Add them together
        $Subtotal = $Subtotal + $Roll
    }

    #Add the subtotals of all types of Die thrown and their modifiers
    $Total = $Total + $Subtotal + $Modifier
}

$Total