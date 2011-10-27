require 'rubygems'
require 'json/ext'
require 'hashie/mash'

module Figaro

  class Json

    attr_reader :sut

    def initialize(content)
      @sut = Hashie::Mash.new JSON.parse(content)
    end

    def json
      @sut.to_json
    end

    def set_to(field, value)
      eval "@sut.#{field}=\"#{value}\""
    end

    def get(field)
      eval "@sut.#{field}"
    end

  end

end