class ShortUrl

  # class variable to store urls and unique key
  @@urls = {}
  BASE_URL = 'http://localhost:3002/'

  # class methods
  class << self
    # return url from key
    def expand(code)
      @@urls[code]
    end

    # return all urls
    def all
      @@urls
    end

    # destroy a particual key and corresponding url
    def destroy(code)
      @@urls.delete(code)
    end

    # converts url into unique code
    def short(url)
      clean_url = UrlSanitizer.sanitize(url)
      key = @@urls.key(clean_url) || create(clean_url)
    end

    # generte unique code for url
    def create(clean_url)
      key = generate_unique_key
      @@urls[key] = clean_url
      key
    end

    # generate unique key
    def generate_unique_key
      begin
        key = RandomGenerator.generate
      end while @@urls.key?(key)
      key
    end
  end

end
