# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create :name => "Photoshop Actions"
Category.create :name => "Lightroom Presets"
Category.create :name => "Adobe Camera RAW Presets"

shop1 = Shop.create :name => "Do Looks"
shop2 = Shop.create :name => "Make Brant"

Product.create(:name => "The Matte Collection",
               :description => "The Matte Collection is a special Photoshop action set that includes not 1! not 2! not 8!! —  but 33 actions! PLUS 4 extra bonus actions.",
               :categories => [Category.find_by_slug("actions")],
               :shop => shop1)

Product.create(:name => "Magazine Looks",
               :description => "My individual actions are mostly priced at $4 — every action included in this bundle could be sold separately, making $88 the final price, I decided to group them and offer you an $88 value action set for only $19!!!! that's almost 80% OFF! — Best top quality High End Actions for the most professional results.",
               :categories => [Category.find_by_slug("actions")],:shop => shop1)

Product.create(:name => "Ash Action",
               :description => "Ash is a set of 2 Photoshop actions that give your images a retro/vintage ash/carbon Look, it has 2 variations for a vintage washed/fade/crushed result.",
               :categories => [Category.find_by_slug("actions")],:shop => shop1)

Product.create(:name => "Chocolate Action",
               :description => "Chocolate is a set of 8 Photoshop actions that give your images a retro/vintage Chocolate Look, it has 4 variations for a vintage washed/fade/crushed result.",
               :categories => [Category.find_by_slug("actions")],:shop => shop2)

Product.create(:name => "250+ Professional Lightroom Presets",
               :description => "This collection includes 10 different sets of Lightroom presets. In total you'll get more than 250 presets that would cost $128 if each of the 10 sets were purchased individually. For a limited time your can get them all for just $29! ",
               :categories => [Category.find_by_slug("lightroom_presets")],:shop => shop2)

Product.create(:name => "Film Lightroom Presets",
               :description => "This set includes 24 different Lightroom presets for easily giving your digital photos a film-like look. You'll get presets that will add a variety of different, subtle effects.",
               :categories => [Category.find_by_slug("lightroom_presets"),Category.find_by_slug("acr_presets")],:shop => shop1)

Product.create(:name => "HDR Lightroom Presets",
               :description => "Want to create an HDR-like look in Lightroom with just one exposure? This set of 40 Lightroom presets gives you instant access to a wide variety of awesome HDR-inspired effects. ",
               :categories => [Category.find_by_slug("lightroom_presets"),Category.find_by_slug("acr_presets")],:shop => shop2)

Product.create(:name => "Vintage Lightroom Presets",
               :description => "With this set you will get 30 Lightroom presets for applying vintage and retro effects to your photos easily. The set includes a variety of different types of vintage effects, giving you a large collection of effects at your disposal.",
               :categories => [Category.find_by_slug("lightroom_presets")],:shop => shop2)

Product.create(:name => "Light Leaks Lightroom Presets",
               :description => "This massive set includes 70 different presets for applying light leaks to your photos. The site gives you presets for light leaks in several different colors, combinations of colors, and from different angles and both sides of the photo.",
               :categories => [Category.find_by_slug("lightroom_presets")],:shop => shop1)