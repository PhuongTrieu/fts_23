class Course < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :examinations, dependent: :destroy

  accepts_nested_attributes_for :questions,
                                reject_if: lambda {|a| a[:content].blank?},
                                allow_destroy: true
  validates :name, presence: true
end
