class String
  COLOR_MAP = { black: 30,
                red: 31,
                green: 32,
                yellow: 33,
                blue: 34,
                pink: 35,
                light_grey: 37,
                light_blue: 94,
                white: 97 }.freeze

  def self.colors
    COLOR_MAP.keys
  end

  def self.create_colors
    COLOR_MAP.each do |color, code|
      define_method(color.to_s) do
        "\e[#{code}m#{self}\e[0m"
      end
    end
  end

  def self.sample_colors
    COLOR_MAP.each_key do |color|
      puts "This is #{color.to_s.send color}"
    end
  end

  String.create_colors
end
