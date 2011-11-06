require "rubygems"

module Figaro

  def wait(duration)
    sleep duration.to_i
  end

  def echo(echo)
    echo
  end

  def gem(gem)
    eval "require '#{gem}'"
  end

end