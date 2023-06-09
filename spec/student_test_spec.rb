require 'rspec'
require './student'

describe Student do
  describe 'initialize class' do
    it 'it shuold create new students' do
      student1 = Student.new(20, 'Physics')
      expect(student1.age).to eq(20)
      expect(student1.classroom).to eq('Physics')
      expect(student1.name).to eq('Unknown')
      expect(student1.instance_variable_get(:@parent_permission)).to be true
    end
  end

  describe 'classroom method' do
    it 'adding a student to a new classroom' do
      classroom1 = instance_double('Classroom', students: [])
      student2 = Student.new(15, 'Physics', 'Justice')
      student2.classroom = classroom1
      expect(classroom1.students).to include(student2)
    end
  end

  describe 'testing play hooky method' do
    it 'should return "¯\(ツ)/¯" ' do
      student3 = Student.new(12, 'Physics')
      expect(student3.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
