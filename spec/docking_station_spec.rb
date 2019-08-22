require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)

      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  
  it { is_expected.to respond_to(:bike) }

  describe '#dock' do

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'raises an error when there is a bike already in the docking station' do
      bike = Bike.new
      another_bike = Bike.new
      station = DockingStation.new
      station.dock(bike)
      expect { station.dock(another_bike) }.to raise_error 'Station Full!'
    end

  end

end
