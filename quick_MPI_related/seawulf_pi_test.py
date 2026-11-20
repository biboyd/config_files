import numpy as np
from mpi4py import MPI
import time



def main():
    comm = MPI.COMM_WORLD
    if comm.rank == 0.:
        start = time.time()

    nproc = comm.size

    # num points to use in our sum
    NPTS=1000000
    pi = np.array(0.)

    # range to look over for each proc
    istart = int(1 + NPTS * ( comm.rank / nproc ))
    iend = int(NPTS * ( (comm.rank + 1) / nproc ))

    print("rank", comm.rank, "working on ", istart, "to", iend)
    total = np.array(0.)
    for i in range(istart, iend):
        total+= 0.5/( (i-0.75) * (i-0.25) )
        
    comm.Reduce([total, MPI.DOUBLE], [pi, MPI.DOUBLE], op=MPI.SUM)    

    if comm.rank == 0:
        end = time.time()
        diff = np.abs(np.pi - pi)/np.pi * 100
        print(f"pi: {pi}")
        print(f"This is {diff:0.2e} % accurate")
        print(f"time of calculation: {end - start} s")

    comm.Barrier()

if __name__ == '__main__':
    main()
