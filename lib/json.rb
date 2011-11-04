require 'rubygems'
require 'json/ext'
require 'hashie/mash'
require "format"
require "figaro"

module Figaro

  class Json

    include Figaro

    attr_reader :sut

    def initialize(content, entity='Item')
      Format.slim_arg content
      load content
    rescue
      load "{\"#{entity}\":#{content}}"
    end

    def load(content)
      @sut = JSON.parse content
      @sut = Hashie::Mash.new @sut
    end

    def json
      @sut.to_json
    end

    def set_to(field, value)
      eval "@sut.#{field}=\"#{value}\""
    end

    def get(field)
      eval "@sut.#{field}.to_s"
    end

  end

end