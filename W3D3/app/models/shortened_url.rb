require "securerandom"

class ShortenedURL < ApplicationRecord
  include SecureRandom

  validates :short_url, uniqueness: true
  validates :short_url, length: { minimum: 3}

  # attr_accessor :short_url
  # attr_accessor :long_url
#
# def short_url=(url)
#   @short_url = url
# end

  def self.random_code
    while true
      new_url = SecureRandom::urlsafe_base64(7)
      return new_url unless ShortenedURL.exists?(short_url: new_url)
    end
  end

  def self.generate(user, l_url)
    ShortenedURL.create!(short_url: ShortenedURL.random_code, long_url: l_url, user_id: user.id)
  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    foreign_key: :shortened_url_id,
    primary_key: :id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select('user_id').distinct.count
  end

  def num_recent_uniques
    visits.select('user_id').where('created at > ?', 10.minutes.ago).distinct.count
  end



end
