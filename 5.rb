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

  def base_power
    strength + cleverness
  end

  def power_against(_enemy)
    NotImplementedError
  end

  def fight(enemy)
    power_against(enemy) <=> enemy.power_against(self)
  end
end

class Fighter < Person
  def strength
    @strength * 1.5
  end

  attr_reader :cleverness

  def power_against(enemy)
    if enemy.class == Wizard
      strength * 0.85 + cleverness * 1.0
    else
      base_power
    end
  end
end

class Wizard < Person
  def strength
    @strength * 0.5
  end

  def cleverness
    @cleverness * 3.0
  end

  def power_against(enemy)
    if enemy.class === Wizard
      strength * 1.0 + cleverness * 0.75
    else
      base_power
    end
  end
end

class Priest < Person
  def strength
    @strength * 1.0
  end

  def cleverness
    @cleverness * 2.0
  end

  def power_against(enemy)
    if enemy.class == Fighter
      strength * 0.95 + cleverness * 0.9
    else
      base_power
    end
  end
end

class PersonView
  def initialize(person)
    @person = person
  end

  def fight_result(enemy)
    case @person.fight(enemy)
    when 1
      "#{@person.class}は#{enemy.class}に勝利した"
    when 0
      "#{@person.class}は#{enemy.class}と引き分けた"
    when -1
      "#{@person.class}は#{enemy.class}に敗北した"
    end
  end

  def statuses(enemy)
    "#{@person.class}: #{@person.power_against(enemy)}\n#{enemy.class}: #{enemy.power_against(@person)}"
  end
end
