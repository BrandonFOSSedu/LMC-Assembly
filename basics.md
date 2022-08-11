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

Example 2: Load the value at the label VAR1 (named memory address).
```
	LDA VAR1
	OUT
	HLT
VAR1	DAT 22
```


