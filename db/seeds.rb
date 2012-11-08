# encoding: utf-8

Encoding.default_external = Encoding::UTF_8

def rand_str(len)
  tokens = ("a".."z").to_a
  rand_str = ""
  1.upto(len) { |i| rand_str << tokens[rand(tokens.size-1)] }
  return rand_str
end

def rand_int(len)
  tokens = ("0".."9").to_a
  rand_str = ""
  1.upto(len) { |i| rand_str << tokens[rand(tokens.size-1)] }
  return rand_str
end

def rand_text(len)
  tokens = ("0".."9").to_a + (" ").to_a
  rand_str = ""
  1.upto(len) { |i| rand_str << tokens[rand(tokens.size-1)] }
  return rand_str
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
products[0] = Product.create(:name => 'Konsumkredit')
products[1] = Product.create(:name => 'Kfz-/Bike Finanzierung')
products[2] = Product.create(:name => 'Einrichtung / Ausstattung Finanzierung')
products[3] = Product.create(:name => 'Immobilien Finanzierung')

products[4] = Product.create(:name => 'Sparbuch')
products[5] = Product.create(:name => 'Wertpapiere')
products[6] = Product.create(:name => 'Bausparen')

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
products[0].enquiry_fields.create(machine_name: :reason,
                                  title: "Zweck",
                                  type: :input,
                                  positon: 1)
products[0].enquiry_fields.create(machine_name: :period,
                                  title: "Laufzeit",
                                  type: :select,
                                  enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                                  postion: 2)
products[0].enquiry_fields.create(machine_name: :repayment,
                                  title: "Rückführung",
                                  type: :select,
                                  enum: ["Raten", "Endfällig"],
                                  postion: 3)
products[0].reply_fields.create(machine_name: :effective_interest_rate,
                                title: "Effektivzinssatz (Indikation)",
                                type: :input,
                                suffix: "%",
                                postion: 1)
products[0].reply_fields.create(machine_name: :total,
                                title: "Gesamtbelastung in EUR",
                                type: :input,
                                suffix: "€",
                                postion: 2)
products[0].reply_fields.create(machine_name: :monthly_interest_rate,
                                title: "Gesamtrate p.M.",
                                type: :input,
                                suffix: "%",
                                postion: 3)
#2 - Car & Bike Credit        - Kfz-/Bike Finanzierung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Marke',
                                                :product_id => 2,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Type',
                                                :product_id => 2,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Laufzeit',
                                                :product_id => 2,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Rückführung',
                                                :product_id => 2,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Raten, Endfällig',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Effektivzinssatz (Indikation)',
                                              :product_id => 2,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Gesamtbelastung in EUR',
                                              :product_id => 2,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 2)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Gesamtrate p.M.',
                                              :product_id => 1,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 3)
#3 - Furniture & Decor Credit - Einrichtung / Ausstattung Finanzierung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Zweck',
                                                :product_id => 3,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Laufzeit',
                                                :product_id => 3,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahren, 8 Jahren, 9 Jahren, 10 Jahren',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Rückführung',
                                                :product_id => 3,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Raten, Endfällig',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Effektivzinssatz (Indikation)',
                                              :product_id => 3,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Gesamtbelastung in EUR',
                                              :product_id => 3,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 2)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Gesamtrate p.M.',
                                              :product_id => 3,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 3)
#4 - House & Home Credit      - Immobilien Finanzierung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Hypothek',
                                                :product_id => 4,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja, Nein',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Laufzeit',
                                                :product_id => 4,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahren, 8 Jahren, 9 Jahren, 10 Jahren',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Rückführung',
                                                :product_id => 4,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Raten, Endfällig',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Effektivzinssatz (Indikation)',
                                              :product_id => 4,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Gesamtbelastung in EUR',
                                              :product_id => 4,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 2)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Gesamtrate p.M.',
                                              :product_id => 4,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 3)
