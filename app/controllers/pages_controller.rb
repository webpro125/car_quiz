class PagesController < ApplicationController
  before_action :authenticate_user!

  def import_car
    Car.import(params[:csv_file])
  end
end
