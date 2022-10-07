class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular
    	where(subtitle: "Angular")
    end

		scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }

		after_initialize :set_defaults

		def set_defaults
			self.main_image ||= "https://pixy.org/ph/06139e/7a7a7a/frame/crosshairs/350x200.png"
			self.thumb_image ||= "https://tse4.mm.bing.net/th?id=OIP.4L0hr_SUbeH1q-I2KrFg0QAAAA&pid=Api&P=0"
		end

		
    
end
