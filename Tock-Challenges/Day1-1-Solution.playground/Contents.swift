// Russell Gordon
// Day 1-1

// Algorithm
// 
// Input
//  - As described in problem. 
//
// Process
// - validate input month (must be in range 1 to 12)
// - validate input day (must be in range 1 to 31)
// - once input validated
//      - convert input to equivalent in days only
//      - when days equivalent is less than 31 + 18: Before
//      - when days equivalent is equal to 31 + 18: Special
//      - otherwise, must be: After
//
// Output
// - As described in problem.

// NOTE: This represents one possible correct solution.
//       Not the only correct solution.

// Input values
let inputMonth = 2
let inputDay = 18

// Input checking
var validInput = true

// Validate input
if inputMonth < 1 || inputMonth > 12 {
    
    validInput = false
    print("That is not a valid month.")
    
}

if inputDay < 1 || inputDay > 31 {
    
    validInput = false
    print("That is not a valid day.")
    
}

// If there is valid input, proceed.
if validInput == true {
    
    // Get equivalent of input in days
    let daysEquivalent = (inputMonth - 1) * 31 + inputDay
    let specialDay = 31 + 18
    
    // NOTE: It doesn't matter that not every month as 31 days;
    // I know that January has 31 days, and I only care about
    // checking for February 18.
    
    // Produce output
    if daysEquivalent < specialDay {
        
        print("Before")
        
    } else if daysEquivalent == specialDay {
        
        print("Special")
        
    } else {
        
        print("After")
        
    }
    
}
