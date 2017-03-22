class Feedback < ApplicationRecord
  enum feedback_type: [ :comments, :bug_reports, :questions ]

  validates :feedback_type, :content, presence: true
  validates :first_name, length: { in: 2..24 }, presence: true,
            format: { with: RegexConstants::Letters::AND_NUMBERS,
                      message: 'Special letters are not allowed to input' }
  validates :last_name, length: { in: 2..24 }, presence: true,
            format: { with: RegexConstants::Words::AND_SPECIAL,
                      message: 'Special letters are not allowed to input' }
  validates :email, format: {with: RegexConstants::EMAIL, message: 'is invalid'}

end

