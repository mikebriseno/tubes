#!/usr/bin/env ruby

require 'rubygems'
require 'tubes'

class NumbersTask < Tube
  def run
    (1..10).map do |i|
      puts i
      sleep 0.5
    end
  end
end

class LettersTask < Tube
  def run
    ('A'..'J').map do |char|
      puts char
      sleep 0.5
    end
  end
end


class Tasks < Tube
  def run
    parallel do
      invoke NumbersTask
      invoke LettersTask
    end      
  end
end


if __FILE__ == $0
  tube = Tasks.new
  tube.run
end

