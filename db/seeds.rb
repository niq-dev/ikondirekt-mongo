# encoding: utf-8

Encoding.default_external = Encoding::UTF_8

def rand_str(len)
  tokens = ("a".."z").to_a
  rand_str = ""
  1.upto(len) { |i| rand_str << tokens[rand(tokens.size-1)] }
  rand_str
end

def rand_int(len)
  tokens = ("0".."9").to_a
  rand_str = ""
  1.upto(len) { |i| rand_str << tokens[rand(tokens.size-1)] }
  rand_str
end

def rand_text(len)
  tokens = ("0".."9").to_a + (" ").to_a
  rand_str = ""
  1.upto(len) { |i| rand_str << tokens[rand(tokens.size-1)] }
  rand_str
end

# Create Users Seeds
customers = []
customers[0] = Customer.new(:email => 'c@1.com',
                            :password => '123456',
                            :password_confirmation => '123456',
                            :first_name => "Yifeng",
                            :last_name => "Qin",
                            :gentler => "",
                            :title => "",
                            :birthday => "",
                            :mobile => "+43 69911091138")
customers[0].address = {:place_code => 1010,
                        :street => "waldgasse 17"}
customers[0].save!
staffs = []
staffs[0] = Staff.create(:email => 'pm@1.com', :password => '123456', :password_confirmation => '123456', :first_name => "Martin", :last_name => "Luther",
                         :avatar => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'staffs', 'avatars', 'avatar.jpg')))
staffs[1] = Staff.create(:email => 'pa@1.com', :password => '123456', :password_confirmation => '123456', :first_name => "Peter", :last_name => "Pan",
                         :avatar => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'staffs', 'avatars', 'avatar2.jpg')))

staffs[0].add_role :manager

administrator = Administrator.create(:email => 'a@1.com', :password => '123456', :password_confirmation => '123456', :first_name => "Christoph", :last_name => "Reisegger")

## Create Product Categories Seeds
product_categories = []
product_categories[0] = ProductCategory.create(:name => 'Banking')
product_categories[1] = ProductCategory.create(:name => 'Leasing')
product_categories[2] = ProductCategory.create(:name => 'Versicherungen')
product_categories[3] = ProductCategory.create(:name => 'Kredit')
product_categories[4] = ProductCategory.create(:name => 'Veranlagung')
product_categories[5] = ProductCategory.create(:name => 'Lebensversicherungen')
product_categories[6] = ProductCategory.create(:name => 'Sacheversicherungen')
#add child categories to their parent
product_categories[0].children << product_categories[3]
product_categories[0].children << product_categories[4]
product_categories[2].children << product_categories[5]
product_categories[2].children << product_categories[6]

#create product seeds
products = []
products[0] = Product.create(:name => 'Konsumkredit', :required_incoming => true)
products[1] = Product.create(:name => 'Kfz-/Bike Finanzierung', :required_incoming => true)
products[2] = Product.create(:name => 'Einrichtung / Ausstattung Finanzierung', :required_incoming => true)
products[3] = Product.create(:name => 'Immobilien Finanzierung', :required_incoming => true)

products[4] = Product.create(:name => 'Sparbuch', :required_incoming => true)
products[5] = Product.create(:name => 'Wertpapiere', :required_incoming => true)
products[6] = Product.create(:name => 'Bausparen', :required_incoming => true)

products[7] = Product.create(:name => 'Kfz-/Bike Leasing')
products[8] = Product.create(:name => 'Einrichtung / Ausstattung Leasing')
products[9] = Product.create(:name => 'Immobilien  Leasing')

products[10] = Product.create(:name => 'Lebensversicherungen')
products[11] = Product.create(:name => 'Krankenversicherung')
products[12] = Product.create(:name => 'Unfallversicherung')
products[13] = Product.create(:name => 'Job & Vorsorge')

products[14] = Product.create(:name => 'Haus & Wohnung')
products[15] = Product.create(:name => 'Kfz & Bike Versicherung')
products[16] = Product.create(:name => 'Reiseversicherung')
products[17] = Product.create(:name => 'Rechtsschutzversicherung')

