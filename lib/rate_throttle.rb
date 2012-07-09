
# Example
#   # throttling 10% workload.
#   10000.times do 
#     RateThrottle.throttle(0.1) do
#       # do something
#     end
#   end
#
module RateThrottle
  def self.throttle(rate, &block)
    start = Time.now
    block.call
    sleep_time = self.calc_sleep_time(rate, Time.now - start)
    sleep(sleep_time)
  end

  def self.calc_sleep_time(rate, time)
    if time > 0.0
      return time * ( 1- rate ) / rate
    else
      return 0
    end
  end
end
