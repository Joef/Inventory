# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Vendor.destroy_all
Vendor.create!(name:'Badger Wholesale')
Vendor.create!(name:'Empire Fish')
Vendor.create!(name:'Sysco')

Category.destroy_all
Ingredient.destroy_all
refrigerated      = Category.create( name: 'Refrigerated')

#refrigerated > dairy
dairy             = refrigerated.children.build(name:'Dairy'  )  
                    dairy.ingredients.build(name: 'Butter'    )  
                    dairy.ingredients.build(name: 'Butter, Unsalted'    )
                    cheese  = dairy.ingredients.build(name: 'Cheese'    ) 
                              cheese.ingredients.build(name: 'Cheese, Cheddar')
                              cheese.ingredients.build(name: 'Cheese, Parmesan')
                              cheese.ingredients.build(name: 'Cheese, Goat')
                              cheese.ingredients.build(name: 'Cheese, Blue')
                              cheese.ingredients.build(name: 'Cheese, Blue Crumbles')
                              cheese.ingredients.build(name: 'Cheese, Cream')
                    dairy.ingredients.build(name: 'Creamer, Half & Half')
                    dairy.ingredients.build(name: 'Cream, Sour')
                    dairy.ingredients.build(name: 'Cream, Heavy') 
                    dairy.ingredients.build(name: 'Cream, Heavy Whipping')
                    dairy.ingredients.build(name: 'Milk, Whole (Vitamin D)')
                    dairy.ingredients.build(name: 'Milk, 2%')
                    dairy.ingredients.build(name: 'Milk, Skim')
                    dairy.ingredients.build(name: 'Milk, Chocolate')
                    dairy.ingredients.build(name: 'Buttermilk')
                    dairy.ingredients.build(name: 'Egg, Large')
                    dairy.ingredients.build(name: 'Egg, Extra-Large')