#add Product to ProductCategory
product_categories[3].products << products[0]
product_categories[3].products << products[1]
product_categories[3].products << products[2]
product_categories[3].products << products[3]

product_categories[4].products << products[4]
product_categories[4].products << products[5]
product_categories[4].products << products[6]

product_categories[1].products << products[7]
product_categories[1].products << products[8]
product_categories[1].products << products[9]

product_categories[5].products << products[10]
product_categories[5].products << products[11]
product_categories[5].products << products[12]
product_categories[5].products << products[13]

product_categories[6].products << products[14]
product_categories[6].products << products[15]
product_categories[6].products << products[16]
product_categories[6].products << products[17]

#Create companies Seeds
companies = []
companies[0] = Company.create(:name => 'BAWAG PSK', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '1', 'bawag-psk.png')))
companies[1] = Company.create(:name => 'Bank Austria', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '2', 'bank-austria.png')))
companies[2] = Company.create(:name => 'Erste Bank', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '3', 'erste-bank.png')))
companies[3] = Company.create(:name => 'Raiffeisen Bank', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '4', 'raiffeisen-bank.png')))
companies[4] = Company.create(:name => 'Allianz', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '5', 'allianz.png')))
companies[5] = Company.create(:name => 'Bankhaus Spangler', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '6', 'bankhaus-spangler.png')))
companies[6] = Company.create(:name => 'Hypo Aple', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '7', 'hypo-aple.png')))
companies[7] = Company.create(:name => 'Krentschker', :logo => File.open(File.join(Rails.root, 'vendor', 'seed_source', 'companies', 'logo', '8', 'krentschker.png')))

for c in 0 .. 3
  for i in 0 .. 17
    companies[c].products << products[i]
  end
end

companies[0].states << Location::State.all
companies[1].states << Location::State.all
companies[4].states << Location::State.all
companies[5].states << Location::State.all

companies[0].staffs << staffs[0] << staffs[1]

##Create Branch for Company
branches = []
branches[0] = companies[0].branches.new(:name => "BAWAG PSK Filiale und Post",
                                        :email => 'example@example.com',
                                        :office_hours => 'Mo - Fr: 8:00 - 18:00, Sa: 9:00 - 12:00',
)
branches[0].address = {:place_code => 1010,
                       :street => "Ada-Christen-Gasse 2",
                       :phone => '05 99 05-6177 00',
                       :fax => '05 99 05-6177 01'}
branches[0].save

branches[1] = companies[0].branches.new(:name => "BAWAG PSK Filiale und Post",
                                        :ema => 'example@example.com',
                                        :office_hours => 'Mo - Fr: 8:00 - 18:00, Sa: 9:00 - 12:00'
)
branches[1].address = {:place_code => 1130,
                       :street => "Bahnhofstraße 31",
                       :phone => '05 99 05-6714 00',
                       :fax => '05 99 05-6714 00'}
branches[1].save

branches[2] = companies[0].branches.new(:name => "BAWAG PSK Filiale und Post",
                                        :email => 'example@example.com',
                                        :office_hours => 'Mo - Fr: 8:00 - 18:00, Sa: 9:00 - 12:00')
branches[2].address = {:place_code => 1100,
                       :street => "Waldgasse 17",
                       :phone => '05 99 05-6177 00',
                       :fax => '05 99 05-6177 01'}
branches[2].save

#add staffs to branche[0]
branches[0].staffs << staffs[0] << staffs[1]

#Create Product Form
#1 - Consumption Credit       - Konsumfinanzierung
products[0].enquiry_fields.create!(machine_name: :reason,
                                   title: "Zweck",
                                   type: :input,
                                   positon: 1)
products[0].enquiry_fields.create!(machine_name: :period,
                                   title: "Laufzeit",
                                   type: :select,
                                   enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                                   postion: 2)
products[0].enquiry_fields.create!(machine_name: :repayment,
                                   title: "Rückführung",
                                   type: :select,
                                   enum: ["Raten", "Endfällig"],
                                   postion: 3)
