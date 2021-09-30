class ResistorColorDuo
  class ResistorError < StandardError; end

  RESISTORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"].freeze

  def self.value(resistor_bands)
    resistance = 0
    resistor_bands.slice(0,2).each_with_index do |resistor, index|
      pos = RESISTORS.find_index(resistor)
      raise ResistorColorDuo::ResistorError, "Resistor #{resistor} not found!" if pos.nil?

      index == 0 ? resistance = pos * 10 : resistance += pos
    end
    resistance
  end
end