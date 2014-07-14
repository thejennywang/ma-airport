require 'airport'
require 'plane'

describe Airport do
  let (:airport) { Airport.new(6) }
  let (:plane) 	 { Plane.new 			}
  let (:weather) { double :weather }
  
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
  		airport.capacity.times {airport.land(plane)}
  		expect(airport.full?).to eq true
  	end

    it 'a plane cannot land if the airport is full' do
    	airport.capacity.times {airport.land(plane)}
     	expect(lambda{airport.land(plane)}).to raise_error(RuntimeError) 
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
      	plane.land
      	airport.weather = "stormy"
	     	expect(lambda{airport.take_off(plane)}).to raise_error(RuntimeError)
	     	expect(plane.status).to eq "landed"
      end
      
      it 'a plane cannot land in the middle of a storm' do
      	airport.weather = "stormy"
	     	expect(lambda{airport.land(plane)}).to raise_error(RuntimeError)
	     	expect(plane.status).to eq "flying"
      end
    end
  end
end