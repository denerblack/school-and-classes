class Classroom
  include Mongoid::Document
  field :entry_at, type: Date
  embeds_one :student
  embeds_one :course

#  embedded_in :course,  inverse_of: :classrooms
#  embedded_in :student, inverse_of: :classrooms
end
