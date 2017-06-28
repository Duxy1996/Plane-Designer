# File:  test.rb

require_relative "formulas_clase"
require_relative "Plane"
require_relative "PhisicResources"
require "test/unit"

def truncate(number)
    return ((number*10000).to_i).to_f/10000
end
 
class TestSimpleNumber < Test::Unit::TestCase
  
  

  def test_data
    plane_Test = Plane.new
    assert_equal(1.225, plane_Test.get_air_density())
    assert_equal(1.225, plane_Test.get_air_density_0())
    assert_equal(3260000, plane_Test.get_plane_weight())
    assert_equal(511, plane_Test.get_wing_surface())
    assert_equal(690400, plane_Test.get_plane_power())
    assert_equal(0.02, plane_Test.get_taxi_coefficient())
    assert_equal(1.8, plane_Test.get_sustentation_coefficient())
  end

  def test_forms_radians       
    assert_equal(0.0, degree_to_radians(0))
    assert_equal(0.7853,truncate(degree_to_radians(45)))
    assert_equal(1.5707, truncate(degree_to_radians(90)))
  end

  def test_forms_calcs
    plane_Test = Plane.new 
    phisics_Test = PhisicResources.new 
    assert_equal(5633775.0, truncate(sustentation_force(0,100,plane_Test,phisics_Test)))
    assert_equal(76.0692  , truncate(stall_speed(plane_Test,phisics_Test))) 
    assert_equal(68.4623  , truncate()) 
    assert_equal(83.6761  , truncate()) 
    assert_equal(91.2830  , truncate())
    assert_equal(76.0692  , truncate())
    assert_equal(102.0575 , truncate())
    assert_equal(1976.1299, truncate())
    assert_equal(1.0      , truncate())
    assert_equal(690400.0 , truncate())
    assert_equal(0.2117   , truncate())
    assert_equal(1.4876   , truncate())
    assert_equal(-0.2103  , truncate())
    assert_equal(48.1107  , truncate())
    assert_equal(2091.2680, truncate())
    assert_equal(48.1107  , truncate())
    assert_equal(1.8069   , truncate())
    assert_equal(75.4705  , truncate())
    assert_equal(86.9356  , truncate())
    assert_equal(4717.7921, truncate())
    assert_equal(1717.1359, truncate())
  end
 
end