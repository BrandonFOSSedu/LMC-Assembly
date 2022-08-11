# LMC Assembly Basics
The Little Man Computer provides a simple model of a computer: CPU, RAM, input, output, and storage. Though the LMC is simple, the assembly code snippets below cover the *entire* range of fundamental programming constructs found in every other programming language. After reading and working through these examples, students will have basic understanding of how basic programming techniques are implemented at a low level.

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
