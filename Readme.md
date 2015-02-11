Array::comprehend
=======================================

This gem adds a class method to Array called `comprehend` which takes a number of lists of same length and a block. The block must accept same number of parameters as that of arguments passed to comprehend. The method will pass a tuple of n-th elements of the lists to the block and will combine the results returned from the block.


    require 'comprehend'
    a1 = (1..10).to_a.select {|x| x % 2 == 0}
    b1 = (1..10).to_a.select {|x| x % 2 != 0}
    Array::comprehend(a1, b1) {|x, y| x + y} # => [3, 7, 11, 15, 19]

Well, Enumerable#zip also does that, right? Yes, of course. The only difference is, this one a bit more functional in nature and easy to use when the number of lists to iterate grows. Say we have 5 lists like below:

	a1 = (1..10).select {|x| x.even?}
	b1 = (1..10).select {|x| x.odd?}
	c1 = (11..15).to_a
	d1 = (16..20).to_a

To get an array of the sums of the elements (i.e. [30, 36, 42, 48, 54]) using zip, we would do like:
	
	sums = []
	a1.zip(b1, c1, d1) {|arr| sums << (arr[0] + arr[1] + arr[2] + arr[3])}		
	sums			# => [30, 36, 42, 48, 54]

But with comprehend, it's a one liner:

	require 'comprehend'
	Array.comprehend(a1, b1, c1, d1) {|p, q, r, s| p + q + r + s}	# => [30, 36, 42, 48, 54]

That's it, cheers!
