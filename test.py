# some_file.py
import sys
sys.path.insert(0, './example/')

import example

print "MOD: %d" %example.my_mod(4, 3)
print "Factorial(5): %d" %example.fact(5)
print "Global Variable: %d" %example.cvar.My_variable
