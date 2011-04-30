# == Schema Information
# Schema version: 20110427223206
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  type_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :type_id
end
