class Student
  include Mongoid::Document
  field :name, type: String
  field :register_number, type: String
  field :status, type: Integer

#  embeds_many :classrooms
end
