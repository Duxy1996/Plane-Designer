
def degree_to_radians(angle)
    return angle * Math::PI/180.0
end

def sustentation_calc(atack_angle_degree,speed,wing_surface,air_density)   
    angle_in_radians = degree_to_radians(atack_angle_degree)   
    in_air_coefficient = 1.8   
    sustentation =  air_density * speed * speed * wing_surface
    sustentation = sustentation * in_air_coefficient
    sustentation = sustentation * Math.cos(angle_in_radians) / 2.0
    return sustentation
end

def sustentation_speed_calc_one(atack_angle_degree,plane_weight,wing_surface,p_coeficient,coefictien_l_m) 
    angle_in_radians = degree_to_radians(atack_angle_degree)      
    s_min_not_stall = Math.sqrt((2*plane_weight)/(p_coeficient * wing_surface * coefictien_l_m * Math.cos(angle_in_radians))) 
    return s_min_not_stall
end

def sustentation_speed_calc_two(plane_weight,p_coeficient,wing_surface,k,c) 
    s_min_not_stall = Math.sqrt((2*plane_weight/(p_coeficient*wing_surface)) * Math.sqrt(k/c)) 
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
def cal_for_get_normal_speed(speed,takeoff_speed)
    return speed/takeoff_speed
end

def variation_thrust_asa_function_of_density(real_thrust,air_density,air_density_0)
    variation = real_thrust*((air_density/air_density_0)**(7.0/10))
    return variation
end

def real_thrust_by_weight(thrust,plane_weight)
    return thrust/plane_weight
end
#CL_OF
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

def vertical_speed(plane_weight,air_density,wing_surface,sustentation_coefficient)
    numerator = Math.sqrt(2 * plane_weight)
    denominator = Math.sqrt(air_density * wing_surface * sustentation_coefficient)
    return numerator/denominator
end

def takeoff_time(speed_lof,gravity,thrust_t,taxi_coefficient,s_value,avarage_speed)
    numerator = speed_lof * Math.log(s_value)
    denominator = gravity * (thrust_t-taxi_coefficient) * 2 * s_value
    return  numerator/denominator
end

def takeoff_distance(speed_lof,gravity,thrust_t,taxi_coefficient,s_value,avarage_speed)
    numerator = speed_lof * speed_lof * Math.log(s_value + avarage_speed)    
    denominator = gravity * (thrust_t-taxi_coefficient) * 2 * s_value    
    return  numerator/denominator
end


def take_off_distance_time_resistence()

end

air_density = 0.8547 #p
air_density_0 = 1.225 #p0
plane_weight = 3260000 #W
wing_surface = 511 #S

puts sustentation_calc(0,100,wing_surface,air_density)
puts sustentation_speed_calc_one(0,plane_weight,wing_surface,air_density,0.5)
puts sustentation_speed_calc_two(plane_weight,air_density,wing_surface,4,1)
puts takeoff_distance_time(160,2)
speed_lof = 1.1*vertical_speed(plane_weight,air_density,wing_surface,1.8)
thrust =  variation_thrust_asa_function_of_density(172600*4,air_density,air_density_0)
puts thrust
thrust_t = real_thrust_by_weight(thrust,plane_weight)
takeoff_sustentation_coefficient = sustentation_coefficient_takeoff(plane_weight,speed_lof,wing_surface,air_density)
s_value = s_value(thrust_t,0.08,1,takeoff_sustentation_coefficient,0.02)
puts("velcidad")
puts speed_lof
puts ("CLE")
puts takeoff_sustentation_coefficient
puts ("s_value")
puts s_value
puts ("thrust_t")
puts thrust_t
puts("Distancia")
puts takeoff_distance(speed_lof,9.8,thrust_t,0.02,s_value,1)