from turtle import *
import sys
import math

def tail_one(longitud,mult):
    color('white')
    home()
    color('red')
    forward(30*mult + longitud*mult)
    for x in range(0,4):
        left(12)
        forward(5*mult)
    forward(20*mult)
    left(-48)
    forward(15*mult)
    left(-90)
    forward(25*mult)
    left(90)
    forward(10*mult)    
    for x in range(0,15):
        left(-10)
        forward(0.2*mult)
    forward(63.5*mult)
    for x in range(0,3):
        left(-10)
        forward(1*mult)
    forward(40*mult+ longitud*mult)

tail_one(int(sys.argv[1]),2)
done()