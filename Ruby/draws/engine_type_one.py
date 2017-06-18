from turtle import *
import sys
import math

def engine_type_one(mult):
    color('white')
    home()
    color('red')
    for x in range(0,10):
        left(1)
           
    for y in range(0,20):
        left(-1)
        forward(6*mult)  
    left(-80)
    forward(15*mult)
    left(80)
    forward(40*mult)
    left(10)
    forward(10*mult)
    left(-90)
    forward(10*mult)
    left(90)
    forward(20*mult)
    left(-90)
    forward(10*mult)
    left(-90)
    forward(20*mult)
    left(90)
    forward(10*mult)
    left(-90)
    forward(10*mult)
    left(10)
    forward(40*mult)
    left(80)
    forward(15*mult)
    left(-80)
    for y in range(0,20):
        left(-1)
        forward(6*mult) 
    left(-80)
    forward(74*mult) 
    left(-90)
    for x in range(0,10):
        left(1)           
    for y in range(0,3):
        left(-1)
        forward(6*mult)  
    left(-7)
    left(-90)
    forward(80*mult)

engine_type_one(3)
done()