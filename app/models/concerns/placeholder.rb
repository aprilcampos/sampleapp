module Placeholder 
    extend ActiveSupport::Concern

    def self.image_generator(height:, width:)
        "https://pixy.org/ph/06139e/7a7a7a/frame/crosshairs/#{height}x#{width}.png"
    end
end