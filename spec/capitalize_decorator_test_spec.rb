require './capitalize_decorator'
require 'rspec'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'take name') }
  subject { described_class.new(nameable) }

  describe 'Check for the Capitalize decorator' do
    it 'should return the correct name of the nameable object in uppercase' do
      expect(subject.correct_name).to eq('TAKE NAME')
    end
  end
end
