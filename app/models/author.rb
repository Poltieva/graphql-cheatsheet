class Author < ApplicationRecord
  validates_presence_of :last_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def coordinates
    [rand(100), rand(100)]
  end

  def pub_years
    [1333, 1998, 2001]
  end
end
