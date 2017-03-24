class Admins::DashboardsController < ApplicationController
  before_action :authenticate_admin!
  include ActionView::Helpers::NumberHelper

  def index
    @q = Quiz.search(params[:q])
    # @cars = policy_scope(@q.result).page(params[:page]).per(20)
    @quizzes = @q.result
    puts 'car count +++++++++++: ' + @quizzes.count.to_s

    if params[:q].present? && params[:q][:created_at_gteq].present?
      @created_at_from = (Date.parse params[:q][:created_at_gteq]).strftime("%d/%m/%Y")
    end

    if params[:q].present? && params[:q][:created_at_lteq].present?
      @created_at_to = (Date.parse params[:q][:created_at_lteq]).strftime("%d/%m/%Y")
    end

    @mileage_array = []
    [30000, 50000, 100000].each_with_index do |data, index|
      index_value = '&lt;' + number_with_delimiter(data, :delimiter => ',')
      @mileage_array[index] = [index_value, @quizzes.where("mileage < ? or mileage is ? ", data, nil).count]
    end
    @mileage_array[3] = ['+100,000', @quizzes.where('mileage >= ? or mileage is ?', 100000, nil).count]

    @wds = []
    ['2WD', '4WD'].each_with_index do |data, index|
      @wds[index] = [data, @quizzes.where(wd: data).or(@quizzes.where('wd is ?', nil)).count]
    end

    @seat_numbers = []
    @seat_numbers[0] = ['2', @quizzes.where(seat_number: 2).or(@quizzes.where('seat_number is ?', nil)).count]
    @seat_numbers[1] = ['4-5', @quizzes.where(seat_number: 4).or(@quizzes.where('seat_number is ?', nil)).count]
    @seat_numbers[2] = ['6+', @quizzes.where('seat_number >= ? or seat_number is ?', 6, nil).count]

    @years = []
    @years[0] = ['1980 - 1989', @quizzes.where('year >= 1980 and year <= 1989 or year is ?', nil).count]
    @years[1] = ['1990 - 1999', @quizzes.where('year >= 1990 and year <= 1999 or year is ?', nil).count]
    @years[2] = ['2000 - 2009', @quizzes.where('year >= 2000 and year <= 2009 or year is ?', nil).count]
    @years[3] = ['2010 - 2018', @quizzes.where('year >= 2010 and year <= 2018 or year is ?', nil).count]

    @vehicle_types = []
    ['Truck', 'Luxury', 'Sport', 'Family', 'SUV'].each_with_index do |data, index|
      @vehicle_types[index] = [data, @quizzes.where(vehicle_type: data).or(@quizzes.where('vehicle_type is ?', nil)).count]
    end

    @colors = []
    ['White', 'Black', 'Blue', 'Brown', 'Burgundy', 'Gold', 'Gray', 'Green', 'Red', 'Silver', 'Tan', 'Yellow'].each_with_index do |data, index|
      @colors[index] = [data, @quizzes.where(color: data.upcase).or(@quizzes.where('color is ?', nil)).count]
    end

    @ams = []
    ['Automatic', 'Manual'].each_with_index do |data, index|
      @ams[index] = [data, @quizzes.where(car_type: data).or(@quizzes.where('car_type is ?', nil)).count]
    end

    @feedbacks = Feedback.all
    @users = User.all

  end
end
