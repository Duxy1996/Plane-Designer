import math
import sys

def calculo_sustentacon(angulo,velocidad,superf_alar,densid_aire):    
    angulo_radi = angulo*math.pi/180.0    
    coefic_aere = 1.8   
    susL =  densid_aire*velocidad*velocidad*superf_alar
    susL = susL*coefic_aere*math.cos(angulo_radi)/2.0
    return susL




    

print(calculo_sustentacon(10,50,511,1.225))