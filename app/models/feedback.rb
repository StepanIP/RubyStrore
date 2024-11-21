# app/models/feedback.rb
class Feedback < ApplicationRecord
  belongs_to :user
end