class Contact < ApplicationRecord
    validates :username, :email,  presence: true
end
