require 'airport'
require 'plane'

describe Airport do
  let (:airport) { Airport.new(6) }
  let (:plane) 	 { Plane.new 			}

  before(:each) do
    allow(airport).to receive(:good_weather?).and_return true
  end

  context 'taking off and landing' do

    it 'a plane can land' do
    	expect(airport.land(plane)).to eq([plane])
    end
    
    it 'a plane can take off' do
    	expect(airport.take_off(plane)).to eq nil
    end
  end
  
  context 'traffic control' do

  	it 'knows if an airport is full' do
      fill_in(airport)
  		expect(airport.full?).to eq true
  	end

    it 'a plane cannot land if the airport is full' do
      fill_in(airport)
     	expect(airport.land(plane)).to eq "The aiport is full. Keep on flying."
    end
    
    context 'weather conditions' do

      before(:each) do
        allow(airport).to receive(:good_weather?).and_return false
      end
      it 'a plane cannot take off when there is a storm brewing' do
      	plane.land_on(airport)
	     	expect(airport.take_off(plane)).to eq "A storm is brewing. Please stay landed."
	     	expect(plane.status).to eq :landed
      end
      
      it 'a plane cannot land in the middle of a storm' do
	     	expect(airport.land(plane)).to eq "Plane cannot land in a storm. Please keep flying."
	     	expect(plane.status).to eq :flying
      end
    end
  end
end

def fill_in(airport)
    until airport.full?
      airport.land(Plane.new)
    end
  end

describe "The grand finale (last spec)" do
  it 'all planes can land' do
    allow(STDOUT).to receive(:puts)
    luton = Airport.new(100)
    fill_in(luton)
    expect(luton).to be_full
  end



  it 'all planes can take off' do
    allow(STDOUT).to receive(:puts)
    luton = Airport.new(100)
    fill_in(luton)
    expect(luton).to be_full
    luton.take_off_all_planes
    expect(luton.planes.count).to eq 0
  end
end


















