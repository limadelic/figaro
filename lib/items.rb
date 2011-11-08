module Figaro

  class Items

    def self.fields=(fields)
      @@fields = fields.split(',').map do |field|
        split_name_display field.strip
      end
    end

    def self.split_name_display(field)

      name_display = field.split ' as '

      field = name_display[0]
      display = name_display.count == 2 ?
        name_display[1] : field

      {
        :name => field,
        :display => display
      }
    end

    def self.values=(values)
      puts "#{values.class}"
      @@items = values
    end

    def query
      @@items.map do |item|
        @@fields.map do |field|
          [field[:display], item.instance_eval(field[:name])]
        end
      end
    end

=begin
    def index(index)
      @index = index
    end

    def method_missing(symbol, *args, &blk)
      @sut = eval "@vars['#{symbol}']#{args.first}"
    end

    def respond_to?(symbol, include_private=false)
      super || has_field?("#{symbol}")
    end

    def has_field?(display)
      @@fields.any? { |x| x[:display] == display }
    end

    def field(display)
      @@fields.find { |x| x[:display] == display }
    end
=end

  end

end