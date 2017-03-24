class Admins::DashboardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Quiz.search(params[:q])
    # @cars = policy_scope(@q.result).page(params[:page]).per(20)
    @quizzes = @q.result
    puts 'car count +++++++++++: ' + @quizzes.count.to_s
  end
end
