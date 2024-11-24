module ApplicationHelper
  def bootstrap_paginate(collection, options = {})
    options[:renderer] ||= BootstrapPaginationHelper
    options[:class] ||= 'pagination justify-content-center'
    will_paginate(collection, options)
  end
end

class BootstrapPaginationHelper < WillPaginate::ActionView::LinkRenderer
  def container_attributes
    { class: 'pagination justify-content-center' }
  end

  def page_number(page)
    if page == current_page
      tag(:li, link(page, '#'), class: 'page-item active')
    else
      tag(:li, link(page, page, rel: rel_value(page)), class: 'page-item')
    end
  end

  def previous_or_next_page(page, text, classname)
    if page
      tag(:li, link(text, page), class: "#{classname} page-item")
    else
      tag(:li, link(text, '#'), class: "#{classname} page-item disabled")
    end
  end

  def gap
    tag(:li, link('...', '#'), class: 'page-item disabled')
  end
end
