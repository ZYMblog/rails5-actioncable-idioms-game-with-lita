class Chat < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :users, through: :messages
    validates :title, presence: true, uniqueness: true, case_sensitive: false
end
