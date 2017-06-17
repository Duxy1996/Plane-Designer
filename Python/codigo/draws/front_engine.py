from turtle import *
import sys
import math

def front_rotor(mult,longitud,anchura,numero):
    #calculos
    yaw = 360.0/numero    
    hipotenusa = math.sqrt(longitud*longitud+anchura*anchura)
    asin_n = math.asin(float(anchura))
    angle = (57.2958*asin_n/float(longitud))
    area_circle = longitud*3.1415*longitud
    area_helix = numero*longitud*anchura/2.0
    print (area_helix)
    print (area_circle)
    if area_circle >= area_helix:
        print (yaw)
        print (hipotenusa)
        print (angle)
        left(-90)
        color('white')
        forward(longitud*1.1)
        left(90)
        color('black')
        circle(longitud*1.1)
        left(90)        
        color('white')
        forward(longitud*1.1)
        color('black')
        #left(90)
        for i in range(0,numero):
            forward(longitud)
            left(-90)
            forward(anchura)
            left(-90 - angle)
            left(-0)
            forward(hipotenusa)
            left(180-yaw+angle)
    else:
        print("No se puede disenar")

front_rotor(2,int(sys.argv[1]),int(sys.argv[2]),int(sys.argv[3]))
done()