# Instruction for compile and run the sample codes.

## Pre-requisite
A free pascal compiler (The codes were tested with Free Pascal 3.0.4)

## Compile the sample codes

```
>fpc transpile.pas
```

## Execute the sample codes

The sample codes require 3 parameters.
1. The name of the source file (.src).
2. The name of the template to be used to generate the target code.
3. The name of the target file.

For example,

```
>transpile sample.src template.c sample.c
```
