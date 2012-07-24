require 'nokogiri'
namespace :commune do
  desc 'Load Commune into database'
  task :load => :environment do
    8.times do |c|
      doc = Nokogiri::XML(Rails.root.join("db/#{c+1}.xml"))
      communities = doc.search('//rows/row')
      communities.each do |com|
        gmina = com.elements[2].children.text rescue nil
        if gmina.present?
          nazwa = com.elements[4].children.text
          typ = com.elements[5].children.text
          Commune.create(:name => nazwa, :desc => typ)
        end
      end
    end
  end
  task :massload => :environment do
    doc = Nokogiri::XML(Rails.root.join("db/TERC.xml"))
    communities = doc.search('//rows/row')
    communities.each do |com|
      gmina = com.elements[2].children.text rescue nil
      if gmina.present?
        nazwa = com.elements[4].children.text
        typ = com.elements[5].children.text
        Commune.create(:name => nazwa, :desc => typ)
      end
    end
  end
end
