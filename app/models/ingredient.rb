class Ingredient < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :doses, dependent: :destroy
  before_destroy :check_ingredient

  private

  def check_ingredient
    if doses.any?
      errors[:base] << "Cannot delete ingredient"
      false
    end
  end
end



