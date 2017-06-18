
def degree_to_radians(angle)
    return angle * Math::PI/180.0
end

def sustentation_force(atack_angle_degree,speed,wing_surface,air_density)   
    angle_in_radians = degree_to_radians(atack_angle_degree)   
    in_air_coefficient = 1.8   
    sustentation =  air_density * speed * speed * wing_surface
    sustentation = sustentation * in_air_coefficient
    sustentation = sustentation * Math.cos(angle_in_radians) / 2.0
    return sustentation
end

def sustentation_speed_one(atack_angle_degree,plane_weight,wing_surface,air_density,sustentation_coefficient) 
    angle_in_radians = degree_to_radians(atack_angle_degree)      
    s_min_not_stall = Math.sqrt((2*plane_weight)/(air_density * wing_surface * sustentation_coefficient * Math.cos(angle_in_radians))) 
    return s_min_not_stall
end

def sustentation_speed_two(plane_weight,air_density,wing_surface,k,c) 
    s_min_not_stall = Math.sqrt((2*plane_weight/(air_density * wing_surface)) * Math.sqrt(k/c)) 
    return s_min_not_stall
end

def takeoff_distance_time(takeoff_speed,takeoff_acceleration)
    avarage_speed = takeoff_speed/2 
    takeoff_time = takeoff_speed / takeoff_acceleration*1.02  
    takeoff_distance = avarage_speed*takeoff_time
    return [takeoff_distance,takeoff_time]
end
# Integration calculus for distance and time
# cosnidering runway resistence

def normal_speed(speed,takeoff_speed)
    return speed/takeoff_speed
end

def variation_thrust_asa_function_of_density(real_thrust,air_density,air_density_0)
    variation = real_thrust*((air_density/air_density_0)**(7.0/10))
    return variation
end

def real_thrust_by_weight(thrust,plane_weight)
    return thrust/plane_weight
end

def sustentation_coefficient_takeoff(plane_weight,takeoff_speed,wing_surface,air_density)
    numerator = 2*plane_weight
    denominator = air_density * wing_surface * takeoff_speed * takeoff_speed
    return numerator/denominator
end

def s_value(thrust_t,takeoff_coefficient_resistence,sustentation_coefficient,takeoff_sustentation_coefficient,taxi_coefficient)
    numerator = -(takeoff_coefficient_resistence-taxi_coefficient*sustentation_coefficient)
    denominator = takeoff_sustentation_coefficient*(thrust_t-taxi_coefficient)
    return numerator/denominator
end

def stall_speed(plane_weight,air_density,wing_surface,sustentation_coefficient)
    numerator = Math.sqrt(2 * plane_weight)
    denominator = Math.sqrt(air_density * wing_surface * sustentation_coefficient)
    return numerator/denominator
end

def takeoff_time(speed_lof,gravity,thrust_t,taxi_coefficient,s_value,avarage_speed)
    numerator = speed_lof 
    denominator = gravity * (thrust_t-taxi_coefficient) 
    simp_aprox = simpson_0_1(s_value)    
    return  (numerator/denominator)*simp_aprox
end

def takeoff_distance(speed_lof,gravity,thrust_t,taxi_coefficient,s_value,avarage_speed)
    numerator = speed_lof * speed_lof * Math.log(s_value + avarage_speed)    
    denominator = gravity * (thrust_t-taxi_coefficient) * 2 * s_value    
    return  numerator/denominator
end


def take_off_distance_time_resistence(plane_weight,air_density,air_density_0,wing_surface,plane_power,taxi_coefficient)
    speed_lof = 1.1*stall_speed(plane_weight,air_density,wing_surface,1.8)
    thrust =  variation_thrust_asa_function_of_density(plane_power,air_density,air_density_0)
    thrust_t = real_thrust_by_weight(thrust,plane_weight)
    takeoff_sustentation_coefficient = sustentation_coefficient_takeoff(plane_weight,speed_lof,wing_surface,air_density)
    s_value = s_value(thrust_t,0.08,1,takeoff_sustentation_coefficient,taxi_coefficient)
    distance = takeoff_distance(speed_lof,9.8,thrust_t,taxi_coefficient,s_value,1)
    time = takeoff_time(speed_lof,9.8,thrust_t,taxi_coefficient,s_value,1)
    return [distance,time]
end
# Calcs for speeds
def rotation_speed(stall_speed)
    return 0.9*stall_speed
end

def lift_speed(stall_speed)
    return 1.1*stall_speed
end

def v2_speed(stall_speed)
    return 1.2*stall_speed
end

def v1_speed(runway_length,acceleration,reverse_acceleration)
    aux = Math.sqrt((runway_length*acceleration*reverse_acceleration)/(2*acceleration+2*reverse_acceleration))
    v1 = 2*aux
    return v1 
end

#Equations for some information

def takeoff_avarage_acceleration(takeoff_distance,takeoff_time)
    takeoff_avarage_acceleration = (2*takeoff_distance)/(takeoff_time*takeoff_time)
    return takeoff_avarage_acceleration    
end

def takeoff_avarage_speed(takeoff_distance,takeoff_time)
    takeoff_avarage_acceleration = takeoff_avarage_acceleration(takeoff_distance,takeoff_time)
    takeoff_avarage_speed = takeoff_avarage_acceleration * takeoff_time
    return takeoff_avarage_speed
end

#Simpson aproximation calc for 1/(1+sx*x)
def simpson_0_1(s)
    calc = (1)+4*(1.0/(1+s*0.25*0.25))+2*(1.0/(1+s*0.5*0.5))+4*(1.0/(1+s*0.75*0.75))+(1.0/(1+s))    
    return (1/12.0)*(calc)
end

air_density = 0.855 #p
air_density_0 = 1.225 #p0
plane_weight = 3260000 #W
wing_surface = 511 #S
engine_power = 172600
engine_number = 4
taxi_coefficient = 0.02
sustentation_coefficient = 1.8
plane_power = engine_power * engine_number
stall_speed = stall_speed(plane_weight,air_density,wing_surface,sustentation_coefficient)
array = take_off_distance_time_resistence(plane_weight,air_density,air_density_0,wing_surface,plane_power,taxi_coefficient)
puts array

#system "python ./draws/cabin_one.py 100"