require "csv"

CSV.foreach('db/phrase.csv') do |info|
  Phrase.create(:sentence => info[0], :from => info[1])
end
