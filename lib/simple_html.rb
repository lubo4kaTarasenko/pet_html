require 'nokogiri'

class SimpleHtml
  def initialize(file_path = "#{self.class.root}/index.html")
    @file_path = file_path 
  end

  def make_html(bypass_html: false)
    content = File.read(@file_path)
    doc = Nokogiri::HTML(content)
    doc.xpath("//script").remove unless bypass_html 
    trimmed_content = doc.css('body').to_xhtml
    @html_new = "#{self.class.root}/new_index.html"
    File.open(@html_new, 'w') {|f|
      f.puts trimmed_content 
    }
  end

  def open_html(bypass_html: false)
    make_html(bypass_html: bypass_html)
    system("xdg-open #{@html_new}")
  end

  def self.root
    File.expand_path '..', __FILE__
  end
end
