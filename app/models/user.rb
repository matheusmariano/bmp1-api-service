require 'date'

class User < ActiveRecord::Base
  enum sex: [:undefined, :female, :male]

  validates :name, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :sex, inclusion: { in: %w(undefined female male) }
end
