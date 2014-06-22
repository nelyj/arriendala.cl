class UsersPlan < ActiveRecord::Base
  attr_accessible :activo, :end_date, :plan_id, :start_date, :user_id
end