products[0].reply_fields.create!(machine_name: :effective_interest_rate,
                                 title: "Effektivzinssatz (Indikation)",
                                 type: :input,
                                 suffix: "%",
                                 postion: 1)
products[0].reply_fields.create!(machine_name: :total,
                                 title: "Gesamtbelastung in EUR",
                                 type: :input,
                                 suffix: "€",
                                 postion: 2)
products[0].reply_fields.create!(machine_name: :monthly_interest_rate,
                                 title: "Gesamtrate p.M.",
                                 type: :input,
                                 suffix: "%",
                                 postion: 3)

#2 - Car & Bike Credit        - Kfz-/Bike Finanzierung
products[1].enquiry_fields.create!(machine_name: :mark,
                                   title: 'Marke',
                                   type: :input,
                                   position: 1)
products[1].enquiry_fields.create!(machine_name: :type,
                                   title: 'Type',
                                   type: :input,
                                   position: 2)
products[1].enquiry_fields.create!(machine_name: :period,
                                   title: 'Laufzeit',
                                   type: :select,
                                   enum: '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren',
                                   position: 3)
products[1].enquiry_fields.create!(machine_name: :repayment,
                                   title: 'Rückführung',
                                   type: :select,
                                   enum: ["Raten", "Endfällig"],
                                   position: 4)
products[1].reply_fields.create!(machine_name: :effective_interest_rate,
                                 title: 'Effektivzinssatz (Indikation)',
                                 type: :input,
                                 position: 1)
products[1].reply_fields.create!(machine_name: :total,
                                 title: 'Gesamtbelastung in EUR',
                                 type: :input,
                                 position: 2)
products[1].reply_fields.create!(machine_name: :monthly_interest_rate,
                                 title: 'Gesamtrate p.M.',
                                 type: :input,
                                 position: 3)
#3 - Furniture & Decor Credit - Einrichtung / Ausstattung Finanzierung
products[2].enquiry_fields.create!(machine_name: :reason,
                                   title: "Zweck",
                                   type: :input,
                                   position: 1)
products[2].enquiry_fields.create!(machine_name: :period,
                                   title: "Laufzeit",
                                   type: :select,
                                   enum: '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahren, 8 Jahren, 9 Jahren, 10 Jahren',
                                   position: 2)
products[2].enquiry_fields.create!(machine_name: :repayment,
                                   title: "Rückführung",
                                   type: :select,
                                   enum: 'Raten, Endfällig',
                                   position: 3)
products[2].reply_fields.create!(machine_name: :effective_interest_rate,
                                 title: "Effektivzinssatz (Indikation)",
                                 type: :input,
                                 position: 1)
products[2].reply_fields.create!(machine_name: :total,
                                 title: "Gesamtbelastung in EUR",
                                 type: :input,
                                 position: 2)
products[2].reply_fields.create!(machine_name: :monthly_interest_rate,
                                 title: "Gesamtrate p.M.",
                                 type: :input,
                                 position: 3)
#4 - House & Home Credit      - Immobilien Finanzierung
products[3].enquiry_fields.create!(machine_name: :mortgage,
                                   name: 'Hypothek',
                                   type: :select,
                                   enum: 'Ja, Nein',
                                   position: 1)
products[3].enquiry_fields.create!(machine_name: :period,
                                   title: "Laufzeit",
                                   type: :select,
                                   enum: '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahren, 8 Jahren, 9 Jahren, 10 Jahren',
                                   position: 2)
products[3].enquiry_fields.create!(machine_name: :repayment,
                                   title: "Rückführung",
                                   type: :select,
                                   enum: 'Raten, Endfällig',
                                   position: 3)
products[3].reply_fields.create!(machine_name: :effective_interest_rate,
                                 title: "Effektivzinssatz (Indikation)",
                                 type: :input,
                                 position: 1)
products[3].reply_fields.create!(machine_name: :total,
                                 title: "'Gesamtbelastung in EUR'",
                                 type: :input,
                                 position: 2)
products[3].reply_fields.create!(machine_name: :monthly_interest_rate,
                                 title: "Gesamtrate p.M.",
                                 type: :input,
                                 position: 3)
