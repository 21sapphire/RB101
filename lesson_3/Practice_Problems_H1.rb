#1

# nil

#2 {a => "hi there"}

#3

  #A  
  #   one is: "one"
  #   two is: "two"
  #   three is: "three"

  #B
  #   one is: "one"
  #   two is: "two"
  #   three is: "three"

  #C
  #   one is: "one"
  #   two is: "two"
  #   three is: "three"

#4

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    return false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
  end

  true
end