#refrigerated > produce
produce           = refrigerated.children.build(name:'Produce')
  herb            = produce.children.build(name:'Herb')
                    herb.ingredients.build(name: 'Parsley, Fresh')
                    herb.ingredients.build(name: 'Rosemary, Fresh')
                    herb.ingredients.build(name: 'Sage, Fresh')
                    herb.ingredients.build(name: 'Thyme, Fresh')
                    herb.ingredients.build(name: 'Cilantro, Fresh')
                    herb.ingredients.build(name: 'Mint, Fresh')
                    herb.ingredients.build(name: 'Anise, Fresh')
                    herb.ingredients.build(name: 'Basil, Fresh')
                    herb.ingredients.build(name: 'Dill Weed, Fresh')
                    herb.ingredients.build(name: 'Lemongrass, Fresh')
  fruit           = produce.children.build(name:'Fruit')
                    fruit.ingredients.build(name: 'Avocado')
                    fruit.ingredients.build(name: 'Cucumber')
                    fruit.ingredients.build(name: 'Cucumber, Seedless')
                    fruit.ingredients.build(name: 'Okra')
                    fruit.ingredients.build(name: 'Pepper')
                    fruit.ingredients.build(name: 'Pepper, Bell, Red')
                    fruit.ingredients.build(name: 'Pepper, Bell, Yellow')
                    fruit.ingredients.build(name: 'Pepper, Bell, Orange')
                    fruit.ingredients.build(name: 'Pepper, Bell, Green')
                    fruit.ingredients.build(name: 'Pepper, Jalepeno')
                    fruit.ingredients.build(name: 'Pepper, Banana')
                    fruit.ingredients.build(name: 'Pumpkin')
                    fruit.ingredients.build(name: 'Snap Beans')
                    fruit.ingredients.build(name: 'Beans, Green')
                    fruit.ingredients.build(name: 'Squash')
                    fruit.ingredients.build(name: 'Zuchinni')
                    fruit.ingredients.build(name: 'Eggplant')
                    fruit.ingredients.build(name: 'Eggplant: Thai')
                    tomato  = fruit.ingredients.build(name: 'Tomato')
                              fruit.ingredients.build(name: 'Tomato, Cherry')
                              fruit.ingredients.build(name: 'Tomato, Grape')
                              fruit.ingredients.build(name: 'Tomato, Green')
                              fruit.ingredients.build(name: 'Tomato, Heirloom')
                              fruit.ingredients.build(name: 'Tomato, Beefsteak')
                    fruit.ingredients.build(name: 'Strawberry')
                    fruit.ingredients.build(name: 'Raspberry')
                    fruit.ingredients.build(name: 'Blueberry')
                    fruit.ingredients.build(name: 'Blackberry')
                    fruit.ingredients.build(name: 'Cherry')
                    fruit.ingredients.build(name: 'Banana')
                    fruit.ingredients.build(name: 'Orange')
                    fruit.ingredients.build(name: 'Apple')
                    fruit.ingredients.build(name: 'Apple, Grannysmith')
                    fruit.ingredients.build(name: 'Lime')
                    fruit.ingredients.build(name: 'Lemon')
                    fruit.ingredients.build(name: 'Grapefruit')
                    fruit.ingredients.build(name: 'Grapefruit, Ruby Red')
    juice         = fruit.children.build(name: 'Juice')
                    juice.ingredients.build(name: 'Juice, Fresh, Lime')
                    juice.ingredients.build(name: 'Juice, Fresh, Lemon')
                    juice.ingredients.build(name: 'Juice, Fresh, Apple')
                    juice.ingredients.build(name: 'Juice, Fresh, Grapefruit')
                    juice.ingredients.build(name: 'Juice, Fresh, Orange')
                    juice.ingredients.build(name: 'Juice, Fresh, Cherry')
                    juice.ingredients.build(name: 'Juice, Fresh, Pineapple')

  vegetable       = produce.children.build(name:'Vegetable')
                    vegetable.ingredients.build(name: 'Brocolli')
                    vegetable.ingredients.build(name: 'Cauliflower')
                    
    roots_tubers  = vegetable.children.build(name:'Roots and Tubers')
                    beet    = roots_tubers.ingredients.build(name: 'Beet')
                              roots_tubers.ingredients.build(name: 'Beet, Red')
                              roots_tubers.ingredients.build(name: 'Beet, Baby Red')
                              roots_tubers.ingredients.build(name: 'Beet, Golden')
                    roots_tubers.ingredients.build(name: 'Carrot')
                    roots_tubers.ingredients.build(name: 'Radish')
                    roots_tubers.ingredients.build(name: 'Rutabaga')
                    
                    roots_tubers.ingredients.build(name: 'Turnip')
                    roots_tubers.ingredients.build(name: 'Yam')
                    roots_tubers.ingredients.build(name: 'Ginger Root')
                    potato  = roots_tubers.ingredients.build(name: 'Potato')
                              roots_tubers.ingredients.build(name: 'Potato, Red')
                              roots_tubers.ingredients.build(name: 'Potato, Fingerling')
                              roots_tubers.ingredients.build(name: 'Potato, Sweet')
                              roots_tubers.ingredients.build(name: 'Potato, Baking')
                    roots_tubers.ingredients.build(name: 'Sunchoke')
                    roots_tubers.ingredients.build(name: 'Jicama')
                    roots_tubers.ingredients.build(name: 'Parsnip')
                    roots_tubers.ingredients.build(name: 'Horseradish Root')
         
    stem          = vegetable.children.build(name:'Stem')
                    stem.ingredients.build(name: 'Asparagus')
                    stem.ingredients.build(name: 'Kohlarabi')
                    stem.ingredients.build(name: 'Celery')
                    stem.ingredients.build(name: 'Fennel')
    leaf          = vegetable.children.build(name:'Leaf and Leaf-Stalk')
                    leaf.ingredients.build(name: 'Arugula')
                    leaf.ingredients.build(name: 'Brussels Sprouts')
                    leaf.ingredients.build(name: 'Cabbage')
                    leaf.ingredients.build(name: 'Chard')
                    leaf.ingredients.build(name: 'Chicory')
                    leaf.ingredients.build(name: 'Endive')
                    leaf.ingredients.build(name: 'Lettuce')
                    leaf.ingredients.build(name: 'Lettuce, Bib')
                    leaf.ingredients.build(name: 'Spring Mix')
                    leaf.ingredients.build(name: 'Rhubarb')
                    leaf.ingredients.build(name: 'Spinach')
                    leaf.ingredients.build(name: 'Spinach, Baby')
                    leaf.ingredients.build(name: 'Bok Choi')
                    leaf.ingredients.build(name: 'Collards')
                    leaf.ingredients.build(name: 'Escarole')
                    leaf.ingredients.build(name: 'Kale')
                    leaf.ingredients.build(name: 'Mustard Greens')
                    leaf.ingredients.build(name: 'Romaine')
                    leaf.ingredients.build(name: 'Watercress')
    bulb          = vegetable.children.build(name:'Bulb')
                    bulb.ingredients.build(name: 'Garlic')
                    bulb.ingredients.build(name: 'Leek')
                    bulb.ingredients.build(name: 'Onion')
                    bulb.ingredients.build(name: 'Onion, Yellow')
                    bulb.ingredients.build(name: 'Onion, Red')
                    bulb.ingredients.build(name: 'Chives')
                    bulb.ingredients.build(name: 'Shallot')
                    bulb.ingredients.build(name: 'Ramp')
    legume        = vegetable.children.build(name:'Legume')
                    legume.ingredients.build(name: 'Beans')
                    legume.ingredients.build(name: 'Corn')
                    legume.ingredients.build(name: 'Lentils')
                    legume.ingredients.build(name: 'Lentils, Brown')
                    legume.ingredients.build(name: 'Lentils, Green')
                    legume.ingredients.build(name: 'Lentils, Red')
                    legume.ingredients.build(name: 'Lentils, Black')
                    legume.ingredients.build(name: 'Peas')
                    
    fungi         = refrigerated.children.build(name:'Fungi')
                    fungi.ingredients.build(name: 'Mushroom, White')
                    fungi.ingredients.build(name: 'Mushroom, Chanterelle')
                    fungi.ingredients.build(name: 'Mushroom, Oyster')
                    fungi.ingredients.build(name: 'Mushroom, Portabello')
                    fungi.ingredients.build(name: 'Mushroom, Shiitake')
                    fungi.ingredients.build(name: 'Mushroom, Cremini')
                    fungi.ingredients.build(name: 'Mushroom, Morel')
                    fungi.ingredients.build(name: 'Mushroom, Hen-of-the-woods')
                    fungi.ingredients.build(name: 'Mushroom, Wild')

  meat            = refrigerated.children.build(name:'Meat')
    beef          = meat.children.build(name:'Beef')
                    beef.ingredients.build(name:'Beef: Whole Cow')
                    beef.ingredients.build(name:'Beef: Bone')
                    beef.ingredients.build(name:'Beef: Demi Glaze (Veal)')
                    chuck       = beef.ingredients.build(name:'Beef: Chuck')
                    rib         = beef.ingredients.build(name:'Beef: Rib')
                                  beef.ingredients.build(name:'Beef: Rib Roast, Large End')
                                  beef.ingredients.build(name:'Beef: Rib Roast, Small End')
                                  beef.ingredients.build(name:'Beef: Rib Steak, Small End')
                                  beef.ingredients.build(name:'Beef: Rib Eye Steak')
                                  beef.ingredients.build(name:'Beef: Rib Eye Roast')
                                  beef.ingredients.build(name:'Beef: Back Ribs')
                    short_loin  = beef.ingredients.build(name:'Beef: Short Loin')
                                  beef.ingredients.build(name:'Beef: Top Loin Steak')
                                  beef.ingredients.build(name:'Beef: T-Bone Steak')
                                  beef.ingredients.build(name:'Beef: Porterhouse Steak')
                                  beef.ingredients.build(name:'Beef: Tenderloin Roast/Steak')
                    sirloin     = beef.ingredients.build(name:'Beef: Sirloin')
                                  beef.ingredients.build(name:'Beef: Top Sirloin Steak')
                                  beef.ingredients.build(name:'Beef: Sirloin Steak')
                                  beef.ingredients.build(name:'Beef: Tenderloing Roast/Steak')
                                  beef.ingredients.build(name:'Beef: Tri-Tip')
                    round       = beef.ingredients.build(name:'Beef: Round')
                                  beef.ingredients.build(name:'Beef: Round Steak')
                                  beef.ingredients.build(name:'Beef: Top Round Roast')
                                  beef.ingredients.build(name:'Beef: Top Round Steak')
                                  beef.ingredients.build(name:'Beef: Bottom Round Roast')
                                  beef.ingredients.build(name:'Beef: Tip Roast Cap Off')
                                  beef.ingredients.build(name:'Beef: Eye Round Roast')
                                  beef.ingredients.build(name:'Beef: Tip Steak')
                                  beef.ingredients.build(name:'Beef: Boneless Rump Roast')
                    flank       = beef.ingredients.build(name:'Beef: Flank')
                                  beef.ingredients.build(name:'Beef: Flank Steak')
                                  beef.ingredients.build(name:'Beef: Flank Steak Rolls')
                    plate       = beef.ingredients.build(name:'Beef: Plate')
                                  beef.ingredients.build(name:'Beef: Skirt Steak')
                    shank       = beef.ingredients.build(name:'Beef: Shank')
                    brisket     = beef.ingredients.build(name:'Beef: Brisket')
                                  beef.ingredients.build(name:'Beef: Whole Brisket')
                                  beef.ingredients.build(name:'Beef: Brisket, Point Half')
                                  beef.ingredients.build(name:'Beef: Brisket, Flat Half')
    pork          = meat.children.build(name:'Pork')
                    pork.ingredients.build(name:'Pork: Whole Pig')
                    pork.ingredients.build(name:'Pork: Jowl')
                    pork.ingredients.build(name:'Pork: Bacon Square')
                    pork.ingredients.build(name:'Pork: Smoked Cottage Roll')
                    pork.ingredients.build(name:'Pork: Butt')
                    pork.ingredients.build(name:'Pork: Boston Style Butt')
                    pork.ingredients.build(name:'Pork: Blade Steak')
                    pork.ingredients.build(name:'Pork: Lard')
                    pork.ingredients.build(name:'Pork: Loin Roast')
                    pork.ingredients.build(name:'Pork: Chop')
                    pork.ingredients.build(name:'Pork: Sirloin Roast')
                    pork.ingredients.build(name:'Pork: Tenderloin')
                    pork.ingredients.build(name:'Pork: Ham')
                    pork.ingredients.build(name:'Pork: Half Ham')
                    pork.ingredients.build(name:'Pork: Ham Slice')
                    pork.ingredients.build(name:'Pork: Fresh Ham Roast')
                    pork.ingredients.build(name:'Pork: Bacon')
                    pork.ingredients.build(name:'Pork: Spareribs')
                    pork.ingredients.build(name:'Pork: Fresh Picnic Shoulder')
                    pork.ingredients.build(name:'Pork: Arm Steak')
                    pork.ingredients.build(name:'Pork: Fresh Shoulder Hock')
    poultry       = meat.children.build(name:'Poultry')  
                    chicken     = poultry.ingredients.build(name:'Whole Chicken')
                                  poultry.ingredients.build(name:'Chicken: Whole Leg')
                                  poultry.ingredients.build(name:'Chicken: Leg Quarter')
                                  poultry.ingredients.build(name:'Chicken: Drumstick')
                                  poultry.ingredients.build(name:'Chicken: Breast, Skin-on, Bone-in')
                                  poultry.ingredients.build(name:'Chicken: Breast, Skin-less, Fillet')
                                  poultry.ingredients.build(name:'Chicken: 3-Joint Wing')
                                  poultry.ingredients.build(name:'Chicken: Wing Tip')
                                  poultry.ingredients.build(name:'Chicken: Mid-Joint Wing')
                                  poultry.ingredients.build(name:'Chicken: Forequarter')
                                  poultry.ingredients.build(name:'Chicken: Thigh')
                                  poultry.ingredients.build(name:'Chicken: Giblets')
                                  poultry.ingredients.build(name:'Chicken: Neck')
                                  poultry.ingredients.build(name:'Chicken: Gizzard')
                                  poultry.ingredients.build(name:'Chicken: Kidney')
                                  poultry.ingredients.build(name:'Chicken: Livers')
                                  poultry.ingredients.build(name:'Chicken: Heart')
                                  poultry.ingredients.build(name:'Chicken: Demi Glaze')
                    turkey      = poultry.ingredients.build(name:'Whole Turkey')
                                  poultry.ingredients.build(name:'Turkey: Giblets')
                                  poultry.ingredients.build(name:'Turkey: Legs')
                    duck        = poultry.ingredients.build(name:'Whole Duck')
  seafood      = refrigerated.children.build(name:'Seafood')             
                      seafood.ingredients.build(name:'Lobster, Whole')
                      seafood.ingredients.build(name:'Lobster, Tail')
                      seafood.ingredients.build(name:'Shrimp, Jumbo')
                      
                      seafood.ingredients.build(name:'Mussel, Fresh')
                      seafood.ingredients.build(name:'Scallops U-12, Fresh')
                      seafood.ingredients.build(name:'Crab, Fresh, Opilio')
                      seafood.ingredients.build(name:'Crab, Fresh, King')
                      seafood.ingredients.build(name:'Crab, Fresh, Dungeness')
                      seafood.ingredients.build(name:'Crab, Fresh, Soft Shell') 
                      
    oyster         = seafood.children.build(name:'Oyster') 
                      oyster.ingredients.build(name:'Oyster')
                      oyster.ingredients.build(name:'Oyster: Blue Point')
                      
                      oyster.ingredients.build(name:'Oyster: Cape Spear')
                      oyster.ingredients.build(name:'Oyster: Caraquet')
                      oyster.ingredients.build(name:'Oyster: Cold Creek')
                      oyster.ingredients.build(name:'Oyster: Conway')
                      oyster.ingredients.build(name:'Oyster: Connecticut')
                      oyster.ingredients.build(name:'Oyster: Deer Creek')
                      
                      oyster.ingredients.build(name:'Oyster: East Beach Blonde')
                      oyster.ingredients.build(name:'Oyster: Gigamoto')
                      oyster.ingredients.build(name:'Oyster: Glacier Point')
                      oyster.ingredients.build(name:'Oyster: Katama Bay')
                      oyster.ingredients.build(name:'Oyster: Kumamoto')
                      oyster.ingredients.build(name:'Oyster: Little Island')
                      oyster.ingredients.build(name:'Oyster: Malpeque')
                      oyster.ingredients.build(name:'Oyster: Malspina')
                      oyster.ingredients.build(name:'Oyster: Matunuck')
                      oyster.ingredients.build(name:'Oyster: Mayflower')
                      oyster.ingredients.build(name:'Oyster: Mirada')
                      oyster.ingredients.build(name:'Oyster: Miyagi')
                      oyster.ingredients.build(name:'Oyster: Ninigret Cup')
                      oyster.ingredients.build(name:'Oyster: Passion')
                      oyster.ingredients.build(name:'Oyster: Pemaquid')
                      oyster.ingredients.build(name:'Oyster: Pleasant Bay')
                      oyster.ingredients.build(name:'Oyster: Riptide')
                      oyster.ingredients.build(name:'Oyster: Rocky Shore')
                      oyster.ingredients.build(name:'Oyster: Salish Sea')
                      oyster.ingredients.build(name:'Oyster: Salutation Cove')
                      oyster.ingredients.build(name:'Oyster: Sheepscott')
                      oyster.ingredients.build(name:'Oyster: Sister Point')
                      oyster.ingredients.build(name:'Oyster: St. Simone')
                      oyster.ingredients.build(name:'Oyster: Standish Shore')
                      oyster.ingredients.build(name:'Oyster: Sun Hollow')
                      oyster.ingredients.build(name:'Oyster: Summerside')
                      oyster.ingredients.build(name:'Oyster: Tatamagouche')
                      oyster.ingredients.build(name:'Oyster: Thatch Island')
                      oyster.ingredients.build(name:'Oyster: Turtle Cove')
                      oyster.ingredients.build(name:'Oyster: Wallace Bay')
                      oyster.ingredients.build(name:'Oyster: Wellfleet')
                      
    fish          = seafood.children.build(name:'Fish')
                      fish.ingredients.build(name:'Fish: Halibut Cheeks')
                      fish.ingredients.build(name:'Fish: Wahoo (Ono)')
                      fish.ingredients.build(name:'Fish: Amberjack')
                      fish.ingredients.build(name:'Fish: Tuna, Yellowfin')
                      fish.ingredients.build(name:'Fish: Corvina Fillet')
                      fish.ingredients.build(name:'Fish: Grouper, Red Fillet')
                      fish.ingredients.build(name:'Fish: Grouper, Black Fillet')
                      fish.ingredients.build(name:'Fish: Salmon, Sockeye Fillet')
                      fish.ingredients.build(name:'Fish: Salmon, King Fillet')
                      fish.ingredients.build(name:'Fish: Salmon, Coho  Fillet')
                      fish.ingredients.build(name:'Fish: Artic Char, Fillet')
                      fish.ingredients.build(name:'Fish: Trout, Ocean, Fillet')
                      fish.ingredients.build(name:'Fish: Blue Marlin (Kajiki) Loin')
                      fish.ingredients.build(name:'Fish: Mahi Mahi Fillet')
                      fish.ingredients.build(name:'Fish: Sea Bass Fillet')
                      fish.ingredients.build(name:'Fish: Barramundi Fillet')
                      fish.ingredients.build(name:'Fish: Swordfish Loin, Boneless')
                      fish.ingredients.build(name:'Fish: Sturgeon Fillet')
                      fish.ingredients.build(name:'Fish: Sablefish (Black Cod) Fillet')
                      fish.ingredients.build(name:'Fish: Whitefish Fillet')
                      fish.ingredients.build(name:'Fish: Perch, Lake')
                      fish.ingredients.build(name:'Fish: Perch, Ocean')
  frozen        = refrigerated.children.build(name:'Frozen')
                    frozen.ingredients.build(name:'Puree, Frozen, Peach') 
                    frozen.ingredients.build(name:'Juice, Frozen, Tart Cherry')
                    frozen.ingredients.build(name:'French Baguette, Frozen') 
                    frozen.ingredients.build(name:'Mussel, Frozen') 
                    frozen.ingredients.build(name:'Tortilla, Frozen, Corn') 
                    frozen.ingredients.build(name:'Tortilla, Frozen, Flour')
                     
