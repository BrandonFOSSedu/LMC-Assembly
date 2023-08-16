# Load Instruction and Assembly Labels

The Little Man Computer (LMC) uses a simple assembly language. Peter Higginson's website has [documentation that explains the LMC and it's assembly language](https://peterhigginson.co.uk/LMC/help.html).

The LMC has just 9 different operations it can perform. Rather than having to memorize which opcode corresponds to which instruction and manually typing in the machine instructions, LMC offers an *assembly language* to assist programmers.
The LMC assembly language uses 3 letter mnemonics. Refer to the documentation above to see all the assembly instructions.

## The Load Instruction
`LDA *address*` - Loads the data at *address* into the accumulator

The load instruction, `LDA`, is used to move data *into* the CPU. Loading data from RAM is the primary way the processor acquires data to process.

### Examples
`LDA 45  // Load data from memory address 45 into the accumulator`  
`LDA 99  // Load data from memory address 99 into the accumulator`


## Using Labels
Keeping track of the memory addresses for your data is very error prone. Assembly languages provide *labels* to make programming with memory addresses easier. Rather than remembering or calculating the location of memory by hand, labels let the programmer give a name to their data and the assembler program converts those label names into the actual addresses.

`LDA myNum`  
`myNum  dat  12`

In the above example, the label "myNum" is used to refer to the location of the data (the value 12).  

