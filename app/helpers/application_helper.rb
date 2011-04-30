module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Survey Builder"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("survey_blue.jpg",:height => "200",
      :alt => "Survey Builder", :class => "round")
  end
end
