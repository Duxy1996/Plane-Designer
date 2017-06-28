require_relative  'Plane'
require_relative  'formulas'

plane = Plane.new

puts plane.get_air_density()

stall_speed = stall_speed(plane.get_plane_weight,plane.get_air_density,plane.get_wing_surface,plane.get_sustentation_coefficient)
array = take_off_distance_time_resistence(plane.get_plane_weight,plane.get_air_density,plane.get_air_density_0,plane.get_wing_surface,plane.get_plane_power,plane.get_taxi_coefficient)
puts array

#definir resultados para el test:

