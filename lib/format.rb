module Figaro

  class Format

    def self.has_array_tick?(arg)
      arg[0] == 96 && arg[1] == 91
    end

    def self.slim_arg(arg)
      return unless arg.is_a?String

      arg[0] = '' if has_array_tick?arg
    end

  end

end