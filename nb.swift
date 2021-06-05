//Bayes Theorem for Predicting Word Occurrences
//author: Jason Schneider
//date: Jun 5, 2021

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

