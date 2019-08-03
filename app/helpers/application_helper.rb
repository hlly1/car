module ApplicationHelper

  # According to the page, return the correct title
  def full_title(page_title = '')
    base_title = "Car Sharing"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  


end
