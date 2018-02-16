require 'ipify'

RSpec.describe Ipify do
  it "has a version number" do
    expect(Ipify::VERSION).not_to be nil
  end

  it "respond to ip" do
    expect(Ipify).to respond_to :ip
  end

  it "return my ip as text" do
    expect(Ipify.ip).to be_a String
  end

  it "return my ip as json" do
    expect(Ipify.ip(:json)).to be_a String
  end

  it "return my ip as jsonp" do
    expect(Ipify.ip(:jsonp)).to be_a String
  end
end
