# Lab 01 Create minimal source-to-source compilers (transpliers)
In this lab, we are going to implement a set of minimal **_source-to-source
compilers_**, also known as **_transpilers_** or **_transcompilers_**.  These
minimal compilers will serve as bases for implement a full retargetable
compiler.  In this lab, the structure of the compiler is very simple because it
contains only one component, the **_target code generator_**.

## Objectives:
- Incrementally implement the compiler in a back-to-front approach.
- Lay down the basis for implementing a full retargetable compiler.
- Understand a minimal compiler structure with one component, namely
**_target code generator_**.

## Learning outcomes:
After this lab, learner should be able to
- create 5 minimal compilers.
- recognize the similiarities and differences of the target codes in
- compare the differences between target codes in 5 languages.

## Tasks
Create 5 transpilers for generating target codes in 5 different target languages language (regular text file, Python code, C code, C++ code, and C# code, respectively).  The input into each transpiler is a source file (text file with the extension .src) containing only a positive integer.  The output from the transpiler is the source code in a target.  For this lab, we assume that the source file is always correct.  There are no needs for error detection.  We will handle error in the later labs.

The specifications for the target codes are as follows:
1. A text file with extension .txt containing exactly the number from the source file.  In other words, just copy the source file.

2. A Python 3 source code with extension .py containing the statement to output the number from the source file.  The target code should be executable by a Python 3 interpreter and produce the output as the number from the source file.

3. A C source code with extension .c containing the program to output the number from the source file.  Learners should be able to compile the target code using a C compiler to generate the executable program.  The program should print the number originally in .src file to the screen.

4. A C++ source code with extension .cpp containing the program to output the number from the source file.  Learners should be able to compile the target code using a C++ compiler to generate the executable program.  The program should print the number originally in .src file to the screen.

5. A C# source code with extension .cs containing the program to output the number from the source file.  Learners should be able to compile the target code using a C# compiler to generate the executable program.  The program should print the number originally in .src file to the screen.
