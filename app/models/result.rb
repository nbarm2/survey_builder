# == Schema Information
# Schema version: 20110429001548
#
# Table name: results
#
#  id          :integer         not null, primary key
#  score       :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Result < ActiveRecord::Base
  attr_accessible :score, :question_id
  
  belongs_to :question
  
  validates :score, :presence => true
  validates :question_id, :presence => true
end
