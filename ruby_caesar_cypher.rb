require 'pry-byebug'

$alphabet = [
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
  "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
]

def caesar_cypher(phrase, key)
  string = phrase
  array = phrase.split("")

  binding.pry

  new_arr = array.map do |letter|
    if $alphabet.include?(letter.downcase)
      letter = letter.downcase
      letter = $alphabet.index(letter)
    else
      letter = letter
    end
    
  end
  new_arr.map! do |index|
    if index.is_a? Integer
      result = index + key
      if result > 26
        index = result - 26
       else
        index = result
      end
    else
      index = index
    end
  end
  
  new_arr = new_arr.map do |index|
    if index.is_a? Integer
     index = $alphabet[index]
    else
      index = index
    end
  end
 #
  string = new_arr.join("")
  
  p string

end

caesar_cypher("What a string!", 5)