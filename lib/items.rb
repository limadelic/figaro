module Figaro

  class Items

    def self.are(items)
      @@items = items
    end

    def query
      @@items.map {|x| [["key", x.key]]}
    end

  end

end