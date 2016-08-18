module ReviewsHelper  
  def nested_reviews(reviews)
    reviews.map do |review, sub_reviews|
      render(review) + content_tag(:div, nested_reviews(sub_reviews), :class => "nested_reviews")
    end.join.html_safe
  end
end
