class Course
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :status, type: Integer

#  embeds_many :classrooms
end
