require 'plane'

describe Plane do

	let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
  	expect(plane.status).to eq "flying"
  end

  it 'can take off' do
    plane.take_off
    expect(plane.status).to eq "flying"
  end

  it 'can land' do
    plane.land
    expect(plane.status).to eq "landed"
  end

end