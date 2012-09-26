require 'nokogiri'
namespace :commune do
  desc 'Load Commune into database'
  task :load => :environment do
    8.times do |c|
      f = File.open(Rails.root.join("db/#{c+1}.xml"))
      doc = Nokogiri::XML(f)
      communities = doc.search('//row')
      communities.each do |com|
        gmina = com.elements[2].children.text rescue nil
        if gmina.present?
          nazwa = com.elements[4].children.text rescue nil
          typ = com.elements[5].children.text rescue nil
          puts "#{nazwa} #{typ}\n"
          Commune.create(:name => nazwa, :desc => typ)
        end
      end
      f.close
    end
  end
  desc 'Mass-Load Commune into database'
  task :massload => :environment do
    f = File.open(Rails.root.join("db/TERC.xml"))
    doc = Nokogiri::XML(f)
    communities = doc.search('//row')
    puts communities.last
    communities.each do |com|
      gmina = com.elements[2].children.text rescue nil
      if gmina.present?
        nazwa = com.elements[4].children.text rescue nil
        typ = com.elements[5].children.text rescue nil
        puts "#{nazwa} #{typ}\n"
        Commune.create(:name => nazwa, :desc => typ)
      end
    end
    f.close
  end
end
