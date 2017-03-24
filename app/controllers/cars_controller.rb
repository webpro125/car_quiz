class CarsController < ApplicationController
  before_action :authenticate_user!

  def search
    @q = Car.search(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    # @cars = policy_scope(@q.result).page(params[:page]).per(20)
  end

  def index
    if params[:q][:year].present?
      params[:p].delete(:year)
    end

    @q = Car.search(params[:q])
    # result = session[:search_params] && params[:q]
    unless session[:search_params].to_a == params[:q].to_a
      create_quiz params[:q]
      session[:search_params] = params[:q]
    end
    # @cars = policy_scope(@q.result).page(params[:page]).per(20)
    @cars = @q.result.page(params[:page]).per(5)
    puts 'car count +++++++++++: ' + @cars.count.to_s

  end

  private

  def create_quiz params
    quiz = Quiz.new
    if params.has_key?(:mileage_lt)
      quiz.mileage = params[:mileage_lt]
    end
    if params.has_key?(:mileage_gteq)
      quiz.mileage = params[:mileage_gteq]
    end

    if params.has_key?(:vehicle_type_eq)
      quiz.vehicle_type = params[:vehicle_type_eq]
    end

    if params.has_key?(:seat_number_eq)
      quiz.seat_number = params[:seat_number_eq]
    end
    if params.has_key?(:seat_number_gteq)
      quiz.seat_number = params[:seat_number_gteq]
    end

    if params.has_key?(:wd_eq)
      quiz.wd = params[:wd_eq]
    end

    if params.has_key?(:year_eq)
      quiz.year = params[:year_eq]
    end

    if params.has_key?(:color_eq)
      quiz.color = params[:color_eq]
    end

    if params.has_key?(:car_type_eq)
      quiz.car_type = params[:car_type_eq]
    end

    quiz.save!
  end
end
