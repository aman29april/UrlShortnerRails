module UrlSanitizer

  VALID_URL = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/

  InvalidUrl = Class.new(StandardError)
  
  def self.sanitize(url)
    return raise InvalidUrl unless VALID_URL.match(url)
    url = url.to_s.strip.downcase.gsub(/(https?:\/\/)|(www\.)/, '')
    'http://' + URI.parse(url).normalize.to_s
  end
end
