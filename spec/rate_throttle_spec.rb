require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RateThrottle" do
  it "calc_sleep_time" do 
    RateThrottle.calc_sleep_time(0.1, 1.0).should == 9.0
    RateThrottle.calc_sleep_time(0.2, 1.0).should == 4.0
    RateThrottle.calc_sleep_time(0.5, 1.0).should == 1.0
    RateThrottle.calc_sleep_time(1.0, 1.0).should == 0.0
  end
end