#5 - Deposit                  - Sparbuch
products[4].enquiry_fields.create!(machine_name: :period,
                                   title: "Laufzeit",
                                   type: :select,
                                   enum: '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahren, 8 Jahren, 9 Jahren, 10 Jahren',
                                   position: 1)
products[4].enquiry_fields.create!(machine_name: :fixed_variable_rate,
                                   name: 'Fixzins / Variabel',
                                   type: :select,
                                   enum: 'Fix, Variabel, Alle',
                                   position: 2)
products[4].reply_fields.create!(machine_name: :effective_interest_rate,
                                 title: "Effektivzinssatz (Indikation)",
                                 type: :input,
                                 position: 1)
products[4].reply_fields.create!(machine_name: :final_amount,
                                 name: 'Endbetrag in EUR',
                                 type: :input,
                                 position: 2)
#6 - Bond                       - Wertpapiere
products[5].enquiry_fields.create!(machine_name: :period,
                                   name: 'Laufzeit',
                                   type: :input,
                                   position: 1)
products[5].enquiry_fields.create!(machine_name: :type,
                                   name: 'Wertpapierart',
                                   type: :select,
                                   enum: 'Alle, Aktien, Anleihen, Fonds, Sonstige, Alle',
                                   position: 2)
products[5].enquiry_fields.create!(machine_name: :risk_appetite,
                                   name: 'Risikobereitschaft',
                                   type: :select,
                                   enum: 'Gering, Mittel, Hoch, Alle',
                                   position: 3)
products[5].reply_fields.create!(machine_name: :isin,
                                 name: 'ISIN-Nr.',
                                 type: :input,
                                 position: 1)
products[5].reply_fields.create!(machine_name: :price,
                                 name: 'Kaufkurs',
                                 type: :input,
                                 position: 2)
products[5].reply_fields.create!(machine_name: :expenses,
                                 name: 'Spesen',
                                 type: :input,
                                 position: 3)
#7 - Savings for Housing        - Bausparen
products[6].enquiry_fields.create!(machine_name: :period,
                                   title: "Laufzeit",
                                   type: :select,
                                   enum: '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahrenn',
                                   position: 1)
products[6].enquiry_fields.create!(machine_name: :payment_type,
                                   name: 'Zahlungsart',
                                   type: :select,
                                   enum: 'Monatlich, Jährlich, Einmalerlag',
                                   position: 2)
products[6].enquiry_fields.create!(machine_name: :level,
                                   name: 'Sparleistung',
                                   type: :select,
                                   enum: 'Monatlich EURO 10.00 - 100.00 , Jährlich EURO 0.00 - 1200.00, Einmalerlag EURO 0.00 - 7200.00',
                                   position: 3)
products[6].enquiry_fields.create!(machine_name: :contract_start,
                                   name: 'Vertragsbeginn',
                                   type: :select,
                                   enum: 'Monate, Jahre ab aktuellem Datum',
                                   position: 4)
products[6].reply_fields.create!(machine_name: :effective_interest_rate,
                                 title: "Effektivzinssatz (Indikation)",
                                 type: :input,
                                 position: 1)
products[6].reply_fields.create!(machine_name: :final_amount,
                                 name: 'Endbetrag in EUR',
                                 type: :input,
                                 position: 2)
#8 - Car & Bike Leasing         - Kfz-/Bike Leasing
#9 - Furniture & Decor Leasing  - Einrichtung / Ausstattung Leasing
#10 - House & Home Leasing      - Einrichtung / Ausstattung Leasing
#11 - Car & Bike Leasing        - Immobilien  Leasing
#12 - Life Insurance            - Lebensversicherungen
products[10].enquiry_fields.create!(machine_name: :insurance_type,
                                    name: 'Lebensversicherung',
                                    type: :select,
                                    enum: 'Erleben,Er- & Ableben,Ableben,Alle',
                                    position: 1)
products[10].enquiry_fields.create!(machine_name: :summe,
                                    name: 'Versicherungssumme',
                                    type: :input,
                                    position: 2)
