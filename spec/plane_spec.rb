require 'plane'

describe Plane do

	let(:plane) { Plane.new }
  let(:grounded_plane) { plane.land! }
  let(:airport) {double :airport}
  
  it 'has a flying status when created' do
  	expect(plane).to be_flying
  end

  it 'can land' do
    plane.land!
    expect(plane).to_not be_flying
  end

  it 'can take off' do
    plane.land!
    expect(plane.take_off!).to be_flying
  end

  it 'can land on an airport' do
    expect(airport).to receive(:clear_for_landing).with(plane)
    plane.land_on(airport)
  end

  it 'can take off from an airport' do
    expect(airport).to receive(:clear_for_take_off).with(plane)
    plane.take_off_from(airport) 
  end

end