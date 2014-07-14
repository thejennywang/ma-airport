require 'weather'

describe Weather do

	it 'is either sunny or stormy' do
		allow(weather).to receive(:check).and_return { "sunny" }
		allow(weather).to receive(:check).and_return { "stormy" }
	end

end