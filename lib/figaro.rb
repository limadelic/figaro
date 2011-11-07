require "rubygems"
require "items"

module Figaro

  def the(value) value end
  def to(value) the value end
  def echo(value) the value end

  def gem(gem)
    eval "require '#{gem}'"
  end

  def select_from(fields, query)
    Items.fields = fields
    Items.values = eval query
  end

  def wait(duration)
    sleep duration.to_i
  end

end