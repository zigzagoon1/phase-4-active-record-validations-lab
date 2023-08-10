class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_title 

    def clickbait_title
        if title
            unless title.match?(/(Won't Believe)|(Secret)|(Guess)|(Top \d+)/)
                errors.add(:title, "Please make the title more catchy")
            end
        end
    end
end
