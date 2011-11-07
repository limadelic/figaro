require "figaro"
require "items"

module Figaro

  class Do

    include Figaro

    attr_reader :sut

    def initialize
      @vars = {}
    end

    def set_to(sut, expr)
      @sut = @vars[sut] = eval(expr)
    end

    def method_missing(symbol, *args, &blk)
      @sut = eval "@vars['#{symbol}']#{args.first}"
    end

    def respond_to?(symbol, include_private=false)
      super || @vars.include?("#{symbol}")
    end
  end

end