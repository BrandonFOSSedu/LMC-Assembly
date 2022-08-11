# LMC Assembly Basics
The Little Man Computer provides a simple model of a computer: CPU, RAM, input, output, and storage. Though the LMC is simple, the assembly code snippets below cover the most of fundamental programming constructs found in every other programming language (no arrays, functions, objects). After reading and working through these examples, students will have basic understanding of how basic programming techniques are implemented at a low level.

## Data
There are two main ways to get data into the LMC CPU: user input and data directives. Data in the LMC is defined as a *number* between 999 and -999.

### User Input
The 'INP' assembly instructions accepts a number from the input box and loads it into the accumulator register. Once the program has user input, it's often useful to store it for later use.

Example 1: Get user input and then output it.
```
	INP
	OUT
	HLT
```

Example 2: Get user input and then store it in memory location 99.
```
	INP
	STA 99
	HLT
```

Example 3: Get user input and then store it at memory location marked by the label "INPUT1".
```
	INP
	STA INPUT1
	HLT
INPUT1	DAT
```

### Data Directives
Data can be written into the program code itself using the 'DAT' directive. 'DAT' is not an instruction for the CPU to execute. Instead, it tells the program to insert a value at the position in the program where the directive appears. The usage of *labels* helps assembly programmers to *name* the memory address of data, rather than having to manually calculate the location of a 'DAT' directive.

Example 1: Load the value stored by the 'DAT' directive (hard coded memory address).
```
	LDA 03
	OUT
	HLT
	DAT 100
``` 

Example 2: Load the value at the label VAL1 (named memory address).
```
	LDA VAL1
	OUT
	HLT
VAL1	DAT 22
```

## Arithmetic
CPUs contain an "Arithmetic-Logical Unit", which is capable of the four main arithmetic operations and a number of logic operations. Unfortunately, the LMC only has two arithmetic operations: 'ADD' and 'SUB'. Both operations take the current value of the accumulator register and then add or subtract the value at the memory location specified.

Example 1: Add user input to data value at label VAL1.
```
	INP
	ADD VAL1
	OUT
	HLT
VAL1	DAT 14
```

Example 2: Subtract data value at label VAL1 from user input.
```
	INP
	SUB VAL1
	OUT
	HLT
VAL1	DAT 998
```

Example 3: Perform two operations using 3 values from user and store result at label RESULT.
```
	INP
	STA INPUT1
	INP
	STA INPUT2
	INP
	ADD INPUT1
	SUB INPUT2
	STA RESULT
	HLT
RESULT	DAT
INPUT1	DAT
INPUT2	DAT
```

## Branching
A CPU will execute it's instructions in sequence one after the other by default. However, there are special *branching* instructions that change the flow of execution by *directly changing* the the program counter register. Using the three branching instructions ('BRA', 'BRZ', & 'BRP'), programmers can conditionally execute specific sections of code. Just like with data, the usage of labels lets programmers name the memory address to branch to.

### 'BRA' - Unconditional Branch
Example 1: Unconditional branch jumps over section of code.
```
	LDA VAL1
	ADD VAL1
	BRA SKIP // The next two lines will never be executed
	ADD VAL1
	ADD VAL1
SKIP	OUT
	HLT
```

Example 2: Infinite Loop that outputs a running sum of user input.
```
LOOP	INP
	ADD VAL1
	STA VAL1
	OUT
	BRA LOOP
	HLT
VAL1	DAT 0
```

### BRZ - Branch when accumulator is zero

Example 1: Output 0 if both input are equal, otherwise halt
```
	INP
	STA INPUT1
	INP
	SUB INPUT1
	BRZ PRINT
	HLT
PRINT	OUT
	HLT
INPUT1	DAT
```

### BRP - Branch when accumulator is zero or positive

Example 1: Output the larger of two numbers
```
	INP
	STA INPUT1
	INP
	STA INPUT2
	SUB INPUT1
	BRP FIRST
	LDA INPUT2
	BRA PRINT
FIRST	LDA INPUT2
PRINT	OUT
	HLT
INPUT1	DAT
INPUT2	DAT
```

## ASCII - Output text based on ASCII code table
Inside of a computer all data is represented as numbers. A program has to decide whether to treat a value as a machine instruction, memory address, number, or text character. The American Standard Code for Information Interchange (ASCII) character encoding defines which value correspond to the different letters of the alphabet, as well as some special characters like punctuation. The LMC has a special instruction 'OTC' that will output a single ASCII character based on the value in the accumulator.

Example 1: Output user input as ASCII characters until input is 0.
```
LOOP	INP
	BRZ END
	OTC
	BRA LOOP
END	HLT
```

Example 2: Output the string "hello, world"
```
	LDA ONE
	OTC
	LDA TWO
	OTC
	LDA THREE
	OTC
	LDA FOUR
	OTC
	LDA FIVE
	OTC
	LDA SIX
	OTC
	LDA SEVEN
	OTC
	LDA EIGHT
	OTC
	LDA NINE
	OTC
	LDA TEN
	OTC
	LDA ELEVEN
	OTC
	LDA TWELVE
	OTC
	HLT
ONE	DAT 104 // h
TWO	DAT 101 // e
THREE	DAT 108 // l
FOUR	DAT 108 // l
FIVE	DAT 111 // o
SIX	DAT 44  // ,
SEVEN	DAT 32  // SPACE
EIGHT	DAT 119 // w
NINE	DAT 111 // o
TEN	DAT 114 // r
ELEVEN	DAT 108 // l
TWELVE	DAT 100 // d
INC	DAT 1
POS	DAT 
```

Bonus Example: Using a loop and self modifying code to print "hello, world".
```
LOOP	LDA ONE
	BRZ END
	OTC
	LDA 00
	ADD INC
	STA 00
	BRA LOOP
END	HLT
INC	DAT 1
ONE	DAT 104 // h
TWO	DAT 101 // e
THREE	DAT 108 // l
FOUR	DAT 108 // l
FIVE	DAT 111 // o
SIX	DAT 44  // ,
SEVEN	DAT 32  // SPACE
EIGHT	DAT 119 // w
NINE	DAT 111 // o
TEN	DAT 114 // r
ELEVEN	DAT 108 // l
TWELVE	DAT 100 // d
```
