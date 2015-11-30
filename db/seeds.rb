# # Import categories
categories_csv = File.join(Rails.root, 'db', 'csv', 'categories.csv')
parent = nil;
CSV.foreach(categories_csv) do |row|
  if row[3] == 'Y'
    parent = Category.create(name: row[0], slug: row[1], rank: row[2])
  else
    parent.children.create(name: row[0], slug: row[1], rank: row[2])
  end
end

# Import brands
brands_csv = File.join(Rails.root, 'db', 'csv', 'brands.csv')
CSV.foreach(brands_csv) do |row|
  Brand.create name: row[0], en_name: row[1], slug: row[2]
end


# Import brands_categories
brands_categories_csv = File.join(Rails.root, 'db', 'csv', 'brands_categories.csv')
results = SmarterCSV.process(brands_categories_csv)
results.each do |row|
  slug = row.delete('系统缩写'.to_sym)
  brand = Brand.find_by(slug: slug)

  row.each do |k, v|
    category = Category.find_by(name: k.upcase)
    BrandCategory.create(brand: brand, category: category)
  end
end

p '------------  Done!  ---------------'
