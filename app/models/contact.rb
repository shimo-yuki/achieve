class Contact < ApplicationRecord
    validates :username, :email, :category, :content,  presence: true
end
