class PagesController < ApplicationController
  def home
    @top_restaurants = Restaurant.joins(:items)
      .group('restaurants.id')
      .order('COUNT(items.id) DESC')
      .limit(3)
  end
end
