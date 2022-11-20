# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: 'admin@test.com').nil?
  u = User.new
  u.name = 'Менеджер тестирования'
  u.email = 'admin@rails.com'
  u.nickname = 'Admin'
  u.password = 'admin_password'
  u.password_confirmation = 'admin_password'
  u.is_admin = true
  u.save
else
  puts 'Эта учетная запись была создана, и она повторяется.'
end

  Currency.create!(
    name: 'Euro',
    symbol: '€',
    rate: 0.99
  )

  Currency.create!(
    name: 'US Dollar',
    symbol: '$',
    rate: 1
  )

  Currency.create!(
    name: 'Белорусский руболь',
    symbol: 'Br',
    rate: 2.5
  )

  # 
  # CategoryGroups
  # 
  #1
  CategoryGroup.create!(
    name: 'Парфюмерия'
  )
  #2
  CategoryGroup.create!(
    name: 'Макияж'
  )
  #3
  CategoryGroup.create!(
    name: 'Аптечная косметика'
  )
  #4
  CategoryGroup.create!(
    name: 'Лицо'
  )
  #5
  CategoryGroup.create!(
    name: 'Тело'
  )
  #6
  CategoryGroup.create!(
    name: 'Волосы'
  )


  # 
  # CATEGOTIES
  # 
  #1
  Category.create!(
    category_group_id: 1,
    name: 'Для женщин'
  )
  #2
  Category.create!(
    category_group_id: 1,
    name: 'Для мужчин'
  )
  # 4
  Category.create!(
    category_group_id: 2,
    name: 'Для лица'
  )
  # 5
  Category.create!(
    category_group_id: 2,
    name: 'Для глаз'
  )
  # 6
  Category.create!(
    category_group_id: 2,
    name: 'Для губ'
  )
  # 7
  Category.create!(
    category_group_id: 2,
    name: 'Для ногтей'
  )
  # 8
  Category.create!(
    category_group_id: 2,
    name: 'Косметические наборы'
  )
  # 9
  Category.create!(
    category_group_id: 3,
    name: 'Гигиена полости рта'
  )
  # 10
  Category.create!(
    category_group_id: 3,
    name: 'Декоративная косметика'
  )
  # 11
  Category.create!(
    category_group_id: 3,
    name: 'Для лица'
  )


  # 
  # Brands
  #
  #1
  Brand.create!(
  name: 'Gucci',
  description: '
  Gucci – это всемирно известный знак качества, который сопровождает представителей элиты как в повседневной жизни, так и на красной ковровой дорожке. Начиная с флаконов, которые можно назвать произведениями искусства, и заканчивая ароматами внутри них – всё в парфюмерных творениях Gucci воплощает элегантность.
  '
  )
  #2
  Brand.create!(
  name: 'Loreal',
  description: '
  L’Oréal — французская компания по производству парфюмерии и косметики. Штаб-квартира — в коммуне Клиши-ла-Гаренн в пригороде Парижа. Основана в 1909 году французским химиком Эженом Шюлле. 
  '
  )
  #3
  Brand.create!(
  name: 'Bioderma',
  description: '
  Цель Bioderma — тщательное изучение жизнедеятельности клеток кожи для восстановления ее баланса и устранения дисфункции.
  '
  )
  #4
  Brand.create!(
  name: 'Versace',
  description: '
  итальянский модный дом, основанный дизайнером Джанни Версаче в 1978 году и известный своим богатым барочным стилем с отсылками к древнегреческой мифологии.
  '
  )
  #5
  Brand.create!(
  name: 'Lancome',
  description: 'В 1935 году, великий мечтатель Арманд Петижан представлял себе мир, где авангард науки и красоты стал одним целым.
  Этот мир зовется LANCÔME.
  '
  )
  #6
  Brand.create!(
  name: 'Armani',
  description: 'Armani — итальянский Модный дом, выпускающий мужскую и женскую одежду, обувь, аксессуары, часы, галантерейные изделия, косметику, предметы интерьера и ювелирные украшения. Также бренд занимается выпуском парфюмерии в сотрудничестве с корпорацией LOreal.'
  )
  #7
  Brand.create!(
  name: 'Clinique',
  description: 'Clinique — это марка, которая первой предложила миру линию разработанных дерматологами косметических продуктов, учитывающих индивидуальные потребности каждой женщины, проверенных на аллергию, не содержащих парфюмерных добавок, доступных широкому кругу потребителей в парфюмерно-косметическом магазине.'
  )


 Product.create!(
   title: 'Туалетная вода Bloom Acqua Di Fiori, 100 мл',
   description: 'Спонтанность и восторг юности, в совокупности с узами женской дружбы, делают ее несокрушимой и легко противостоящей времени. Ее истинные черты раскрываются в новой главе Gucci Bloom. Новый аромат Gucci Bloom Acqua di Fiori – свежий зеленый микс, созданный на основе оригинальной композиции, которая воплощает жизнерадостность и энергию молодости и дружбы. Вдохновляющий и яркий, он символизирует невинную и неискушенную красоту. Верхние ноты раскрываются новым свежим водным мотивом зеленого гальбанума и бутонов черной смородины: едва уловимый мускусный оттенок листьев гальбанума подчеркивает пряные оттенки бутонов черной смородины.',
   price: 50,
   quantity: 3,
   category_id: 1,
   brand_id: 1,
   is_hidden: false
 )

 Product.create!(
   title: 'Парфюмерная вода Flora Gorgeous Gardenia, 30 мл',
   description: '
   Рожденная в год празднования 100-летнего юбилея модного дома, обновленная парфюмерная вода Gucci Flora Gorgeous Gardenia появляется в восхитительном розовом лакированном флаконе с характерным узором Flora, переосмысленным креативным видением Алессандро Микеле. Gucci Flora Gorgeous Gardenia в версии парфюмерной воды звучит так же, как классическая туалетная вода, но становится более стойкой.',
   price: 70,
   quantity: 5,
   category_id: 1,
   brand_id: 1,
   is_hidden: false
 )

 Product.create!(
   title: 'Тональный крем Teint miracle, тон 005',
   description: '
   Тональный крем Teint Miracle придает натуральное сияние, впервые кожа выглядит настолько естественно. Тональный крем открывает совершенную красоту будто обнаженной кожи и восхищает ее безупречно ровным тоном здорового цвета. Лучшее украшение для лица – это красивая и здоровая кожа, сияющая совершенством. Для кого? Тональный крем обладает универсальным покрытием и подходит любому типу кожи. Действие: Крем обладает средней плотностью покрытия, увлажняет и ухаживает, открывая естественную красоту кожи, одновременно маскируя ее недостатки. Безупречный вид здоровой кожи, сияющей совершенством. Результат: Ровный тон здоровой кожи, сияющее и максимально естественное покрытие натурального макияжа.
   ',
   price: 101,
   quantity: 11,
   category_id: 4,
   brand_id: 5,
   is_hidden: false
 )

 Product.create!(
   title: 'Тональное увлажняющее средство для кожи SKIN FEELS GOOD, тон 025W, 32 мл',
   description: '
   Skin Feels Good – это увлажняющее тональное средство, которое заботится о Вашей коже, раскрывая ее естественную красоту. Гиалуроновая и глицериновая кислоты в составе продукта отвечают за увлажнение в течение всего дня.
   ',
   price: 45,
   quantity: 10,
   category_id: 4,
   brand_id: 5,
   is_hidden: false
 )

 Product.create!(
   title: 'Пудра компактная Belle De Teint, тон 04',
   description: '
   Пудра Belle De Teint создана для придания здорового сияния вашей коже. Легкий штрих - и кожа мгновенно преображена! Естественное сияние здорового лица. Пудру оценят женщины с любым типом кожи. Она мгновенно выравнивает тон, тонизирует и возрождает сияние здоровой кожи. Лицо выглядит гладким, заметно посвежевшим, сияющим красотой.
   ',
   price: 50,
   quantity: 15,
   category_id: 4,
   brand_id: 5,
   is_hidden: false
 )

 Product.create!(
   title: 'Крем Sensibio AR BB Cream, тон светлый',
   description: '
   Крем Биодерма Сенсибио AR / Bioderma Sensibio AR для ежедневного ухода за гиперчувствительной и реактивной кожей. Увлажняет и успокаивает. Крем Sensibio AR успокаивает и увлажняет кожу, склонную к гиперчувствительности, снимает ощущение дискомфорта, улучшает её состояние и снижает её чувствительность при регулярном использовании крема.
   ',
   price: 30,
   quantity: 20,
   category_id: 10,
   brand_id: 3,
   is_hidden: false
 )

 Product.create!(
   title: 'Тени для век All About Shadow, тон French Vanilla',
   description: '
   Любой девушке нравятся оттенки, которые наносятся одним движением и мгновенно преображают глаза. Но при этом остаются на веках весь день, не тускнея и не осыпаясь. Представляем новую роскошную коллекцию теней All About Shadow от Clinique.
   ',
   price: 43,
   quantity: 20,
   category_id: 5,
   brand_id: 7,
   is_hidden: false
 )

 Product.create!(
  title: 'Парфюмерная вода VERSACE EROS, 50 мл',
  description: '
  Eros. Аромат. Парфюмерная вода Eros – синтез роскоши и провокации. Аромат обладает особым почерком и смело заявляет о себе, демонстрируя противоречивый характер: резкий контраст цитрусовой сочности и изысканной нежности. Новую главу открывает глубокий древесный аккорд.
  ',
  price: 150,
  quantity: 9,
  category_id: 2,
  brand_id: 4,
  is_hidden: false
)

 Product.create!(
   title: 'Универсальная подкручивающая тушь для ресниц High Impact',
   description: '
   Clinique представляет новую High Impact Curling Mascara – подкручивающую тушь с 24-часовой стойкостью, которая придает ресницам заметный объем и подкручивает их. Эта тушь идеально подходит для женщины, которая хочет сделать свои ресницы совершенными – длинными, пушистыми, выразительными, загнутыми.
   ',
   price: 30,
   quantity: 1,
   category_id: 5,
   brand_id: 7,
   is_hidden: false
 )

 Product.create!(
   title: 'Тени для век четырехцветные All About Shadow, тон Morning Java',
   description: '
   Любой девушке нравятся оттенки, которые наносятся одним движением и мгновенно преображают глаза. Но при этом остаются на веках весь день, не тускнея и не осыпаясь. Представляем новую роскошную коллекцию теней All About Shadow от Clinique.
   ',
   price: 90000,
   quantity: 2,
   category_id: 5,
   brand_id: 7,
   is_hidden: false
 )

 Product.create!(
   title: 'Жидкая подводка для век High Impact easy liquid liner, тон Black',
   description: '
   Жидкая подводка для глаз, которая создает идеальный контур - одним простым движением.
   ',
   price: 70,
   quantity: 7,
   category_id: 5,
   brand_id: 7,
   is_hidden: false
 )

 Product.create!(
   title: 'Нажмите, чтобы увеличить
   CLINIQUE
   Универсальная тушь для придания максимального объема High Impact Extreme Volume Mascara',
   description: '
   Тушь High Impact Extreme Volume Mascara, черная. Это Ваш шанс стать центром внимания! Новая тушь, которая распушит ресницы, сделает их гуще и объемнее, придаст им эффектность и выразительность. И такими они останутся на протяжении всего дня. НОВАЯ укрупненная, многомерная эргономичная щеточка имеет большую площадь, поэтому покрывает ресницы быстро и равномерно. 
   ',
   price: 39,
   quantity: 12,
   category_id: 5,
   brand_id: 7,
   is_hidden: false
 )




 Product.create!(
   title: 'Одеколон Clinique Happy For Men',
   description: '
   Аромат Clinique Happy For Men – свежий и притягательный, вызывает чувство счастья и переносит мужчину из реальности туда, где он мечтал бы оказаться. Необычные компоненты Clinique Happy напоминают о море, и создают ощущение свежести, в которое погружаешься, вдыхая этот аромат.
   ',
   price: 120,
   quantity: 5,
   category_id: 2,
   brand_id: 7,
   is_hidden: false
 )

 Product.create!(
   title: 'Парфюмерная вода Clinique Happy',
   description: '
   Один из самых популярных ароматов Clinique, создан в 1998 году, создает ощущение счастья. Дает своему обладателю ощущение свежести на протяжении всего дня. В аромате представлены ноты, которые ранее никогда не использовались в парфюмерии (цветы мелати, утренней орхидеи и др.).
   ',
   price: 150,
   quantity: 9,
   category_id: 1,
   brand_id: 7,
   is_hidden: false
 )

