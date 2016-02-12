// Russell Gordon
// Day 1-2

// Notes:
//
// Look for a:
//
// :
//
// character. Then inspect the following two characters for the pattern we need.

// See the "Strings and Characters" page of the Swift Programming Language reference, specifically the
// final few sections of that page.  This was linked to from the homework post on Haiku.


// Test cases (with expected output at right)
let sample1 = "How are you :-) doing :-( today :-)" // happy
let sample2 = ":)"                                  // none
let sample3 = ":-) :-("                             // none
let sample4 = ": -)"                                // none
let sample5 = "This:-(is str:-(:-(ange te:-)xt"     // sad
let sample6 = "This is a trick :-"                  // none

// Input variable
let input = sample1

// Other required variables
var accessCharacterAtIndexExample = ""
var happyCount = 0
var sadCount = 0

// Process
for i in 0...input.characters.count - 1 {
    
    // NOTE: Since Swift as a language has full support for Unicode characters, and Unicode characters can
    // require different amounts of memory to store, it is not possible to directly access a charater in a
    // string with notation like:
    //
    // string[index]
    //
    // So the code immediately below isn't necessary for the problem solution, but, just to show how to
    // access a string's character using an index value...
    //
    // (You should click the "eye" or "+" icon in the side bar to see what this string looks like)
    accessCharacterAtIndexExample += "Char at index \(i) is \(input[input.startIndex.advancedBy(i)]) \n"
    
    // Check for a colon that could be start of a happy or sad face, but don't bother if we're
    // within two characters of the end of the input
    if input[input.startIndex.advancedBy(i)] == ":" && i < input.characters.count - 2 {
        
        // See whether next two characters make a happy or sad
        if input[input.startIndex.advancedBy(i + 1)] == "-" && input[input.startIndex.advancedBy(i + 2)] == ")" {
            
            happyCount += 1
            
        } else if input[input.startIndex.advancedBy(i + 1)] == "-" && input[input.startIndex.advancedBy(i + 2)] == "(" {
            
            sadCount += 1
            
        }
        
    }
    
}

// Check value of happy and sad counts
happyCount
sadCount

// Output results
if happyCount == 0 && sadCount == 0 {
    print("none")
} else if happyCount == sadCount {
    print("unsure")
} else if happyCount > sadCount {
    print("happy")
} else {
    print("sad")
}
