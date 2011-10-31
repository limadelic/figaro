require 'rubygems'
require 'rest-client'

module Figaro

  class Request

    attr_reader :sut

    def initialize(url)
      @url = url
      @options = {}
    end

    def headers
      @options[:headers] ||= {}
      @current_option = '[:headers]'
    end

    def method_missing(method_name, *args, &blk)
      value = "#{args.first}".gsub("\"", "\\\"")
      puts "#{value}"
      eval "@options#{@current_option}[:#{method_name}]=\"#{value}\""
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

    def post(resource)
      @sut = client[resource].post ''
    end

    def put_in(content, resource)
      @sut = client[resource].put content
    end

  end

end