class Quiz < ApplicationRecord
  enum wd: [ '4WD', '2WD' ]
  enum color: [:WHITE, :BLACK, :BLUE, :BROWN, :BURGUNDY, :GOLD, :GRAY, :GREEN, :RED, :SILVER, :TAN, :YELLOW]
  enum car_type: [:Automatic, :Manual]
end
