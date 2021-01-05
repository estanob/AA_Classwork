require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  Cat_colors = [
    'orange', 'white', 'grey', 'black', 
    'mixed-color', 'light-brown', 'brown'
  ]

  Sex = ["M", "F"]

  validates :color, inclusion: Cat_colors
  validates :sex, inclusion: Sex
  validates :birth_date, :color, :name, :sex, presence: true
  
  def age
    birthday = self.birth_date
    return ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end
end
