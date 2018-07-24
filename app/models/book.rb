class Book < ApplicationRecord

 belongs_to :user

 validates_presence_of :title
 validates_presence_of :opinion
 validates :opinion, length: {maximum:200}

end
