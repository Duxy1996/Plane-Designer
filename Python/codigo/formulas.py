import math
import sys

# El sustento tiene que ser igual al peso del avion
# Angulo en grados y velocidad en m/s
# Angulo a radianes
# Densidad del aire
# Coeficiente aereo
# Superficie alar m^2
def calculo_sustentacon(angulo,velocidad,superf_alar,densid_aire):    
    angulo_radi = angulo*math.pi/180.0    
    coefic_aere = 1.8   
    susL =  densid_aire*velocidad*velocidad*superf_alar
    susL = susL*coefic_aere*math.cos(angulo_radi)/2.0
    return susL

def calculo_crucero(angulo,W,S,p,CLM): # Calculo velocidad sustento 1
    angulo_radi = angulo*math.pi/180.0      
    v_cruise = math.sqrt((2*W)/(p*S*CLM*math.cos(angulo_radi))) 
    return v_cruise

def velocidad_crucero(W,p,S,k,c): # Calculo velocidad sustento 2
    vC = math.sqrt((2*W/(p*S))*math.sqrt(k/c)) #la raiz de k/c es el coeficiente 
    return vC

def distancia_despegue(v_despegue,aceleracion_cte):
    v_media = v_despegue/2 #velocidad medai m/s
    t_despe = v_despegue / aceleracion_cte*1.02  #segundos
    return (v_media*t_despe,t_despe)

def distancia_v1(longitud,aceleracion_cte,frenado_cte):
    aux = math.sqrt((longitud*aceleracion_cte*frenado_cte)/(2*aceleracion_cte+2*frenado_cte))
    v1 = 2*aux
    return v1 

def velocidad_equivalente_Two(P,M):
    # M = match number
    a = 365 # speed of sound at m/s    
    P_0 = 1013.25 #std level pressure
    EAS = a*M*math.sqrt(P/P_0)
    return EAS

def velocidad_equivalente_One(p,v):
    p_0 = 1.225 # densidad del aire al nivel del mar
    q = (p*v*v)/2 #dinamic presuere
    EAS = math.sqrt(2*q/p_0)
    return EAS

def velocidad_real(p,EAS):
    # EAS equivalent air speed
    # p densidad en la que nos encontramos
    p_0 = 1.225 # densidad del aire al nivel del mar
    return math.sqrt(p_0/p)*EAS

def aceleracion_max(fuerza,num_motor,masa):
	return (fuerza*num_motor)/masa

def aceleracion_despegue(fuerza,num_motor,masa):   
    return aceleracion_max(fuerza,num_motor,masa)/1.95

def distancia_recorrida(velocidad,tiempo,angulo):
    distancia = velocidad*tiempo*math.cos(angulo*math.pi/180.0);
    return distancia 

def altura_recorrida(velocidad,tiempo,angulo):
    distancia = velocidad*tiempo*math.sin(angulo*math.pi/180.0);
    return distancia     

def alcance_maximo():
    i = 1+1

def velocidad_despegue(W,p,S,CLM):
    # W peso al despegue
    # T empuje
    # S superficie alar
    # CD coeficiente de resistencia
    # CL coeficiente de sustentacion
    # P densidad aire lvl mar
    vS = math.sqrt((2*W)/(p*S*CLM)) 
    return vS

def velocidades(vS,k):
    vLOF = k*vS
    vR = 0.9*vS
    v2 = 1.2*vS
    return [vLOF,vR,v2]

#$ python formulas.py 6272 905 229000 6 -> Antonov
#3260 -> Masa boeing 747
pista_1500 = 1500
pista_2500 = 2500
pista_3000 = 3000

print ("Masa del avion")
print ( int(sys.argv[1])*1000/9.8)
W = int(sys.argv[1])*1000
SA = int(sys.argv[2]) #superficie alar
print ( "Peso del avion")
print (W)
print ("Aceleración despegue")
acd = aceleracion_despegue(int(sys.argv[3]),int(sys.argv[4]),int(sys.argv[1])*1000/9.8)
print(acd)

vS = velocidad_despegue(W,1.225,SA,1.8)
#vS = velocidad_despegue(3260*1000,1.225,511,1.8)
vels = velocidades(vS,1.1)
print ("Vs")
print (vS)
print ("VLOF")
print (vels[0])
dis_tiem = distancia_despegue(vels[0],acd)
if pista_1500 > dis_tiem[0]:
    print ( "V1 - 1500")
    print ( distancia_v1(pista_1500,acd,1))
if pista_2500 > dis_tiem[0]:
    print ( "V1 - 2500")
    print ( distancia_v1(pista_2500,acd,1))
if pista_3000 > dis_tiem[0]:
    print ( "V1 - 3000")
    print ( distancia_v1(pista_3000,acd,1))
print ("VR")
print (vels[1])
print ("V2")
print (vels[2])
print ("Distancia y tiempo")
print (dis_tiem)
print ("Sustentacion")
print (calculo_sustentacon(0,vS,SA,1.225))
print ("Crucero - 1")
print (calculo_crucero(0,W,SA,1.225,0.5))
print ("Crucero - 2")
print (velocidad_crucero(W,1.225,SA,4,1))
print ("EAS 1")
EAS = velocidad_equivalente_One(1.225,vels[0])
print (EAS)
print ("EAS 2")
print (velocidad_equivalente_Two(1013.25,vels[0]/365.0))
print ("TAS 2")

print (velocidad_real(1.225,EAS))
print ("Distancia recorrida 0")
sustent = calculo_sustentacon(0,vels[2],SA,1.225)
print(sustent)
print(distancia_recorrida(vels[2],60,0))
print ("Distancia recorrida 5")
sustent = calculo_sustentacon(5,vels[2],SA,1.225)
print(sustent)
print(distancia_recorrida(vels[2],60,5))

for i in range(1,9):
    print ("Distancia recorrida "+str(i*10))
    sustent = calculo_sustentacon(i*10,vels[2],SA,1.225)
    if (sustent - W) > 0:
        print(distancia_recorrida(vels[2],60,i*10))
    else:
        print("Stall")


