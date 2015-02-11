class Array
  def self.comprehend(*ls)
    if ls.length >= 1
      l0 = ls[0]
      len = l0.length
      ls[1..-1].each do |nl|
        if len != nl.length
          raise ArgumentError.new("Lengths are unequal")
        end
      end
      
      # full set of args
      fargs = []

      len.times do |ind|
        # args at this step
        args = []
        ls.each do |nl|
          args << nl[ind]
        end
        
        if block_given?
          fargs << yield(*args)
        else
          fargs << args
        end
      end

      fargs
    else
      []
    end
  end
end

