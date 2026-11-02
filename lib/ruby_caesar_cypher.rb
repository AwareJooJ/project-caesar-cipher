require 'pry-byebug'
# Global Variable for the alphabet
$alphabet = %w[
  a b c d e f g h i j k l m
  n o p q r s t u v w x y z
]
$upcase_alphabet = $alphabet.map { |letter| letter.upcase } # Upcase Version to make it case sensitive

def caesar_cypher(phrase, key)
  string = phrase
  array = phrase.split('')

  binding.pry # Just for debugging

  new_arr = array.map do |letter| # Making a new array just in case I need to refer back to the original Array
    if $alphabet.include?(letter)
      result = $alphabet.index(letter) + key
      if result > 26 # Making it go back to the first index
        $alphabet[result - 26] # Ex: 28-26 = 2, so it goes back to the Third index
      else
        $alphabet[result]
      end
    elsif $upcase_alphabet.include?(letter) # Same logic but in case the letter is upcase
      result = $upcase_alphabet.index(letter) + key
      if result > 26
        $upcase_alphabet[result - 26]
      else
        $upcase_alphabet[result]
      end
    else
      letter
    end
  end

  string = new_arr.join('') # Joined together so it returns a string

  p string
end

caesar_cypher('HeLlo WoRlD!', 5)
