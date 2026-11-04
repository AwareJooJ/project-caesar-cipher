# Main class for the encryptor
class Encryptor
  ALPHABET = %w[
    a b c d e f g h i j k l m
    n o p q r s t u v w x y z
  ]

  def encrypt(phrase, key = 5)
    array = phrase.chars # Making an array of the phrase so I can iterate through it

    new_arr = array.map do |letter| # Making a new array just in case I need to refer back to the original Array
      new_key = key % 26 # Making sure the key is within the range of the alphabet
      if ALPHABET.include?(letter)
        result = ALPHABET.index(letter) + new_key
        if result > 26 # Making it go back to the first index
          ALPHABET[result - 26] # Ex: 28-26 = 2, so it goes back to the Third index
        else
          ALPHABET[result]
        end
      elsif ALPHABET.map(&:upcase).include?(letter) # Same logic but in case the letter is upcase
        result = ALPHABET.index(letter.downcase) + new_key
        if result > 26
          ALPHABET[result - 26].upcase
        else
          ALPHABET[result].upcase
        end
      else
        letter
      end
    end

    new_arr.join() # Joined together so it returns a string
  end
end