products[10].enquiry_fields.create!(machine_name: :state_sponsored,
                                    name: 'Inkl. Staatlich geförderte Zukunftsvorsorge',
                                    type: :select,
                                    enum: 'Ja,Nein',
                                    position: 3)
products[10].enquiry_fields.create!(machine_name: :basis,
                                    name: 'Grundlage',
                                    type: :select,
                                    enum: 'Beitragsorientiert,Leistungsorientiert,Alle',
                                    position: 4)
products[10].enquiry_fields.create!(machine_name: :type,
                                    name: 'Art',
                                    type: :select,
                                    enum: 'Klassisch,Fondsgebunden,Sonstige,Alle',
                                    position: 5)
products[10].enquiry_fields.create!(machine_name: :insurance_period,
                                    name: 'Versicherungsdauer',
                                    type: :select,
                                    enum: '5 Jahren,10 Jahren,15 Jahren,20 Jahren,25 Jahren,30 Jahren,',
                                    position: 6)
products[10].enquiry_fields.create!(machine_name: :reason,
                                    name: 'Zweck der Versicherung',
                                    type: :select,
                                    enum: 'Absicherung,Kreditbesicherung,kindervorsorge',
                                    position: 7)
products[10].enquiry_fields.create!(machine_name: :prepayment,
                                    name: 'Einzahlung',
                                    type: :select,
                                    enum: 'laufend mtl., Einmalerlag',
                                    position: 5)
products[10].reply_fields.create!(machine_name: :summe,
                                  name: 'Versicherungssumme',
                                  type: :input,
                                  position: 1)
products[10].reply_fields.create!(:name => 'Rate p.M.',
                                  type: :input,
                                  position: 2)
#13 - Heath Insurance           - Krankenversicherung
products[11].enquiry_fields.create!(machine_name: :special_class,
                                    name: 'Sonderklasse',
                                    type: :select,
                                    enum: 'Ja,Nein',
                                    position: 1)
products[11].enquiry_fields.create!(machine_name: :bonus_program,
                                    name: 'Bonus Programm falls keine Inanspruchnahme',
                                    type: :select,
                                    enum: 'Ja,Nein',
                                    position: 2)
products[11].enquiry_fields.create!(machine_name: :daily_allowance,
                                    name: 'Krankenhaus Taggeld',
                                    type: :select,
                                    enum: 'Ja,Nein',
                                    position: 3)
products[11].enquiry_fields.create!(machine_name: :dental_insurance,
                                    name: 'Zahnversicherung',
                                    type: :select,
                                    enum: 'Ja,Nein',
                                    position: 4)
products[11].reply_fields.create!(machine_name: :interest_rate,
                                  name: 'Rate p.M.',
                                  type: :input,
                                  position: 1)
