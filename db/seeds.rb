230.times do |n|
  name  = Faker::Commerce.product_name
  price_pln = Faker::Commerce.price
  price_eur = Faker::Commerce.price
  price_gbp = Faker::Commerce.price
  description_pl = Faker::Commerce.department(5)
  description_en = Faker::Commerce.department(4)
  options = "S
M
XL
XXL"
  weight = Faker::Number.number(4)
  color = Faker::Commerce.color + "
" + Faker::Commerce.color + "
" +Faker::Commerce.color
  photos = Faker::Avatar.image("my-own-slug", "50x50", "jpg")
  category_id = Random.rand(3)

  Product.create!(name:  name,
               price_pln: price_pln,
               price_eur: price_eur,
               price_gbp: price_gbp,
               weight: weight,
               photos: photos,
               options: options,
               description_pl: description_pl,
               description_en: description_en,
               color: color,
               category_id: category_id)
end