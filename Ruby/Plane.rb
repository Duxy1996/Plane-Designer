class Plane

    def initialize()
        @air_density = 1.225 #p
        @air_density_0 = 1.225 #p0
        @plane_weight = 3260000 #W
        @wing_surface = 511 #S
        @engine_power = 172600
        @engine_number = 4
        @taxi_coefficient = 0.02
        @sustentation_coefficient = 1.8
        @plane_power = @engine_power * @engine_number

    end

    def get_air_density()
        return @air_density
    end

    def get_air_density_0()
        return @air_density_0
    end

    def get_plane_weight()
        return @plane_weight
    end

    def get_engine_power()
        return @engine_power
    end

    def get_wing_surface()
        return @wing_surface
    end

    def get_engine_number()
        return @engine_number
    end

    def get_taxi_coefficient()
        return @taxi_coefficient
    end

    def get_sustentation_coefficient()
        return @sustentation_coefficient
    end

    def get_plane_power()
        return @plane_power
    end

end