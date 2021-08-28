class Condition < ApplicationRecord

  enum status: { open: 0, warning: 1, close: 2 }

end
 
