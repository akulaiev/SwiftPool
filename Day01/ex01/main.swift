print("Creating the first card (Card1) of color \"Spade\" and value \"Ace\"")
let card1 = Card(color : Color.Spades, value : Value.Ace)
print("Printing the description of Card1:")
print("\(card1)\n")

print("Creating the second card (Card1) of color \"Diamond\" and value \"Three\"")
let card2 = Card(color : Color.Diamonds, value: Value.Three)
print("Printing the description of Card2:")
print(card2)
print("Checking if Card1 equals Card2 with == operator. The right answer is: \"false\"")
print("\(card1 == card2)\n")

print("Creating the third card (Card3) from Card2")
let card3: Card = card2
print("Printing the description of Card3:")
print(card3)
print("Checking if Card3 equals Card2 with == operator. The right answer is: \"true\"")
print(card2 == card3)
print("Checking if Card3 equals Card1 with isEqual method. The right answer is: \"false\"")
print("\(card3.isEqual(card1))\n")