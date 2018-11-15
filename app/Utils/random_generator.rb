module RandomGenerator

  KEY_CHARS = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten.freeze
  SIZE = 6

  def self.generate
    SIZE.times.map { KEY_CHARS.sample }.join
  end

end
