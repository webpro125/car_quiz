class CarsController < ApplicationController
  before_action :authenticate_user!

  def search
    @q = Car.search(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    # @cars = policy_scope(@q.result).page(params[:page]).per(20)
  end

  def index
    @q = Car.search(params[:q])
    # @cars = policy_scope(@q.result).page(params[:page]).per(20)
    @cars = @q.result
    puts 'car count +++++++++++: ' + @cars.count.to_s
  end
end
