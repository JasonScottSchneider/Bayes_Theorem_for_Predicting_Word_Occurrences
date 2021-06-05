/*
Bayes Theorem for Predicting Word Occurrences v.1.0
author: Jason Schneider
date: Jun 5, 2021


This is more of a corpus linguistics issue, but I am trying to find the probability of "small" occurring after the indefinite determiner "a" in "A small dog jumped over the fence. The dog used its small paws to jump over the fence. The fence was no challenge. A small man had a llama, but the tall woman had a small alpaca."

A = probability of "small"

B = probability of "a"

A|B = probability of "small" after "a"

This part involves a little math using Bayes Theorem.

A|B = (B|A*A)/B

I am just playing around with probability and doing it by hand to analyze a corpus, and I am just trying to check whether I figured this properly as I check the probability of the occurrences of words after one another by hand doing good ol' fashion math instead of over relying on modules and libraries from R or Python just to ensure I grasp this concept.

Calculating this by hand, I get

count of "small" = 4

count of "a" = 4

A = 0.10810810810810811

B = 0.10810810810810811

count of "small" occurring after "a" = 3

BA = 0.75

probability of "small" occurring after "a" = 0.75
*/


import Foundation

//string
var s = "A small dog jumped over the fence. The dog used its small paws to jump over the fence. The fence was no challenge. A small man had a llama, but the tall woman had a small alpaca."

//make all characters in string lower case
s = s.lowercased()

//remove all punctuation
s.removeAll(where: {$0.isPunctuation})

print(s)
//print(type(of: s))

//list all words from string into an array
var w = s.components(separatedBy: " ")

print(w)

//count the total number of words from the string
var count = 0
for _ in w {
    count += 1
}
print(count)

//count the number of times "small" occurs in the string
var A_counts = 0
for i in w {
    if "small" == i {
        A_counts += 1
    }
}
print("A_counts = \(A_counts)")

//count the number of times "a" occurs in the string
var B_counts = 0
for k in w {
    if "a" == k {
        B_counts += 1
    }
}
print("B_counts = ",B_counts)

//derive the discrete probability for "small" and "a"
var A = Double(A_counts)/Double(count)
var B = Double(B_counts)/Double(count)
print("A = \(A)")
print("B = \(B)")

//derive the conditional probability of "a" occurring with "small"
var BA_counts = 0
for i in 0..<w.count {
    if w[i] == "a" && w[i+1] == "small" {
        BA_counts += 1
    }
}
print("BA_counts = \(BA_counts)")

//Predict the probability of "small" occurring after "a" using Bayes' Theorem 
var BA = Double(BA_counts)/Double(A_counts)
print("BA = \(BA)")

