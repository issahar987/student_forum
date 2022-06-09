class User < ApplicationRecord
    has_many :ForumPost
    has_many :Comment
    has_many :RepairOffer
    has_many :Role

    def follows?(repair_offer)
        self.RepairOffer.include?(repair_offer)
    end

    has_secure_password
    has_secure_token

    validates :eMail, presence: true, uniqueness: true, length: { in: 3..50 }
    validates :login, presence: true, uniqueness: true, length: { in: 3..50 }
    validates :nickName, presence: true, uniqueness: true, length: { in: 3..50 }
    validates :password, presence: true, length: { minimum: 6 }

    def invalidate_token
        self.update_columns(token: nil)
    end
end

