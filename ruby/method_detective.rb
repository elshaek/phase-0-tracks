# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

p "iNvEsTiGaTiOn".replace("InVeStIgAtIoN")
# => “InVeStIgAtIoN”



p "zom".insert(2, "o")
# => “zoom”


p "enhance".center(15)
p "enhance".ljust(11).rjust(15)
# => "    enhance    "

p "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

p "the usual".concat(" suspects")
#=> "the usual suspects"

# " suspects".<???>
# => "the usual suspects"

p "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

p "z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# It's the  ordinal number of "z" as a one-character string

p "How many times does the letter 'a' appear in this string?".count("a")
# => 4