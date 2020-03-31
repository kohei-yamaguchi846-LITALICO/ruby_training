require 'minitest/autorun'
require_relative '../5.rb'

class PersonTest < Minitest::Test
  describe 'instance methods' do
    before do
      @fighter = Fighter.new(10, 10)
      @wizard = Wizard.new(10, 10)
    end

    describe 'fight' do
      it 'FighterはWizardに負ける' do
        _(@fighter.fight(@wizard)).must_equal -1
      end

      it 'WizardはFighterに勝利する' do
        _(@wizard.fight(@fighter)).must_equal 1
      end

      it 'WizardとFighterは引き分ける' do
        @fighter.stub(:power_against, 10) do
          @wizard.stub(:power_against, 10) do
            _(@wizard.fight(@fighter)).must_equal 0
          end
        end
      end
    end
  end
end

class FighterTest < Minitest::Test
  describe 'instance methods' do
    before do
      @fighter = Fighter.new(10, 10)
      @wizard = Wizard.new(10, 10)
    end

    describe 'strength' do
      it do
        _(@fighter.strength).must_equal 15
      end
    end

    describe 'cleverness' do
      it do
        _(@fighter.cleverness).must_equal 10
      end
    end

    describe 'power_against' do
      it 'Wizard以外が相手の場合' do
        _(@fighter.power_against(@fighter)).must_equal @fighter.base_power
      end

      it 'Wizardが相手の場合' do
        _(@fighter.power_against(@wizard)).must_equal 22.75
      end
    end
  end
end

class PriestTest < Minitest::Test
  describe 'instance methods' do
    before do
      @priest = Priest.new(10, 10)
      @wizard = Wizard.new(10, 10)
    end

    describe 'strength' do
    end

    describe 'cleverness' do
    end

    describe 'power_against' do
    end
  end
end

class WizardTest < Minitest::Test
  describe 'instance methods' do
    describe 'strength' do
    end

    describe 'cleverness' do
    end

    describe 'power_against' do
    end
  end
end
