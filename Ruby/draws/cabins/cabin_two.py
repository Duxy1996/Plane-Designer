from turtle import *
import os
import sys
import math



def cabin_one(longitud,mult):      
    color('red')    
    forward(-20*mult -longitud*mult)
    for x in range(0,5):
        left(7) 
        forward(-5*mult) 
    forward(-10*mult) 
    for x in range(0,14):
        left(10) 
        forward(-2*mult) 
    left(5) 
    forward(-44*mult - longitud*mult)    
    end_fill()  

cabin_one(int(sys.argv[1]),2)
cv = getcanvas()
cv.postscript(file="file_name.ps", colormode='color')

done()
