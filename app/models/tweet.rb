class Tweet < ActiveRecord::Base
    validates :message, presence: true
    validates :message, length: { maximum: 140 }
end
