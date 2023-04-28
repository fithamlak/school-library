require 'rspec'
require './person'

describe Person do
  describe '#initialize' do
    it 'Test to create a new person with the given age and name' do
      person = Person.new(23, 'Justice')
      expect(person.age).to eq(23)
      expect(person.name).to eq('Justice')
    end

    it 'sets the parent_permission attribute to true by default' do
      person = Person.new(23, 'Justice')
      expect(person.instance_variable_get(:@parent_permission)).to be true
    end
  end

  describe '.all' do
    before(:each) do
      Person.class_variable_set(:@@all, [])
    end

    it 'gets an array of all people' do
      person1 = Person.new(23, 'Justice')
      person2 = Person.new(20, 'Jman')
      expect(Person.all).to eq([person1, person2])
    end
  end

  describe '.find_by_id' do
    before(:each) do
      Person.class_variable_set(:@@all, [])
    end

    it 'get the person with the given id' do
      person1 = Person.new(23, 'Justice')
      expect(Person.find_by_id(person1.id)).to eq(person1)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(23, 'Justice')
      expect(person.can_use_services?).to be true
    end

    it 'gives true if the person has parent permission' do
      person = Person.new(15, 'Dad', parent_permission: true)
      expect(person.can_use_services?).to be true
    end

    it 'returns false if the person is not of age and does not have parent permission' do
      person = Person.new(15, 'Dad', parent_permission: false)
      expect(person.can_use_services?).to be false
    end
  end
end
