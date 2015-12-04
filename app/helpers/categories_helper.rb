module CategoriesHelper
  def parent_category_options
    Category.roots.collect { |c| [c.name, c.id] }
  end

  def sub_category_options(parent)
    parent.children.collect { |c| [c.name, c.id] }
  end

  def brand_options(category)
    category.brands.collect { |b| [b.name, b.id] }
  end
end
