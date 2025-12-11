# CS4450-Parser-Project

# Project Description:

This project is an ANTLR4 parser for some specific language features of python in project_deliverable_3.py
The parser produces a parse tree printed as a string.

# Team Members:

Completed individually by Andrew Pullen

# Requirements, Setup, and Environment:

Requirements:
Python 3.x
ANTLR 4.x
antlr4-python3-runtime (pip install antlr4-python3-runtime)

File structure:
deliverable_3_grammar.g4: The final ANTLR grammar
parse3.py: Code for running the parser
project_deliverable_3.py: The test code 

Before running the parser, generate the ANTLR lexer and parser files:
antlr4 -Dlanguage=Python3 deliverable_3_grammar.g4

# How to Use/Run the Parser:

To run the parser:
Option 1 (generic Python 3 environment):
python parse3.py project_deliverable_3.py

Option 2 (Windows py launcher. This is what I was using):
py -3 parse3.py project_deliverable_3.py

A parse tree will be printed as a string.

# Project Demonstration Video Link:
https://www.youtube.com/watch?v=mHUY5BKqxo4
