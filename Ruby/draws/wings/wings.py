from turtle import *
import sys
import math

def wingR(mult):   
    color('white') 
    home()
    color('red')
    forward(128*mult)
    left(-90)
    forward(40*mult)
    #flap
    left(-90)
    forward(20)
    left(90)
    left(20)
    forward(220)
    left(180)
    forward(220)
    left(-110)    
    forward(20)
    left(-90)

    left(20)
    forward(220*mult)
    left(-20-90)
    forward(30*mult)
    left(-55)
    forward(305*mult)

def wingL(mult):   
    color('white') 
    home()
    color('red')
    forward(128*mult)
    left(90)
    forward(40*mult)
    left(-20)
    forward(220*mult)
    left(20+90)
    forward(30*mult)
    left(55)
    forward(305*mult)

wingL(1)
wingR(1)
done()