# == Schema Information
# Schema version: 20110428053629
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  survey_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :survey
  has_many :results, :dependent => :destroy
  
  validates :content, :presence => true
  validates :survey_id, :presence => true
  
end
