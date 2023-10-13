class Note < ApplicationRecord
  
  belongs_to :subject
   def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "subject_id", "title", "updated_at"]
  end
end