#14 - Accident Insurance        - Unfallversicherung
#products[12].enquiry_fields.create!(:name => 'Risiken',
#                                    type: :select,
#                                    enum: 'Privat,Beruf,Alle',
#                                    position: 1)
#products[12].enquiry_fields.create!(:name => 'Kategorie Senioren',
#                                    type: :select,
#                                    enum: 'Kinder,Teenager,Senioren,Alle',
#                                    position: 2)
#products[12].reply_fields.create!(:name => 'Rate p.M.',
#                                  type: :input,
#                                  enum: '',
#                                  position: 1)
##15 - Jobs & Provision Insurance- Job & Vorsorge
#products[13].enquiry_fields.create!(:name => 'Absicherung',
#                                    type: :select,
#                                    enum: 'Berufsunfähigkeit,Pflegevorsorge,Begräbniskosten,Alle',
#                                    position: 1)
#products[13].enquiry_fields.create!(:name => 'Sonstige',
#                                    type: :input,
#                                    enum: '',
#                                    position: 2)
#products[13].reply_fields.create!(:name => 'Rate p.M.',
#                                  type: :input,
#                                  enum: '',
#                                  position: 1)
##16 - House & Home Insurance    - Haus & Wohnung
#products[14].enquiry_fields.create!(:name => 'Nutzfläche in m2',
#                                    type: :input,
#                                    position: 1)
#products[14].enquiry_fields.create!(:name => 'Wert',
#                                    type: :input,
#                                    position: 2)
#products[14].enquiry_fields.create!(:name => 'Ausstattung',
#                                    type: :select,
#                                    enum: 'Einfach,Komfortabel,Gehoben,Exklusiv',
#                                    position: 3)
#products[14].enquiry_fields.create!(:name => 'Land',
#                                    type: :select,
#                                    enum: 'Wien,NÖ,Bgld.,Stmk.,OÖ,Kärnten,Salzburg,Tirol,Vorarlberg',
#                                    position: 4)
#products[14].enquiry_fields.create!(:name => 'Postleitzahl der Immobilie',
#                                    type: :input,
#                                    position: 5)
#products[14].enquiry_fields.create!(:name => 'Haus / Wohnung',
#                                    :product_id => 16,
#                                    type: :select,
#                                    enum: 'Haus,Wohnung,Sonstiges',
#                                    position: 6)
#products[14].enquiry_fields.create!(:name => 'ständig bewohnt',
#                                    type: :select,
#                                    enum: '1 Monat p.a.,2 Monate p.a.,3 Monat p.a.,4 Monat p.a.,5 Monat p.a.,6 Monat p.a.,7 Monat p.a.,8 Monat p.a.,6 Monat p.a.,9 Monat p.a.,10 Monat p.a.,11 Monat p.a.,12 Monat p.a.',
#                                    position: 7)
#products[14].reply_fields.create!(:name => 'Rate p.M.',
#                                  type: :input,
#                                  position: 1)
##17 - Car & Bike Insurance      - Kfz & Bike Versicherung
#products[15].enquiry_fields.create!(:name => 'Marke',
#                                    type: :input,
#                                    position: 1)
#products[15].enquiry_fields.create!(:name => 'Modell',
#                                    type: :input,
#                                    position: 2)
#products[15].enquiry_fields.create!(:name => 'Treibstoff',
#                                    type: :select,
#                                    enum: 'Benzin,Diesel,Elektro,Sonstige',
#                                    position: 3)
#products[15].enquiry_fields.create!(:name => 'Anzahl Türen',
#                                    type: :select,
#                                    enum: '1,2,3,4,5,6,7',
#                                    position: 4)
#products[15].enquiry_fields.create!(:name => 'Bauart',
#                                    type: :select,
#                                    enum: 'Cabriolet,Coupe,Sonstige',
#                                    position: 5)
#products[15].enquiry_fields.create!(:name => 'kW / PS',
#                                    type: :select,
#                                    enum: '9999 kw,9999 PS',
#                                    position: 6)
#products[15].enquiry_fields.create!(:name => 'Kilometer pro Jahr',
#                                    type: :input,
#                                    enum: '',
#                                    position: 7)
#products[15].enquiry_fields.create!(:name => 'Wert Sonderausstattung',
#                                    type: :input,
#                                    enum: '',
#                                    position: 8)
#products[15].enquiry_fields.create!(:name => 'Datum Erstzulassung',
#                                    type: :input,
#                                    enum: '',
#                                    position: 9)
#products[15].enquiry_fields.create!(:name => 'Alter des Fahrzeuges (bei Anschaffung durch Sie) ',
#                                    type: :select,
#                                    enum: 'neu,bis 1 Jahr,bis 2 Jahre,darüber',
#                                    position: 10)
#products[15].enquiry_fields.create!(:name => 'Winterruhe',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 11)
#products[15].enquiry_fields.create!(:name => 'Art der Finanzierung',
#                                    type: :select,
#                                    enum: 'Barankauf,Leasing,Kredit',
#                                    position: 12)
#products[15].enquiry_fields.create!(:name => 'Ist das Auto bereits auf Sie zugelassen',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 13)
#products[15].enquiry_fields.create!(:name => 'Neuversicherung ohne Bonusstufe',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 14)
#products[15].reply_fields.create!(:name => 'Rate p.M.',
#                                  type: :input,
#                                  position: 1)
##18 - Tourism Insurance         - Reiseversicherung
#products[16].enquiry_fields.create!(:name => 'Reisekostenstorno',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 1)
#products[16].enquiry_fields.create!(:name => 'Rücktransport',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 2)
#products[16].enquiry_fields.create!(:name => 'Gepäckversicherung',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 3)
#products[16].enquiry_fields.create!(:name => 'Selbstbehalt',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 4)
#products[16].reply_fields.create!(:name => 'Rate p.M.',
#                                  type: :input,
#                                  position: 1)
##19 - Legal expenses Insurance  - Rechtsschutzversicherung
#products[17].enquiry_fields.create!(:name => 'Berufliche Risiken',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 1)
#products[17].enquiry_fields.create!(:name => 'Private Risiken',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 2)
#products[17].enquiry_fields.create!(:name => 'Anwaltsvertretung',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 3)
#products[17].enquiry_fields.create!(:name => 'Strassenverkehr',
#                                    type: :select,
#                                    enum: 'Ja,Nein',
#                                    position: 4)
#products[17].enquiry_fields.create!(:name => 'Gültigkeit',
#                                    type: :select,
#                                    enum: 'National,Europa,Weltweit',
#                                    position: 5)
#products[17].enquiry_fields.create!(:name => 'Versicherte Personen',
#                                    type: :select,
#                                    enum: '1 Person,1 Person mit Kind(ern),Paar ohne Kind(er),Paar mit Kind(ern)',
#                                    position: 6)
#products[17].enquiry_fields.create!(:name => 'Aktuelle Tätigkeit',
#                                    type: :select,
#                                    enum: 'Angestellt,Angestellt & Selbständig,Selbständig,Pensionär,Nicht berufstätig,Sonstige',
#                                    position: 7)
#products[17].reply_fields.create!(:name => 'Rate p.M.',
#                                  type: :input,
#                                  position: 1)

