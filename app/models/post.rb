class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :title_not_clickbait

    private
  
    def title_not_clickbait
        clickbait_phrases = ["clickbait", "sensational"]
        forbidden_title = "True Facts"
      
        if title.present? && clickbait_phrases.any? { |phrase| title.downcase.include?(phrase) }
          errors.add(:title, "is clickbait")
        elsif title == forbidden_title
          errors.add(:title, "is not allowed")
        end
    end
end
