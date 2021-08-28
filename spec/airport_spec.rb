require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to be_kind_of(described_class) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "has a default capacity" do
    5.times {subject.land Plane.new}
    expect(subject.length).to eq(described_class::DEFAULT_CAPACITY)
  end

  describe '#landing plane' do
    it 'should receive a landing plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq([plane])
    end
    it 'raises an error if no space available' do
      5.times { subject.land Plane.new }
      expect {subject.land(Plane.new)}.to raise_error('Airport is full')
    end
  end

  it 'should instruct plane to take off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject).to eq(subject)
  end
end
