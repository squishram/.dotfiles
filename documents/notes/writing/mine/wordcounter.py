"""
Best use a .txt or .md file, idk how docx (word document) will fare
It will do a word count, and count the number of unique words
It also lists the unique words. That's it!
"""

import string

###############
# USER INPUTS #
###############

# what's the maximum number of words?
max_total_words = 200
# what's the maximum number of unique words?
max_unique_words = 50
# put the name of your writing sample here - make sure it's in the same folder as this code
file_name = "cheater.txt"
# alternatively, remove the hash in front of the below statement to enter the file name manually each time
# file_name = str(input())
# that's it!

###################
# END USER INPUTS #
###################

with open(file_name) as text_file:
    # reads text file as string
    text_file = text_file.read()
    # remove capital letters and punctuation from the text
    word_list = text_file.translate(str.maketrans('', '', string.punctuation)).lower()

# save as a list (to get total word count)
word_list = sorted(word_list.split())
# then convert it to a set, which removes duplicates (to get unique word count)
word_set = sorted(set(word_list))

# this will contain the number of instances of each word
word_count = []
# number of instances of each word in the text
for word in word_set:
    word_count.append(word_list.count(word))

#############
# PRINTOUTS #
#############

# how many words you've used
print(f"The total  number of words is {len(word_list)}")
print(f"The number of unique words is {len(word_set)}")

# all the words, how many times they've been used
print("\nThese are all the words currently in the text,")
print("and the number of times they've been used")
for word, count in zip(word_set, word_count):
    if count > 1:
        print(count, word)

# words that have only been used once (easiest to trim if over budget)
print("\n The ones below here have only been used once:")
total = 0
for word, count in zip(word_set, word_count):
    if count <= 1:
        print(count, word)
        total += 1
print(f"There are {total} single-use unique words")

# how many words ya got left
if max_total_words - len(word_list) < 0:
    print(f"\nYou are {len(word_list) - max_total_words} words over-budget")
else:
    print(f"\nYou have {max_total_words - len(word_list)} words left to write")

# how many unique words ya got left
if max_unique_words - len(word_set) < 0:
    print(f"You are {len(word_set) - max_unique_words} unique words over-budget")
else:
    print(f"You have {max_unique_words - len(word_set)} unique words left")
