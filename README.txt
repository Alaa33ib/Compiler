# TINY Language Lexer

## Assistance

Our group of 3 worked on designing and implementing the lexical analyzer (lexer) for the TINY language.
- Alaa alshahrani 443200618
- Noura mohammed 441203927
- Reema Almadhi 442200384

## Description

This lexical analyzer (lexer) for the TINY language tokenizes input TINY programs, identifying and outputting each token on a separate line in the same order as they appear in the input program. The lexer follows the specifications provided for the TINY language, including handling comments, keywords, identifiers, integers, and reporting errors for invalid identifiers or unrecognized symbols.

## Design Choices

1. **Tokenization**: The lexer tokenizes the input program based on predefined rules for identifiers, integers, keywords, comments, and whitespace. Keywords like `if`, `while`, `read`, `write` are recognized as tokens before checking for identifiers to ensure correct parsing.

2. **Error Reporting**: Error handling is implemented to report errors for unrecognized symbols and invalid identifiers according to the specifications provided. This includes detecting identifiers that start with a digit or an underscore, or end with an underscore.

3. **Input Source**: The lexer prompts the user to enter the name of the file containing the TINY program to be analyzed. This choice allows for flexibility in analyzing different TINY programs without modifying the code.

## Feedback and Comments

The implementation of the TINY language lexer adheres to the provided specifications and provides comprehensive error handling. However, thorough testing is necessary to ensure robustness and accuracy. Users are encouraged to test their code thoroughly using various TINY programs to cover all possible scenarios outlined in the specifications.

## Testing Example Program

To test the lexer, consider using the following example program:

while x < 10
if x < 5
write x
else
write 10
x = x + 1

This program covers some basic constructs of the TINY language, but additional test cases should be created to cover all possible scenarios outlined in the specifications.