require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
  let(:docking_station) { double :docking_station }

  it 'bike not working if reported' do
    subject.report
    expect(subject.working?).to eq false
  end

  it 'if not reported sets bike to working' do
    allow(docking_station).to receive(:dock)
    docking_station.dock(subject)
    expect(subject.working?).to eq true
  end
end
