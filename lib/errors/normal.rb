module Errors
  class Normal < StandardError
    def initialize(msg=nil)
      super
    end
  end
end
