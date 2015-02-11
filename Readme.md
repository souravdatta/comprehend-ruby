Array::comprehend
=======================================

This gem adds a class method to Array called `comprehend` which takes a number of lists of same length and a block. The block must accept same number of parameters as that of arguments passed to comprehend. The method will pass a tuple of n-th elements of the lists to the block and will combine the results returned from the block.


    require 'comprehend'
    a1 = (1..10).to_a.select {|x| x % 2 == 0}
    b1 = (1..10).to_a.select {|x| x % 2 != 0}
    Array::comprehend(a1, b1) {|x, y| x + y} # => [3, 7, 11, 15, 19]


That's it, cheers!
