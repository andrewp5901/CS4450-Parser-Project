import sys
from antlr4 import *
from deliverable_3_grammarLexer import deliverable_3_grammarLexer
from deliverable_3_grammarParser import deliverable_3_grammarParser

def main(argv):
    input_stream = FileStream(argv[1])
    lexer = deliverable_3_grammarLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = deliverable_3_grammarParser(stream)
    tree = parser.file_input()
    print(tree.toStringTree(recog=parser))

if __name__ == '__main__':
    main(sys.argv)
