# config/initializers/ransack.rb
#
# Custom ransack predicate to simplify query for date range
#
# See lib/ransack.rb in ransack gem
# See wiki https://github.com/activerecord-hackery/ransack/wiki/Custom-Predicates

Ransack.configure do |config|
  config.add_predicate 'end_of_day_lteq',
                       arel_predicate: 'lt',
                       formatter: proc { |v| v.to_date.end_of_day },
                       validator: proc { |v| v.present? },
                       type: :string
end