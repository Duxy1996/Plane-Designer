class PhisicResources

    def initialize()
        @air_density_0 = 1.225
        @air_density_5 = 1.165 
        @air_density_10 = 1.095 
        @air_density_15 = 1.035 
        @air_density_20 = 0.975
        @air_density_25 = 0.975
        @air_density_30 = 0.845 
        @air_density_35 = 0.775 
        @air_density_40 = 0.715 
        @air_density_45 = 0.655 
        @air_density_50 = 0.585 
        @taxi_coefficient = 0.02
        @sustentation_coefficient = 1.8
        @general_gravity = 9.8

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
    def get_general_gravity()
        return @general_gravity
    end
end