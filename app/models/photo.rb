class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :photo, presence: true, format: /[a-zA-Zа-яА-Я\-_0-9\/\:\.]*/i

  # Добавляем uploader, чтобы заработал carrierwave
  mount_uploader :photo, PhotoUploader

  # Scope нужен, чтобы отделить реальные фотки от болванки,
  # которую мы прописали в контроллере событий
  scope :persisted, -> { where "id IS NOT NULL" }
end
