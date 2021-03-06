require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:airport)           { Airport.new                                     }
  let(:plane)             { double :plane, land!: :plane, take_off!: :planes}
  let(:extra_plane)       { double :plane                                   }  
  let(:airport_with_plane){ Airport.new([plane])                            }                           

  it 'starts off with no planes' do
    expect(airport).not_to have_planes
  end

  it 'can have planes' do
    airport = Airport.new([:plane])
    expect(airport).to have_planes
  end

  context 'taking off and landing' do

    before(:each) do
        allow(airport).to receive(:stormy?).and_return false
    end

    it 'can clear a plane for landing' do
      expect(plane).to receive(:land!)
      airport.clear_for_landing(plane)
    end

    it 'has planes after a plane landed' do
      allow(plane).to receive(:land!).and_return(plane)
      airport.clear_for_landing(plane)
      expect(airport).to have_planes
    end

    it 'can clear a plane for take off' do
      expect(plane).to receive(:take_off!)
      airport.clear_for_take_off(plane)
    end

    it 'has no planes after a plane took off' do
      allow(airport_with_plane).to receive(:stormy?).and_return false
      allow(plane).to receive(:take_off!).and_return(plane)
      airport_with_plane.clear_for_take_off(plane)
      expect(airport_with_plane).not_to have_planes
    end
  end

  context 'traffic control' do

    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
    end

    it 'knows when an airport is full' do
      (airport.capacity).times{airport.clear_for_landing(plane)}
      expect(airport.full?).to eq true
    end

    it 'returns an error if the airport is full' do
      (airport.capacity).times{airport.clear_for_landing(plane)}
      expect(airport.clear_for_landing(extra_plane)).to eq "The airport is full. Keep on flying."
    end

  end
  
  context 'weather conditions' do

    before(:each) do
        allow(airport).to receive(:stormy?).and_return true
    end

    it 'stops a plane from taking off when a storm is brewing' do
      airport.clear_for_landing(plane)
      expect(airport.clear_for_take_off(plane)).to eq "A storm is brewing. Please stay landed."
    end

    it 'stops a plane from landing when a storm is brewing' do
      flying_plane = double :plane, flying?: true, take_off!: true
      expect(airport.clear_for_landing(plane)).to eq "A storm is brewing. Please keep flying."
    end
  end

end

describe "The grand finale (last spec)" do

  let (:plane) { double :plane, land!: :plane, take_off!: :plane}

  it 'all planes can land' do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    flying_planes = [plane1, plane2]

    airport.land_all(flying_planes)

    expect(airport.planes).to eq [plane1, plane2]
  end

end