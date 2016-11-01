class Lingualism < ActiveRecord::Base
  belongs_to :user

  belongs_to :character
  belongs_to :spoken_language, class_name: 'Language'
end