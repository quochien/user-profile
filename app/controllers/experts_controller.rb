class ExpertsController < ApplicationController
  def index
    @experts = User.where.not(expert_name: nil)
  end

  def show
    @expert = User.find_by_id(params[:id])
  end
end
