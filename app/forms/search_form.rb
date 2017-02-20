class SearchForm
  include ActiveModel::Model
  attr_accessor  :title, :url, :page_id, :date
  
  ##部分一致させる
  def contains(arel_attribute, value)
    arel_attribute.matches("%#{escape_like(value)}%")
  end
  
  def bot_search(str)
    Bot.where("title like '%" + str + "%'  OR url like '%" + str + "%'  OR page_id like '%" + str + "%'  OR date like '%" + str + "%'") if title.present?
  end
  
end