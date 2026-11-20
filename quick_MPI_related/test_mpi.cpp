#include <stdio.h>
#include <mpi.h>

int main(int argc, char** argv){
  int proc_rank;
  MPI_Init(&argc, &argv);

  MPI_Comm_rank(MPI_COMM_WORLD, &proc_rank);
  printf("rank: %d \n",proc_rank); 
  
  MPI_Finalize();
};