refrigerated.save


dry_goods           = Category.create(name:'Canned & Dry Goods'                                  )
                      dry_goods.ingredients.build(name:'Flour')
                      dry_goods.ingredients.build(name:'Flour, Semolina')
                      dry_goods.ingredients.build(name:'Flour, All-purpose')
                      dry_goods.ingredients.build(name:'Flour, Hi-gluten')
                      dry_goods.ingredients.build(name:'Yeast')
                      dry_goods.ingredients.build(name:'Baking Soda')
                      dry_goods.ingredients.build(name:'Baking Powder')
                      dry_goods.ingredients.build(name:'Cocoa Powder, Baking')
                      dry_goods.ingredients.build(name:'Vanilla, Extract')
                      dry_goods.ingredients.build(name:'Vanilla, Bean')
                      dry_goods.ingredients.build(name:'Pan Coating Release')
                      dry_goods.ingredients.build(name:'Breadcrumb')
                      dry_goods.ingredients.build(name:'Chocolate, Dark, Bittersweet')
                      dry_goods.ingredients.build(name:'Hot Sauce')
                      dry_goods.ingredients.build(name:'Hot Sauce: Franks')
                      dry_goods.ingredients.build(name:'Hot Sauce: Tabasco')
                      dry_goods.ingredients.build(name:'Hot Sauce: Tabasco, Green')
                      dry_goods.ingredients.build(name:'Hot Sauce: Tabasco, Chipotle')
                      dry_goods.ingredients.build(name:'Hot Sauce: Cholula')
                      dry_goods.ingredients.build(name:'Anchovies')
                      dry_goods.ingredients.build(name:'Capers')
                      dry_goods.ingredients.build(name:'Peanuts')
                      dry_goods.ingredients.build(name:'Pistachios')
                      dry_goods.ingredients.build(name:'Almonds, Whole')
                      dry_goods.ingredients.build(name:'Almonds, Slivered')
                      dry_goods.ingredients.build(name:'Cashew, Large Pieces')
  canned            = dry_goods.children.build(name:'Canned')                   
                      canned.ingredients.build(name:'Juice, Canned, Vegetable')
                      canned.ingredients.build(name:'Juice, Canned, Pinapple')
                      canned.ingredients.build(name:'Milk, Condensed, Sweetened')
                      canned.ingredients.build(name:'Milk, Condensed, Unsweetened')
                      canned.ingredients.build(name:'Olives, Green')
                      canned.ingredients.build(name:'Olives, Green, w/ pimento')
                      canned.ingredients.build(name:'Olives, Kalamata')
                      canned.ingredients.build(name:'Tomato, Canned, Crushed')
                      canned.ingredients.build(name:'Tomato, Canned, Diced')
                      canned.ingredients.build(name:'Pickle, Cornichon')
  spices            = dry_goods.children.build(name:'Spices'                            )
                      dry_goods.ingredients.build(name:'Old Bay Seasoning')
                      dry_goods.ingredients.build(name:'Dill Seed, Whole')
                      sugar   = spices.ingredients.build(name:'Sugar'                   )
                                spices.ingredients.build(name:'Sugar, Granulated'       ) 
                                spices.ingredients.build(name:'Sugar, Brown Turbinado'            )
                      salt    = spices.ingredients.build(name:'Salt'                    )
                                spices.ingredients.build(name:'Salt, Iodized'           )
                                spices.ingredients.build(name:'Salt, Sea'               )
                                spices.ingredients.build(name:'Salt, Kosher'            )
                                spices.ingredients.build(name:'Salt, Seasoned'          )
                                spices.ingredients.build(name:'Salt, Celery'            )
                                spices.ingredients.build(name:'Salt, Fleur de Sel'      )
                      pepper  = spices.ingredients.build(name:'Pepper (spice)'          )
                                spices.ingredients.build(name:'Pepper, Black'           )
                                spices.ingredients.build(name:'Pepper, White'           )
                      
                      
  oils_vinegars     = dry_goods.children.build(name:'Oils, Vinegars, Sauces')
                      oils_vinegars.ingredients.build(name:'Honey')
                      oils_vinegars.ingredients.build(name:'Vinegar, White Distilled')
                      oils_vinegars.ingredients.build(name:'Vinegar, Red Wine')
                      oils_vinegars.ingredients.build(name:'Vinegar, Rice Wine')
                      oils_vinegars.ingredients.build(name:'Vinegar, Rice Seasoned')
                      oils_vinegars.ingredients.build(name:'Vinegar, Champagne')
                      oils_vinegars.ingredients.build(name:'Vinegar, Balsamic')
                      oils_vinegars.ingredients.build(name:'Wine, White')
                      oils_vinegars.ingredients.build(name:'Wine, Red')
                      oils_vinegars.ingredients.build(name:'Olive Oil, Extra Virgin')
                      oils_vinegars.ingredients.build(name:'Salad Oil, Canola')
                      oils_vinegars.ingredients.build(name:'Corn Syrup')
                      oils_vinegars.ingredients.build(name:'Worcestershire Sauce')
                      oils_vinegars.ingredients.build(name:'Soy Sauce')
                      oils_vinegars.ingredients.build(name:'Ketchup')
                      oils_vinegars.ingredients.build(name:'Mustard, Yellow')
                      oils_vinegars.ingredients.build(name:'Mustard, Dijon')
                      oils_vinegars.ingredients.build(name:'Mayonnaise')
                      oils_vinegars.ingredients.build(name:'Relish')
                      oils_vinegars.ingredients.build(name:'Horseradish Sauce')
                      oils_vinegars.ingredients.build(name:'Shortening')
                      
                      
    
  grains            = dry_goods.children.build(name:'Grains')
                      
                      
    whole_grains    = grains.children.build(name:'Whole')
                      whole_grains.ingredients.build(name:'Amaranth')
                      whole_grains.ingredients.build(name:'Barley')
                      whole_grains.ingredients.build(name:'Rice, Brown')
                      whole_grains.ingredients.build(name:'Rice, Refined')
                      whole_grains.ingredients.build(name:'Rice, White')
                      whole_grains.ingredients.build(name:'Rice, Wild')
                      whole_grains.ingredients.build(name:'Rice, Jasmine')
                      whole_grains.ingredients.build(name:'Rice, Basmati')
                      whole_grains.ingredients.build(name:'Buckwheat')
                      whole_grains.ingredients.build(name:'Bulgur(Cracked Wheat)')
                      whole_grains.ingredients.build(name:'Farro')
                      whole_grains.ingredients.build(name:'Flaxseed')
                      whole_grains.ingredients.build(name:'Grano')
                      whole_grains.ingredients.build(name:'Oats')
                      whole_grains.ingredients.build(name:'Popcorn')
    refined_grains  = grains.children.build(name:'Refined')
                      refined_grains.ingredients.build(name:'Couscous')
                      refined_grains.ingredients.build(name:'Qunioa')
                      refined_grains.ingredients.build(name:'Grits')
                      refined_grains.ingredients.build(name:'Noodles')