#5 - Deposit                  - Sparbuch
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Laufzeit',
                                                :product_id => 5,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahren, 8 Jahren, 9 Jahren, 10 Jahren',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Fixzins / Variabel',
                                                :product_id => 5,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Fix, Variabel, Alle',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Effektivzinssatz (Indikation)',
                                              :product_id => 5,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Endbetrag in EUR',
                                              :product_id => 5,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 2)
#6 - Bond                       - Wertpapiere
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Laufzeit(1-99 Jahren)',
                                                :product_id => 6,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Wertpapierart',
                                                :product_id => 6,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Alle, Aktien, Anleihen, Fonds, Sonstige, Alle',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Risikobereitschaft',
                                                :product_id => 6,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Gering, Mittel, Hoch, Alle',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = ReplyFormTemplate.create(:name => 'ISIN-Nr.',
                                              :product_id => 6,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Kaufkurs',
                                              :product_id => 6,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 2)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Spesen',
                                              :product_id => 6,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 3)
#7 - Savings for Housing        - Bausparen
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Betrag',
                                                :product_id => 7,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Laufzeit',
                                                :product_id => 7,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren, 6 Jahren, 7 Jahrenn',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Zahlungsart',
                                                :product_id => 7,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Monatlich, Jährlich, Einmalerlag',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Sparleistung',
                                                :product_id => 7,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Monatlich EURO 10.00 - 100.00 , Jährlich EURO 0.00 - 1200.00, Einmalerlag EURO 0.00 - 7200.00',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Vertragbeginn',
                                                :product_id => 7,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Monate, Jahre ab aktuellem Datum',
                                                :field_regex => '',
                                                :position => 5)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Effektivzinssatz (Indikation)',
                                              :product_id => 7,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Endbetrag in EUR',
                                              :product_id => 7,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 2)
#8 - Car & Bike Leasing         - Kfz-/Bike Leasing
#9 - Furniture & Decor Leasing  - Einrichtung / Ausstattung Leasing
#10 - House & Home Leasing      - Einrichtung / Ausstattung Leasing
#11 - Car & Bike Leasing        - Immobilien  Leasing
#12 - Life Insurance            - Lebensversicherungen
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Lebensversicherung',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Erleben,Er- & Ableben,Ableben,Alle',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Versicherungssumme',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Inkl. Staatlich geförderte Zukunftsvorsorge',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Grundlage',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Beitragsorientiert,Leistungsorientiert,Alle',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Art',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Klassisch,Fondsgebunden,Sonstige,Alle',
                                                :field_regex => '',
                                                :position => 5)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Versicherungsdauer',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '5 Jahren,10 Jahren,15 Jahren,20 Jahren,25 Jahren,30 Jahren,',
                                                :field_regex => '',
                                                :position => 6)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Zweck der Versicherung',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Absicherung,Kreditbesicherung,kindervorsorge',
                                                :field_regex => '',
                                                :position => 7)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Einzahlung',
                                                :product_id => 12,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'laufend mtl., Einmalerlag',
                                                :field_regex => '',
                                                :position => 5)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Versicherungssumme',
                                              :product_id => 12,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 12,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 2)
#13 - Heath Insurance           - Krankenversicherung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Sonderklasse',
                                                :product_id => 13,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Bonus Programm falls keine Inanspruchnahme',
                                                :product_id => 13,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Krankenhaus Taggeld',
                                                :product_id => 13,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Zahnversicherung',
                                                :product_id => 13,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Sonstige',
                                                :product_id => 13,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 5)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 13,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
#14 - Accident Insurance        - Unfallversicherung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Risiken',
                                                :product_id => 14,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Privat,Beruf,Alle',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Kategorie Senioren',
                                                :product_id => 14,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Kinder,Teenager,Senioren,Alle',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 14,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
#15 - Jobs & Provision Insurance- Job & Vorsorge
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Absicherung',
                                                :product_id => 15,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Berufsunfähigkeit,Pflegevorsorge,Begräbniskosten,Alle',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Sonstige',
                                                :product_id => 15,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 15,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
