class Movie < ActiveRecord::Base
  ALL_RATINGS = %w[G PG PG-13 R NC-17].freeze

  def self.all_ratings
    ALL_RATINGS
  end

  def self.with_ratings(ratings_list)
    return all if ratings_list.blank?
    where('upper(rating) IN (?)', ratings_list.map(&:upcase))
  end
end
