require 'rspec'
require './teacher'

describe 'Test for teacher class methods' do
  describe 'Initializing teacher' do
    it 'Should create teachers with no problems' do
      teacher1 = Teacher.new(32, 'Physics', 'Nahom')
      expect(teacher1.age).to eq(32)
      expect(teacher1.name).to eq('Nahom')
      expect(teacher1.instance_variable_get(:@parent_permission)).to be true
      expect(teacher1.instance_variable_get(:@specialization)).to eq('Physics')
    end
  end

  describe 'test teacher can_use_services?' do
    it 'should be always true' do
      teacher2 = Teacher.new(45, 'Compenet Design', 'Just')
      expect(teacher2.can_use_services?).to be true
    end
  end
end
