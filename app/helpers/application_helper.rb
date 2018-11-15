module ApplicationHelper

  def short_url(key)
    request.base_url + '/' + key
  end

  def short_url_link(key)
    link_to short_url(key), short_url(key), target: '_blank'
  end
end
