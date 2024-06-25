require 'nokogiri'
require 'open-uri'

# Fetch and parse the Wikipedia page
url = 'https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes'
html = URI.open(url)
doc = Nokogiri::HTML(html)

# Locate the table with class 'wikitable'
table = doc.at('table.wikitable')

# Initialize an array to hold the country data
countries = []

# Iterate over each row in the table
table.css('tr').each do |row|
  cells = row.css('td')
  next if cells.empty?  # Skip header or empty rows

  # Extract the relevant data from each cell, stripping whitespace and handling nil values
  name = cells[0]&.text&.strip || ''
  official_name = cells[1]&.text&.strip || ''
  sovereignty = cells[2]&.text&.strip || ''
  iso_alpha_two = cells[3]&.text&.strip || ''
  iso_alpha_three = cells[4]&.text&.strip || ''
  iso_numeric = cells[5]&.text&.strip || ''
  subdivision_codes = cells[6]&.text&.strip || ''
  tld = cells[7]&.text&.strip || ''

  # Escape single quotes in the text
  name = name.gsub("'", "\\\\'")
  official_name = official_name.gsub("'", "\\\\'")
  sovereignty = sovereignty.gsub("'", "\\\\'")

  # Append the data to the countries array
  countries << {
    name: name,
    official_name: official_name,
    sovereignty: sovereignty,
    iso_alpha_two: iso_alpha_two,
    iso_alpha_three: iso_alpha_three,
    iso_numeric: iso_numeric,
    subdivision_codes: subdivision_codes,
    tld: tld
  }
end

# Write the countries data to a seeds file
File.open('countries.seeds.rb', 'w') do |file|
  file.write("countries = [\n")
  countries.each do |country|
    file.write("  { name: '#{country[:name]}', official_name: '#{country[:official_name]}', sovereignty: '#{country[:sovereignty]}', iso_alpha_two: '#{country[:iso_alpha_two]}', iso_alpha_three: '#{country[:iso_alpha_three]}', iso_numeric: '#{country[:iso_numeric]}', subdivision_codes: '#{country[:subdivision_codes]}', tld: '#{country[:tld]}' },\n")
  end
  file.write("]\n\n")
  file.write("countries.each do |country|\n")
  file.write("  Country.create!(country)\n")
  file.write("end\n")
end

puts 'countries.seeds.rb file has been generated.'
