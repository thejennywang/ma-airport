require 'plane'

describe Plane do

	let(:plane) { Plane.new }
  let(:airport) {double :airport}
  
  it 'has a flying status when created' do
  	expect(plane.status).to eq :flying
  end

  it 'can take off' do
    plane.take_off_from(airport)
    expect(plane.status).to eq :flying
  end

  it 'can land' do
    allow(airport).to receive(:land)
    plane.land_on(airport)
    expect(plane.status).to eq :landed
  end

  it 'cannot take off when already flying' do
    plane.take_off_from(airport)
    expect(plane.take_off_from(airport)).to eq "You cannot take off when already flying."
  end

  it 'cannot land when already landed' do
    allow(airport).to receive(:land)
    plane.land_on(airport)
    expect(plane.land_on(airport)).to eq "You cannot land when you're already landed."
  end

end