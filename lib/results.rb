module Figaro

  class Results

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
      @@items = values
    end

    def query
      @@items.map do |item|
        @@fields.map do |field|
          [field[:display], item.instance_eval(field[:name])]
        end
      end
    end

  end

end