dry_goods.save

supplies            = Category.create(name:'Restaurant Supplies')
  paper_disposable  = supplies.children.build(name:'Paper & Disposable Goods')
                      paper_disposable.ingredients.build(name:'Latex Gloves')
                      paper_disposable.ingredients.build(name:'Doily')
                      paper_disposable.ingredients.build(name:'Aluminum Foil')
                      paper_disposable.ingredients.build(name:'Pan Liner')
                      paper_disposable.ingredients.build(name:'Paper Towel')
                      paper_disposable.ingredients.build(name:'Napkin, Dinner')
                      paper_disposable.ingredients.build(name:'Straw')
  janitorial        = supplies.children.build(name:'Chemical & Janitorial')
                      janitorial.ingredients.build(name:'Floor Cleaner')
                      janitorial.ingredients.build(name:'Machine Detergent')
                      janitorial.ingredients.build(name:'Rinse Aid')
                      janitorial.ingredients.build(name:'Delimer/Descaler')
                      janitorial.ingredients.build(name:'Presoak')
Measure.destroy_all
measures = Measure.create(
  [
    {name: 'Gallon',      abbreviation: 'gal',  volume_weight: 0,   english_metric: 0 },  #0
    {name: 'Quart',       abbreviation: 'qt',   volume_weight: 0,   english_metric: 0 },  #1
    {name: 'Pint',        abbreviation: 'pt',   volume_weight: 0,   english_metric: 0 },  #2
    {name: 'Cup',         abbreviation: 'c',    volume_weight: 0,   english_metric: 0 },  #3
    {name: 'Ounce (vol)', abbreviation: 'oz',   volume_weight: 0,   english_metric: 0 },  #4
    {name: 'Tablespoon',  abbreviation: 'tbsp', volume_weight: 0,   english_metric: 0 },  #5
    {name: 'Teaspoon',    abbreviation: 'tsp',  volume_weight: 0,   english_metric: 0 },  #6
    {name: 'Liter',       abbreviation: 'L',    volume_weight: 0,   english_metric: 1 },  #7
    {name: 'Pound',       abbreviation: 'lb',   volume_weight: 1,   english_metric: 0 },  #8
    {name: 'Ounce (wt)',  abbreviation: 'oz',   volume_weight: 1,   english_metric: 0 },  #9
    {name: 'gram',        abbreviation: 'g',    volume_weight: 0,   english_metric: 1 },   #10
    {name: 'count',       abbreviation: 'cnt',  volume_weight: 0,   english_metric: 0 }   #11
  ]

)
Conversion.destroy_all
Conversion.create(
  [
    { measure_a_id: measures[0].id,  measure_b_id: measures[1].id,    quantity: 4.0       }, # gal = 4.0 qt (s)
    { measure_a_id: measures[0].id,  measure_b_id: measures[2].id,    quantity: 8.0       }, # gal = 8.0 pt (s)
    { measure_a_id: measures[0].id,  measure_b_id: measures[3].id,    quantity: 16.0      }, # gal = 16.0 c (s)
    { measure_a_id: measures[0].id,  measure_b_id: measures[4].id,    quantity: 128.0     }, # gal = 128.0 oz (s)
    { measure_a_id: measures[0].id,  measure_b_id: measures[7].id,    quantity: 3.78541   }, # gal = 3.78541 L (s)
    
    { measure_a_id: measures[1].id,  measure_b_id: measures[2].id,    quantity: 2.0       }, # qt = 2.0 pt (s)
    { measure_a_id: measures[1].id,  measure_b_id: measures[3].id,    quantity: 4.0       }, # qt = 4.0 c (s)
    { measure_a_id: measures[1].id,  measure_b_id: measures[4].id,    quantity: 32.0      }, # qt = 32.0 oz (s)
    { measure_a_id: measures[1].id,  measure_b_id: measures[7].id,    quantity: 0.96      }, # qt = 0.96 L (s)
    
    { measure_a_id: measures[2].id,  measure_b_id: measures[3].id,    quantity: 2.0       }, # pt = 2.0 c (s)
    { measure_a_id: measures[2].id,  measure_b_id: measures[4].id,    quantity: 16.0      }, # pt = 16.0 oz (s)
    { measure_a_id: measures[2].id,  measure_b_id: measures[7].id,    quantity: 0.48      }, # pt = 0.48 L (s)
    
    { measure_a_id: measures[3].id,  measure_b_id: measures[4].id,    quantity: 8.0       }, # c = 8.0 oz (s)
    { measure_a_id: measures[3].id,  measure_b_id: measures[5].id,    quantity: 16.0      }, # c = 16.0 tbsp (s)
    { measure_a_id: measures[3].id,  measure_b_id: measures[7].id,    quantity: 0.238588  }, # c = 0.238588 L (s)
    
    { measure_a_id: measures[4].id,  measure_b_id: measures[5].id,    quantity: 2.0       }, # oz = 2.0 tbsp (s)
    { measure_a_id: measures[4].id,  measure_b_id: measures[7].id,    quantity: 0.03      }, # oz = 0.03 L (s)
    
    { measure_a_id: measures[5].id,  measure_b_id: measures[6].id,    quantity: 3.0       }, # tbsp = 3.0 tsp (s)
    
    { measure_a_id: measures[6].id,  measure_b_id: measures[7].id,    quantity: 0.005     }, # tsp = 0.005 L (s)
    
    { measure_a_id: measures[8].id,  measure_b_id: measures[9].id,    quantity: 16.0      }, # lb = 16.0 oz (s)
    { measure_a_id: measures[8].id,  measure_b_id: measures[10].id,   quantity: 453.592  } # lb = 453.592 g (s)
    
  ]

)

