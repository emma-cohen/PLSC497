# Manupulating text in R

#1. Find a sentence online. Save it as a string. 
require(quanteda)
s1 <- 'The National Football Conference champion Tampa Bay Buccaneers defeated the American Football Conference champion Kansas City Chiefs.'
s1

#2. Select only the third word of the sentence. Save it as a new string.
s2 <- substr(s1, 14,21)
s2

#3. Choose a letter that appears in your sentence. Use the gsub command to replace all instances of that letter with a period. 
gsub('l','.',s1)
