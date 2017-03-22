class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to thankyou_path, notice: 'Feedback submitted successfully.'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:feedback_type, :content, :first_name, :last_name, :email)
  end
end
