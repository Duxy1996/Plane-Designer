class PhisicResources

    def initialize()
        @air_density_0 = 1.225         
        @taxi_coefficient = 0.02
        @sustentation_coefficient = 1.8

    end    

    def get_air_density_0()
        return @air_density_0
    end

    def get_taxi_coefficient()
        return @taxi_coefficient
    end

    def get_sustentation_coefficient()
        return @sustentation_coefficient
    end

end