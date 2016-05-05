class Toybot < ActiveRecord::Base
    attr_accessor :pos_x, :pos_y, :face
    
    def placement x, y, face
        @pos_x = x
        @pos_y = y
        @face = face
    end
    
    def fallen?
        self.pos_x >= 5 || self.pos_x < 0 || self.pos_y >= 5 || self.pos_y < 0
    end
    
    def facing face
        false unless ["NORTH", "EAST", "SOUTH", "WEST"].include? face
        @face = face
    end
    
    def right
        case @face
        when "NORTH"
            @face = "EAST"
        when "EAST"
            @face = "SOUTH"
        when "SOUTH"
            @face = "WEST"
        when "WEST"
            @face = "NORTH"
        else
            false
        end
    end
    
    def left
        case @face
        when "NORTH"
            @face = "WEST"
        when "WEST"
            @face = "SOUTH"
        when "SOUTH"
            @face = "EAST"
        when "EAST"
            @face = "NORTH"
        else
            false
        end
    end
    
    def move
        case @face
        when "NORTH"
            @pos_y += 1
        when "WEST"
            @pos_x -= 1
        when "SOUTH"
            @pos_y -= 1
        when "WEST"
            @face = "NORTH"
        else
            false
        end
    end
end
