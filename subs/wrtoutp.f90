SUBROUTINE wrtoutp(foutp,translib,tdblab)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE wrtoutp                                                 !
!                                                                      !
! PURPOSE:                                                             !
! Write FORTRAN 90 code to link TUV photolysis IDs to photolysis IDs   !
! used in DSMACC.                                                      !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
! INCLUDES:                                                            !
! • params with array sizes.                                           !
!                                                                      !
!                                                                      !
! VARIABLES:                                                           !
!                                                                      !
! I/O:                                                                 !
! • fmech:      Path + name of output (f90) file                       !
! • translib:   Database with DSMACC photolysis IDs and associated TUV !
!               photolysis IDs and switch for TUV reaction treatment   !
! • tdblab:     TUV labels associated with DSMACC photolysis IDs       !
!                                                                      !
! internal:                                                            !
! • nj:         ID for photoreactions used in DSMACC                   !
!               read from temporary file                               !
! • n:          counter for loops                                      !
! • ierr:       index for read error treatment                         !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Modules:
! ========
USE params


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
! Variable declarations:                                               !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

  IMPLICIT NONE

! I/O:
  CHARACTER(flen), INTENT(IN)   :: foutp
  INTEGER, INTENT(IN)           :: translib(np,3)
  CHARACTER(llab), INTENT(IN)   :: tdblab(np)

! internal:
  INTEGER          :: n,ierr
  INTEGER          :: nj



  OPEN(15,FILE=foutp,STATUS='UNKNOWN')
  REWIND(16)

! Link first reaction
  READ(16,*,IOSTAT=ierr) nj
  IF(ierr<0) THEN
    STOP "Mechanism has no photolysis reactions."
   ELSEIF(ierr>0) THEN
    STOP "Read error in temporary file 'sortj.tmp'!"
  ENDIF
  DO n = 1, nrxn
    IF(nj==translib(n,1)) THEN
      IF(translib(n,3)==0) THEN
        WRITE(*,'(A)') "WARNING! TUV reaction flag set to FALSE for:"
        WRITE(*,104) "J(",translib(n,1),") [J(",translib(n,2),") in TUV]"
      ENDIF
      WRITE(15,101) translib(n,2)
      WRITE(15,103) translib(n,1),trim(tdblab(n))
    ENDIF
  ENDDO

! Link further reactions
  DO
    READ(16,*,IOSTAT=ierr) nj
    IF(ierr<0) THEN
      EXIT
     ELSEIF(ierr>0) THEN
      STOP "Read error in temporary file 'sortj.tmp'!"
    ENDIF
    DO n = 1, nrxn
      IF(nj==translib(n,1)) THEN
        IF(translib(n,3)==0) THEN
          WRITE(*,'(A)') "WARNING! TUV reaction flag set to FALSE for:"
          WRITE(*,104) &
               "J(",translib(n,1),") [J(",translib(n,2),") in TUV]"
        ENDIF
        WRITE(15,102) translib(n,2)
        WRITE(15,103) translib(n,1),trim(tdblab(n))
      ENDIF
    ENDDO
  ENDDO
  WRITE(15,'(4X,"ENDIF")')

  CLOSE(15)
  CLOSE(16)

101 FORMAT(4X,"IF (jl == ",I3,") THEN")
102 FORMAT(5X,"ELSEIF (jl == ",I3,") THEN")
103 FORMAT(6X,"j(",I4,") = seval(n,theta,tmp,tmp2,b,c,d) ! ",A)
104 FORMAT(A,I4,A,I4,A)

END SUBROUTINE wrtoutp