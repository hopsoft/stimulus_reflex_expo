# frozen_string_literal: true

class SnakeReflex < ApplicationReflex
  DIRECTIONS = {37 => "left", 38 => "up", 39 => "right", 40 => "down"}

  def turn(code)
    if DIRECTIONS.key?(code)
      if (["left", "right"].include?(session[:direction]) && ["up", "down"].include?(DIRECTIONS[code])) || (["up", "down"].include?(session[:direction]) && ["left", "right"].include?(DIRECTIONS[code]))
        session[:direction] = DIRECTIONS[code]
      end
    end
  end

  def start_stop
    session[:clock] = session[:clock] ? !session[:clock] : true
    wait_for_it(:tick) do
      hatch if session[:snake].empty?
      sprout if session[:food].empty?
      []
    end
  end

  def tick
    if session[:clock] && session[:alive]
      wait_for_it(:tick) do
        sleep session[:speed]
        eat
        move
        eat
        session[:alive] = survive?
        []
      end
    else
      session[:clock] = false
    end
  end

  def stop
    session[:clock] = false
  end

  def sprout
    session[:food] = []
    session[:food] << rand(0...session[:grid_x]) * 10
    session[:food] << rand(0...session[:grid_y]) * 10
  end

  def hatch
    session[:length].times do |i|
      session[:snake] << [session[:start_x] + (10 * i), session[:start_y]]
    end
  end

  def eat
    if session[:snake].last == session[:food]
      session[:snake] << session[:food]
      session[:speed] -= 0.01 if session[:speed] > 0.05
      sprout
    end
  end

  def move
    x, y = session[:snake].last
    case session[:direction]
    when "left"
      x -= 10
    when "up"
      y -= 10
    when "right"
      x += 10
    when "down"
      y += 10
    end
    session[:snake].shift
    session[:snake] << [x, y]
  end

  def survive?
    x, y = session[:snake].last
    return false if x < 0 || y < 0 || x > session[:grid_x] * 10 - 10 || y > session[:grid_y] * 10 - 10
    return false if session[:snake][0..-3].include? [x, y]
    true
  end

  private

  def wait_for_it(target)
    return unless respond_to? target
    if block_given?
      Thread.new do
        channel.receive({
          "target" => "#{self.class}##{target}",
          "args" => yield,
          "url" => url,
          "attrs" => element.attributes.to_h,
          "selectors" => selectors
        })
      end
    end
  end
end
