require_relative  'Plane'
require_relative  'formulas'

#plane = Plane.new

#stall_speed = stall_speed(plane.get_plane_weight,plane.get_air_density,plane.get_wing_surface,plane.get_sustentation_coefficient)
#array = take_off_distance_time_resistence(plane.get_plane_weight,plane.get_air_density,plane.get_air_density_0,plane.get_wing_surface,plane.get_plane_power,plane.get_taxi_coefficient)
#puts array

#definir resultados para el test:
plane_Test = Plane.new

puts "Datos para test-1"

air_density = plane_Test.get_air_density()

puts "get_air_density():                   " + (air_density).to_s

air_density_0 = plane_Test.get_air_density_0()

puts "get_air_density_0():                 " + (air_density_0).to_s

plane_weight = plane_Test.get_plane_weight()

puts "get_plane_weight():                  " + (plane_weight).to_s

wing_surface = plane_Test.get_wing_surface()

puts "get_wing_surface():                  " + (wing_surface).to_s

plane_power = plane_Test.get_plane_power()

puts "get_plane_power():                   " + (plane_power).to_s

taxi_coefficient =  plane_Test.get_taxi_coefficient()

puts "get_taxi_coefficient():              " + (taxi_coefficient).to_s

sustentation_coefficient = plane_Test.get_sustentation_coefficient()

puts "get_sustentation_coefficient():      " + (sustentation_coefficient).to_s

puts "get_plane_power():                   " + (plane_Test.get_plane_power()).to_s

puts "Datos para test-2"

puts "degree_to_radians(0):                " + (degree_to_radians(0)).to_s

puts "degree_to_radians(45):               " + (degree_to_radians(45)).to_s

puts "degree_to_radians(90):               " + (degree_to_radians(90)).to_s

puts "sustentation_force():                "  + (sustentation_force(0,100,wing_surface,air_density)).to_s

stall_speed = stall_speed(plane_weight,air_density,wing_surface,sustentation_coefficient)

puts "stall_speed():                       " + ( stall_speed ).to_s
 
puts "rotation_speed():                    " + (rotation_speed(stall_speed)).to_s

puts "lift_speed():                        " + (lift_speed(stall_speed)).to_s

puts "v2_speed():                          " + (v2_speed(stall_speed)).to_s

puts "sustentation_speed_one():            " + (sustentation_speed_one(0,plane_weight,wing_surface,air_density,sustentation_coefficient)).to_s

puts "sustentation_speed_two():            " + (sustentation_speed_two(plane_weight,air_density,wing_surface,5,4)).to_s

puts "takeoff_distance_time():             " + (takeoff_distance_time(1.1*stall_speed,1.807)).to_s

puts "normal_speed():                      " + (normal_speed(1.1*stall_speed,1.1*stall_speed)).to_s

thrust    =  variation_thrust_asa_function_of_density(plane_power,air_density,air_density_0)

puts "variation_thrust_asa_function_of_density(): " + (thrust).to_s

thrust_t  = real_thrust_by_weight(thrust,plane_weight)

puts "real_thrust_by_weight():             " + (thrust_t).to_s

takeoff_sustentation_coefficient = sustentation_coefficient_takeoff(plane_weight,stall_speed*1.1,wing_surface,air_density)

puts "sustentation_coefficient_takeoff():  " + (takeoff_sustentation_coefficient).to_s

s_value = s_value(thrust_t,0.08,1,takeoff_sustentation_coefficient,taxi_coefficient)
 
puts "s_value():                           " + (s_value).to_s

puts "takeoff_time():                      " + (takeoff_time(stall_speed*1.1,9.8,thrust_t,taxi_coefficient,s_value,1)).to_s

puts "takeoff_distance():                  " + (takeoff_distance(stall_speed*1.1,9.8,thrust_t,taxi_coefficient,s_value,1)).to_s

dist_time = take_off_distance_time_resistence(plane_weight,air_density,air_density_0,wing_surface,plane_power,taxi_coefficient)

puts "take_off_distance_time_resistence(): " + (dist_time).to_s

avg_acc = takeoff_avarage_acceleration(dist_time[0],dist_time[1])

puts "takeoff_avarage_acceleration():      " + (avg_acc).to_s

puts "v1_speed(3000):                      " + (v1_speed(3000,avg_acc,2)).to_s

puts "takeoff_avarage_speed():             " + takeoff_avarage_speed(dist_time[0],dist_time[1]).to_s
  
puts "distance_traveled():                 " + distance_traveled(1.1*stall_speed,60,20).to_s

puts "high_traveled():                     " + high_traveled(1.1*stall_speed,60,20).to_s