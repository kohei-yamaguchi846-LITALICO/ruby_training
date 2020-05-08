# frozen_string_literal: true

class Person
  attr_reader :strength
  attr_reader :cleverness

  def initialize(strength, cleverness)
    @strength   = strength
    @cleverness = cleverness
  end

  def base_strength
    @strength
  end

  def base_cleverness
    @cleverness
  end
end

class Fighter < Person
  def strength
    @strength * 1.5
  end

  attr_reader :cleverness
end

class Wizard < Person
  def strength
    @strength * 0.5
  end

  def cleverness
    @cleverness * 3.0
  end
end

f = Fighter.new(10, 10)
puts f.strength      # => 15.0
puts f.base_strength # => 10

w = Wizard.new(10, 10)
puts w.cleverness      # => 30.0
puts w.base_cleverness # => 10
