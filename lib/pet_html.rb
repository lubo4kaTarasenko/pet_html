class PetHtml
  def initialize(pet)
    @pet = pet
  end
  
  def make_html
    content = File.read 'pet_html.html'
    @html_new = 'pet_html_new.html'
    File.open(@html.new, 'w') {|f|
      f.puts content.gsub('{{name}}', @pet.name) 
      f.puts content.gsub('{{response}}', @pet.response) 
      f.puts content.gsub('{{mood}}', @pet.mood) 
      f.puts content.gsub('{{states}}', @pet.states) 
      f.puts content.gsub('{{number_of_lifes}}', @pet.lifes) 
      f.puts content.gsub('{{number_of_lifes}}', @pet.emoji)     
    }
  end

  def open_html
    make_html
    system("xdg-open pet_html.htm")
  end
end