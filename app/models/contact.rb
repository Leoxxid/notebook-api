class Contact < ApplicationRecord
  validates_presence_of :kind
  # validates_presence_of :address

  paginates_per 5

  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def birthdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end
  # def author
  #   "Jackson"
  # end
  #
  # def kind_description
  #   kind.description
  # end
  #
  # def as_json(options = {})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author],
  #   )
  # end
  # def hello
  #   I18n.t('hello')
  # end
end
