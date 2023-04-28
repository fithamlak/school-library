require 'rspec'
require './classroom'

describe Classroom do
  let(:student) { double('Student', classroom: nil) }

  before do
    allow(student).to receive(:classroom=)
  end

  describe '#initialize' do
    it 'It should create a new classroom with the given label' do
      classroom = described_class.new('D label')

      expect(classroom.label).to eq('D label')
    end

    it 'it should initialize the students array as empty' do
      classroom = described_class.new('D label')

      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'it Should add the student to the students array' do
      classroom = described_class.new('D label')

      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end

    it 'It should set the student classroom to self' do
      classroom = described_class.new('D label')

      expect(student).to receive(:classroom=).with(classroom)

      classroom.add_student(student)
    end
  end
end
