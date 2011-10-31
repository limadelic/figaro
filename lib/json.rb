require 'rubygems'
require 'json/ext'
require 'hashie/mash'
require 'format'

module Figaro

  class Json

    attr_reader :sut

    def initialize(content)
      @sut = JSON.parse content
      @sut = Hashie::Mash.new @sut
      rescue
    end

    def json
      @sut.to_json
    end

    def set_to(field, value)
      eval "@sut#{field}=\"#{value}\""
    end

    def get(field)
      eval "@sut#{field}.to_s"
    end

  end

end