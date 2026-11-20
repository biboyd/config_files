from mpi4py import MPI

#print("comm")
comm = MPI.COMM_WORLD

#print("proc")
name=MPI.Get_processor_name()

if comm.rank == 0:
    print(f"name: {name}.   and my rank is {comm.rank}. This is sometimes called the root")
else:
    print(f"name: {name}.   and my rank is {comm.rank}")
