class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_must_be_click_bait?
  CLICKBAIT_PATTERNS =[
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]
  def title_must_be_click_bait?
    if CLICKBAIT_PATTERNS.none? {|pat| pat.match title}
    errors.add(:title, "must be clickbait")
  
    end
  end
end
