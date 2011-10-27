require 'rubygems'
require 'rest-client'

module Figaro

  class Request

    attr_reader :sut

    def initialize(url)
      @url = url
      @options = { :headers => {} }
    end

    def options
      @current_option = ''
    end

    def headers
      @current_option = '[:headers]'
    end

    def method_missing(method_name, *args, &blk)
      eval "@options#{@current_option}[:#{method_name}]=\"#{args.first}\""
    end

    def respond_to?(method_name, include_private=false)
      super || @sut.nil?
    end

    def client
      RestClient::Resource.new @url, @options
    end

    def get(resource)
      @sut = client[resource].get
    end

    def post_to(content, resource)
      @sut = client[resource].post content
    end

    def put_in(content, resource)
      @sut = client[resource].put content
    end

  end

end