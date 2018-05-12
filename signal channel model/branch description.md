# Short version of delay & ftn

In previous versions, the delay function made the input array bigger and stored all the initial information, resulting in no data loss.
However, this implementation meant that vectors could get very big, especially since in the implementation of ftn the matrix would have
had the size `64 x 127976*2`. An array of that size cannot be stored.  
In this version, the delay function simply cuts out the parts that have been shifted further than the end of the vector. This in turn 
leads to a very high number of row vectors that are filled with zeros in the ftn implementation. This version runs, but is far from ideal.
