class Admins::DashboardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Quiz.search(params[:q])
    # @cars = policy_scope(@q.result).page(params[:page]).per(20)
    @cars = @q.result
    puts 'car count +++++++++++: ' + @cars.count.to_s
  end
end
