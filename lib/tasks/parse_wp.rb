require 'nokogiri'
require 'open-uri'
 
class Parser
 
  def self.xml_to_hash
    xml = Nokogiri::HTML(open("http://www.wordpressxmlfeed.com"))
    data_nodes = xml.css("item")
    data_nodes.each do |node|
      puts node
      break
    end 
  end 
 
end
 
Parser.xml_to_hash