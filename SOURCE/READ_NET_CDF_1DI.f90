!======================================================================!
SUBROUTINE READ_NET_CDF_1DI (data_out,var_id,N)
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
! Read a 1D netCDF file variable.
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
USE MPI    ! Enable access to the Message Passing Interface library of
           ! parallel routines.
USE NETCDF ! Enable access to the library of netCDF routines.
USE SHARED ! Shared variables.
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
IMPLICIT NONE
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
INTEGER, INTENT ( IN) :: var_id,N
INTEGER, INTENT (OUT) :: data_out (N)
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
INTEGER :: ncid ! netCDF ID.
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
! Open existing netCDF dataset for access.
! NF90_NOWRITE specifies open with read-only access.
!----------------------------------------------------------------------!
CALL CHECK (NF90_OPEN (TRIM(file_name), NF90_NOWRITE, ncid))
!----------------------------------------------------------------------!
CALL CHECK (NF90_GET_VAR (ncid,var_id,data_out))
CALL CHECK (NF90_CLOSE (ncid))
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
CONTAINS
  SUBROUTINE CHECK (status)
    INTEGER, INTENT (IN) :: status

    IF (status /= nf90_noerr) THEN
      PRINT *, TRIM (nf90_strerror(status))
      STOP "Stopped"
    END IF
  END SUBROUTINE CHECK
!----------------------------------------------------------------------!

!----------------------------------------------------------------------!
END SUBROUTINE READ_NET_CDF_1DI
!======================================================================!

