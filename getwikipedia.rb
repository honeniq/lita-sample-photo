require 'wikipedia' 
require 'pry'
require 'pebbles/suddenly_death_string'

Wikipedia.Configure {
  domain 'ja.wikipedia.org'
  #domain 'en.wikipedia.org'
  path   'w/api.php'
}

module Lita
  module Handlers
    class WikiPhoto < Handler
      route /^photo\s+(\S.*)+/, :getwikiphoto

      def getwikiphoto(response)
        word = response.matches[0][0]
        page = Wikipedia.find(word)
        urls = page.image_urls
        #binding.pry
        if urls.empty?
          response.reply '画像ないです'.to_suddenly_death
        else
          response.reply urls.sample 
        end
      end
    end
    Lita.register_handler(WikiPhoto)
  end
end
