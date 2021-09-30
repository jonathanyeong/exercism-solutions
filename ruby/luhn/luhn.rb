class Luhn
  def self.valid?(card_number)
    return false if invalid?(card_number)
    normalized_card_num = normalize(card_number)
    offset = normalized_card_num.length % 2 == 0 ? 0 : 1
    sum = 0
    normalized_card_num.each_with_index do |c, index|
      if index % 2 == offset
        sum += doubled_num(c.to_i)
      else
        sum += c.to_i
      end
    end
    sum % 10 == 0
  end

  def self.normalize(input)
    input.gsub(" ", "").split("")
  end

  def self.invalid?(input)
    input.gsub(" ", "").length <= 1 || !input.gsub(" ", "").match(/\D/).nil?
  end

  def self.doubled_num(num)
    doubled = num * 2
    doubled > 9 ? doubled - 9 : doubled
  end
end