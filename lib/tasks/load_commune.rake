require 'nokogiri'
namespace :commune do
  desc 'Load Commune into database'
  task :load => :environment do
    8.times do |c|
      puts c;
      doc = Nokogiri::XML(Rails.root.join("db/#{c+1}.xml")) do |config|
        #config.strict
      end
      communities = doc.search('//rows/row')
      communities.each do |com|
        gmina = com.elements[2].children.text rescue nil
        puts gmina
        if gmina.present?
          nazwa = com.elements[4].children.text
          typ = com.elements[5].children.text
          Commune.create!(:name => nazwa, :desc => typ) rescue puts "dupa"
        end
      end
    end
  end
end
