# == Schema Information
# Schema version: 20110428024225
#
# Table name: surveys
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Survey < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :questions, :dependent => :destroy
end
