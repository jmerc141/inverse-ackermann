# Inverse Ackermann python
import sys, time
from numba import njit, types

@njit(types.uint64(types.uint64), cache=True)
def i_ack(n):
    if n<=4:
        return n

    a=i_ack(n-1)
    b=i_ack(n-2)

    return a+b    
    
if __name__=='__main__':
    if len(sys.argv) == 2:
        m = int(sys.argv[1])
        
        print(i_ack(m))