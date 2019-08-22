require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)

      expect(subject.release_bike).to eq "Here is a bike"
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  
  it { is_expected.to respond_to(:bike_array) }

  describe '#dock' do

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq "You have docked your bike"
    end

    it 'raises an error when station is full' do
      docking_station = DockingStation.new
      20.times { docking_station.dock Bike.new }
      bike = Bike.new
      expect { docking_station.dock(bike) }.to raise_error 'Station Full!'
    end

  end

end
