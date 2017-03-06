require "administrate/base_dashboard"

class ContentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    comments: Field::HasMany,
    id: Field::Number,
    title: Field::Text,
    story: Field::Text,
    broadcast: Field::Text,
    youtube: Field::Text,
    theme: Field::Text,
    cast: Field::Text,
    url: Field::Text,
    content: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :comments,
    :id,
    :title,
    :story,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :comments,
    :id,
    :title,
    :story,
    :broadcast,
    :youtube,
    :theme,
    :cast,
    :url,
    :content,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :comments,
    :title,
    :story,
    :broadcast,
    :youtube,
    :theme,
    :cast,
    :url,
    :content,
  ].freeze

  # Overwrite this method to customize how contents are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(content)
  #   "Content ##{content.id}"
  # end
end
