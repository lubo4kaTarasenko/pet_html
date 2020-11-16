class PetHtml
  def initialize(pet)
    @pet = pet
  end
  
  def make_html
    content = File.read("#{self.class.root}/../pet_html.html")
    @html_new = "#{self.class.root}/pet_html_new.html"
    File.open(@html_new, 'w') {|f|
      f.puts content.gsub('{{name}}', @pet.name) 
      f.puts content.gsub('{{response}}', @pet.response.join(',')) 
      #f.puts content.gsub('{{mood}}', @pet.mood) 
      #f.puts content.gsub('{{states}}', @pet.states) 
      #f.puts content.gsub('{{number_of_lifes}}', @pet.lifes) 
      #f.puts content.gsub('{{number_of_lifes}}', @pet.emoji)     
    }
  end

  def open_html
    make_html    
    system("xdg-open #{@html_new}")
  end

  def self.root
    File.expand_path '..', __FILE__
  end
end