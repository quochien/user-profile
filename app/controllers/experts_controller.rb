class ExpertsController < ApplicationController
  def index
    @experts = User.where.not(expert_name: nil)
  end

  def show
    @expert = User.find_by_id(params[:id])
    calculate_ratings

    if params[:filter] == "written"
      @reviews = @expert.reviews.where.not(comments: [nil, ""])
    else
      @reviews = @expert.reviews
    end
  end

  private

  def calculate_ratings
    ratings = @expert.reviews.group(:rating).count
    total_reviews = ratings.values.sum

    @rating_counts = {}
    (1..5).each do |star|
      @rating_counts[star] = {}
      @rating_counts[star][:star] = ratings[star.to_f].to_i
      if total_reviews == 0
        @rating_counts[star][:percent] = 0
      else
        @rating_counts[star][:percent] = (ratings[star.to_f].to_f * 100 / total_reviews).round
      end
    end
  end
end
