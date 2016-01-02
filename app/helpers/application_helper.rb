module ApplicationHelper

  def topics_filter(options)
    params.slice(:order, :category, :keyword).merge(options)
  end

end
