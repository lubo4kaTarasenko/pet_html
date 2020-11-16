class PetHtml
  def initialize(pet)
    @pet = pet
  end
  
  def make_html
    content = File.read("#{self.class.root}/pet_html.html")
    @html_new = "#{self.class.root}/pet_html_new.html"
    File.open(@html_new, 'w') {|f|
      content.gsub!('{{pet}}', @pet.class.to_s)
      content.gsub!('{{name}}', @pet.name) 
      content.gsub!('{{states}}', @pet.states.join(',')) 
      content.gsub!('{{number_of_lifes}}', @pet.lifes.to_s) 
      content.gsub!('{{emoji}}', @pet.emoji) 
      content.gsub!('{{response}}', @pet.response.join('<br>')) 
      f.puts content    
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