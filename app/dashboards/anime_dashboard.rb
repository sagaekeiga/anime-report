require "administrate/base_dashboard"

class AnimeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::Text,
    youtube: Field::Text,
    fc2: Field::Text,
    ani: Field::Text,
    hima: Field::Text,
    gogo: Field::Text,
    nova: Field::Text,
    gooda: Field::Text,
    kiss: Field::Text,
    myvi: Field::Text,
    b9: Field::Text,
    daily: Field::Text,
    miomio: Field::Text,
    smove: Field::Text,
    date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :youtube,
    :fc2,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :youtube,
    :fc2,
    :ani,
    :hima,
    :gogo,
    :nova,
    :gooda,
    :kiss,
    :myvi,
    :b9,
    :daily,
    :miomio,
    :smove,
    :date,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :youtube,
    :fc2,
    :ani,
    :hima,
    :gogo,
    :nova,
    :gooda,
    :kiss,
    :myvi,
    :b9,
    :daily,
    :miomio,
    :smove,
    :date,
  ].freeze

  # Overwrite this method to customize how animes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(anime)
  #   "Anime ##{anime.id}"
  # end
end
