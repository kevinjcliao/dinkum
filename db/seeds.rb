require 'csv'
require 'date'
require 'set'

Donation.delete_all
Donor.delete_all

format = '%d/%m/%Y'
csv_text = File.read(Rails.root.join('lib', 'seeds', '2015-2016-AnalysisDonor.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
donors = {}
csv.each do |donation|
  d = Donation.new
  d.donor = donation['DonorClientNm']
  d.date_given = Date.strptime(donation['DonationDt'][0..9], format)
  d.amount = donation['AmountPaid']
  d.recipient = donation['RecipientClientNm']
  puts "Donor: #{d.donor} gave #{d.amount} on #{d.date_given} to #{d.recipient}"
  unless donors.key?(d.donor)
    donor = Donor.new
    donor.name = donation['DonorClientNm']
    donor.addressline1 = donation['DonorAddressLine1']
    donor.suburb = donation['DonorSuburb']
    donor.state = donation['DonorStateAb']
    donor.postcode = donation['DonorPostcode']
    puts "Created new Donor: #{donor.name}"
    donors.store(donor.name, donor)
    donor.save
  end
  d.save
end
