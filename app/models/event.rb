class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  # Чтобы Рельсы понимали, какой именно класс будет лежать
  # в модели subscribers, надо указать source
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos

  # Валидируем юзера на присутствие.
  # валидируются по умолчанию
  validates :user, presence: true
  # Валидируем заголовок, он не может быть длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}
  # У события должны быть заполнены место и время
  validates :address, presence: true
  validates :datetime, presence: true

  before_validation :check_event_host

  def visitors
    (subscribers + [user]).uniq
  end

   def check_event_host
    if user == event.user
      errors.add(:user, message: I18n.t('models.subscription.errors.event_host'))
    end
  end
end
