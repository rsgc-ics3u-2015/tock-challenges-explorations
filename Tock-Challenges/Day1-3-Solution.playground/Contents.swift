// Russell Gordon
// Day 1-3

// Notes:
//
// Going to make extensive use of Unicode scalar / ASCII equivalents for characters in the strings given.
//
// See the "Strings and Characters" page of the Swift Programming Language reference, specifically the
// final few sections of that page.  This was linked to from the homework post on Haiku.
//
// Need to import Foundation framework, which adds some convenience functions for strings
// (Specifically, "containsString" and "rangeOfString")
import Foundation

// Test cases (with expected output at right)
let sample1 = "joy"         // jikoyuz
let sample2 = "ham"         // hijamon
let sample3 = "zat"         // zuzatuv

// Input variable
let input = sample2

// Other variables
let vowels = "aeiou"
let consonants = "bcdfghjklmnpqrstvwxyz"
var output = ""

// Check that I did that correctly (should have 5 vowels and 21 consonants)
vowels.characters.count
consonants.characters.count

// Just to illustrate...
// (not strictly necessary for solution) but here are Unicode scalars for the vowels
for scalar in vowels.unicodeScalars {
    
    // Show the character and it's ASCII / scalar value
    print("Vowel as string is \(scalar.escape(asASCII: true)) and it's value is \(scalar.value)")
    
}
print("") // blank line

// Just to illustrate...
// (not strictly necessary for solution) but here are Unicode scalars for the consonants
for scalar in consonants.unicodeScalars {
    
    // Show the character and it's ASCII / scalar value
    print("Consonant as string is \(scalar.escape(asASCII: true)) and it's value is \(scalar.value)")
    
}
print("") // blank line

// Process...
// Iterate over the input, use the rules to build the output
for inputScalar in input.unicodeScalars {
    
    // The current character in the input
    let currentCharacter = inputScalar.escape(asASCII: true)
    
    // Check whether current character from input is a vowel
    if vowels.containsString( currentCharacter ) {
        
        output += currentCharacter     // vowels go directly to output
        
    } else { // It's a consonant
        
        // FIRST, copy the consonant itself
        output += currentCharacter
        
        // NEXT, copy the closest vowel (iterate over the vowels)
        var closestVowelBefore : UInt32 = 0
        var closestVowelAfter : UInt32 = 117
        for vowelScalar in vowels.unicodeScalars {
            
            // Find value of vowel closest to the consonant (before consonant)
            if inputScalar.value > vowelScalar.value {
                
                print("Before consonant \(currentCharacter) vowel is: \(vowelScalar.escape(asASCII: true))")
                closestVowelBefore = vowelScalar.value
                
            }
            
            // Find value of vowel closest to the consonant (after consonant)
            if inputScalar.value < vowelScalar.value {
                
                print("After consonant \(currentCharacter) vowel is: \(vowelScalar.escape(asASCII: true))")
                closestVowelAfter = vowelScalar.value
                
                // Stop loop after we find the closest vowel after
                break
                
            }
            
        }
        
        // Now determine which vowel is closer
        if closestVowelAfter == closestVowelBefore {
            
            // Use before
            output += String(UnicodeScalar(closestVowelBefore))
            
        }
        else if inputScalar.value - closestVowelBefore == closestVowelAfter - inputScalar.value {
            
            // Use before, per rules
            // Convert the vowel value back to string and add to output
            output += String(UnicodeScalar(closestVowelBefore))
            
        }
        else if inputScalar.value - closestVowelBefore > closestVowelAfter - inputScalar.value {
            
            // Use after, it's closer
            // Convert the vowel value back to string and add to output
            output += String(UnicodeScalar(closestVowelAfter))
            
        }
        else {
            
            // Use before, it's closer
            // Convert the vowel value back to string and add to output
            output += String(UnicodeScalar(closestVowelBefore))
            
        }
        
        // FINALLY, copy the next consonant in the alphabet (unless it's a Z)
        if inputScalar.value == 122 {
            
            output += currentCharacter // copy Z directly
            
        } else {
            
            // Where is the position of this consonant in the list of consonants?
            var consonantPosition = consonants.rangeOfString(currentCharacter)!.startIndex
            
            // Get the next consonant's position
            var nextConsonantPosition = consonantPosition.advancedBy(1)
            
            // Now actually get the next consonant as a String
            var nextConsonant = String( consonants[nextConsonantPosition] )
            
            // Copy the next consonant to the output
            output += nextConsonant
        }
        
    }
    
}

// Output
print("")
print("Input given was: \(input)")
print("Output is: ")
print("\(output)")

