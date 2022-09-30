Fabricator(:position) do
  reference { SecureRandom.uuid }
  title { Faker::Lorem.sentence }
  company_name { Faker::Company.bs }
  update_uri { Faker::Internet.url }
end