#Create TopicCategory
topic_categories = []
topic_categories[0] = TopicCategory.create(:name => "Help")
topic_categories[1] = TopicCategory.create(:name => "About")
topic_categories[2] = TopicCategory.create(:name => "Support")
topic_categories[3] = TopicCategory.create(:name => "Tutorial")
#Create Topic
topics = []
topics[0] = topic_categories[3].topics.create(:name => "How to upload my avatar", :body => rand_text(100))
topics[1] = topic_categories[3].topics.create(:name => "How to process a enquiry", :body => rand_text(100))
topics[2] = topic_categories[3].topics.create(:name => "How to change my password", :body => rand_text(100))


#create fixture data
for i in 0 .. 10 do
  enquiry_tmp = customers[0].enquiries.new(:product => products[0])
  enquiry_tmp.reason = rand_str(6 + i%7)
  enquiry_tmp.amount = 123456
  enquiry_tmp.period = 1
  enquiry_tmp.repayment = 1
  enquiry_tmp.product.companies.each do |company|
    enquiry_tmp.chosen_partners << company
  end
  enquiry_tmp.save
end

companies.each do |company|
  branch_tmp = company.branches.new(:name => rand_str(5 + i%5),
                                    :email => "branch#{i}@#{company.name.to_sym}.com",
                                    :office_hours => 'Mo - Fr: 8:00 - 18:00, Sa: 9:00 - 12:00')
  branch_tmp.address = {:place_code => 1010,
                        :street => rand_str(5 + i%5),
                        :phone => '05 99 05-6177 00',
                        :fax => '05 99 05-6177 01'}
  branch_tmp.save
  for i in 1 .. 10 do
    staff_tmp = company.staffs.create(:email => "pa#{i}@#{company.name.to_sym}.com",
                                      :password => '123456', :password_confirmation => '123456',
                                      :first_name => rand_str(5 + i%5),
                                      :last_name => rand_str(4 + (i+3)%6),
                                      :phone => rand_int((5 + i%5)),
                                      :fax => rand_int((5 + i%5)),
                                      :office_hours => rand_text(20 + i%20),
    )
    company.branches.first.staffs << staff_tmp
  end
end


