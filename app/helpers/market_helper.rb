module MarketHelper
  def li_category_roots
    Category.roots.map do |category|
       content_tag :li do
         link_to category.name, [root_url,"c",category.slug].join("/")
       end
    end.join.html_safe
  end
end
