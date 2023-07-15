class Calender < ApplicationRecord
  scope :enable, ->{ where("day >= ?", Date.today) }
end
