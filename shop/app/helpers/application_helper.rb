module ApplicationHelper
    def seller?(user)
        user.account_type.to_s=="seller"
    end
end
