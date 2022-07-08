ActiveRecord::Base.establish_connection
class Contribution < ActiveRecord::Base
    validates :body,
        length: {maximum: 30, too_long: "最大30文字まで使用できます。"}
end
