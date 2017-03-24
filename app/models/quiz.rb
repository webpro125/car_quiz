class Quiz < ApplicationRecord
  enum wd: [ '4WD', '2WD' ]
  enum color: [:WHITE, :BLACK, :RED, :BLUE, :GREEN, :ORANGE, :GRAY, :OTHER]
  enum car_type: [:Automatic, :manual]
end