#16 - House & Home Insurance    - Haus & Wohnung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Nutzfläche in m2',
                                                :product_id => 16,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Wert',
                                                :product_id => 16,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Ausstattung',
                                                :product_id => 16,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Einfach,Komfortabel,Gehoben,Exklusiv',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Land',
                                                :product_id => 16,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Wien,NÖ,Bgld.,Stmk.,OÖ,Kärnten,Salzburg,Tirol,Vorarlberg',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Postleitzahl der Immobilie',
                                                :product_id => 16,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 5)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Haus / Wohnung',
                                                :product_id => 16,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Haus,Wohnung,Sonstiges',
                                                :field_regex => '',
                                                :position => 6)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'ständig bewohnt',
                                                :product_id => 16,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1 Monat p.a.,2 Monate p.a.,3 Monat p.a.,4 Monat p.a.,5 Monat p.a.,6 Monat p.a.,7 Monat p.a.,8 Monat p.a.,6 Monat p.a.,9 Monat p.a.,10 Monat p.a.,11 Monat p.a.,12 Monat p.a.',
                                                :field_regex => '',
                                                :position => 7)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 16,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
#17 - Car & Bike Insurance      - Kfz & Bike Versicherung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Marke',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Modell',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Treibstoff',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Benzin,Diesel,Elektro,Sonstige',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Anzahl Türen',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1,2,3,4,5,6,7',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Bauart',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Cabriolet,Coupe,Sonstige',
                                                :field_regex => '',
                                                :position => 5)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'kW / PS',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '9999 kw,9999 PS',
                                                :field_regex => '',
                                                :position => 6)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Kilometer pro Jahr',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 7)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Wert Sonderausstattung',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 8)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Datum Erstzulassung',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'text',
                                                :field_enum => '',
                                                :field_regex => '',
                                                :position => 9)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Alter des Fahrzeuges (bei Anschaffung durch Sie) ',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'neu,bis 1 Jahr,bis 2 Jahre,darüber',
                                                :field_regex => '',
                                                :position => 10)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Winterruhe',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 11)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Art der Finanzierung',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Barankauf,Leasing,Kredit',
                                                :field_regex => '',
                                                :position => 12)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Ist das Auto bereits auf Sie zugelassen',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 13)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Neuversicherung ohne Bonusstufe',
                                                :product_id => 17,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 14)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 17,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
#18 - Tourism Insurance         - Reiseversicherung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Reisekostenstorno',
                                                :product_id => 18,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Rücktransport',
                                                :product_id => 18,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Gepäckversicherung',
                                                :product_id => 18,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Selbstbehalt',
                                                :product_id => 18,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 18,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)
#19 - Legal expenses Insurance  - Rechtsschutzversicherung
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Berufliche Risiken',
                                                :product_id => 19,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 1)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Private Risiken',
                                                :product_id => 19,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 2)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Anwaltsvertretung',
                                                :product_id => 19,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 3)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Strassenverkehr',
                                                :product_id => 19,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Ja,Nein',
                                                :field_regex => '',
                                                :position => 4)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Gültigkeit',
                                                :product_id => 19,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'National,Europa,Weltweit',
                                                :field_regex => '',
                                                :position => 5)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Versicherte Personen',
                                                :product_id => 19,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => '1 Person,1 Person mit Kind(ern),Paar ohne Kind(er),Paar mit Kind(ern)',
                                                :field_regex => '',
                                                :position => 6)
formFieldTemplates = EnquiryFormTemplate.create(:name => 'Aktuelle Tätigkeit',
                                                :product_id => 19,
                                                :required => true,
                                                :field_type => 'select',
                                                :field_enum => 'Angestellt,Angestellt & Selbständig,Selbständig,Pensionär,Nicht berufstätig,Sonstige',
                                                :field_regex => '',
                                                :position => 7)
formFieldTemplates = ReplyFormTemplate.create(:name => 'Rate p.M.',
                                              :product_id => 19,
                                              :required => true,
                                              :field_type => 'text',
                                              :field_enum => '',
                                              :field_regex => '',
                                              :position => 1)

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


