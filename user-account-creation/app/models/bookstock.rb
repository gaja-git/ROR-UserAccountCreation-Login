class Bookstock < ApplicationRecord 

    validates :bookname, :bookauthor, presence: true

end