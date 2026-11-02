class Encryptor
  $alphabet = %w[
    a b c d e f g h i j k l m
    n o p q r s t u v w x y z
  ]

  def encrypt(phrase, key = 5)
    string = phrase
    array = phrase.split("")

    new_arr = array.map do |letter| # Making a new array just in case I need to refer back to the original Array
      if $alphabet.include?(letter)
        result = $alphabet.index(letter) + key
        if result > 26 # Making it go back to the first index
          $alphabet[result - 26] # Ex: 28-26 = 2, so it goes back to the Third index
        else
          $alphabet[result]
        end
      elsif $alphabet.map(&:upcase).include?(letter) # Same logic but in case the letter is upcase
        result = $alphabet.index(letter.downcase) + key
        if result > 26
          $alphabet[result - 26].upcase
        else
          $alphabet[result].upcase
        end
      else
        letter
      end
    end

    string = new_arr.join("") # Joined together so it returns a string
  end
end
