require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "Default capacty is set to the argument that the user enters" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do

      it 'has a variable capacity' do
        docking_station = DockingStation.new(50)
        50.times { docking_station.dock Bike.new }
        expect{ docking_station.dock Bike.new }.to raise_error 'Docking Station Full!'
      end
      
  end

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
  
  describe '#dock' do

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq "You have docked your bike"
    end

    it 'raises an error when station is full' do
      docking_station = DockingStation.new
      subject.capacity.times { docking_station.dock Bike.new }
      bike = Bike.new
      expect { docking_station.dock(bike) }.to raise_error 'Docking Station Full!'
    end

  end

end
