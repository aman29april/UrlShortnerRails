class ShortUrl

  @@urls = {}
  BASE_URL = 'http://localhost:3002/'



  class << self
    def expand(code)
      @@urls[code]
    end

    def all
      @@urls
    end

    def destroy(code)
      @@urls.delete(code)
    end

    def short(url)
      clean_url = UrlSanitizer.sanitize(url)
      key = @@urls.key(clean_url) || create(clean_url)
    end

    def create(clean_url)
      key = generate_unique_key
      @@urls[key] = clean_url
      key
    end

    def generate_unique_key
      begin
        key = RandomGenerator.generate
      end while @@urls.key?(key)
      key
    end
  end

end
