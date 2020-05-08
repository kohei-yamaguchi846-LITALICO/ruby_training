# frozen_string_literal: true

require_relative './5.rb'

f = Fighter.new(20, 9.5)
w = Wizard.new(10, 10)
person_view = PersonView.new(f)
puts person_view.statuses(w)
puts person_view.fight_result(w)
