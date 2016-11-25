SUBROUTINE wrtoutp(foutp,translib,tdblab,brat)

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
! • brat:       branching ratios used in DSMACC for certain photolysis !
!               reactions.                                             !
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
  REAL(4), INTENT(IN)           :: brat(np)

! internal:
  INTEGER          :: n,ierr
  INTEGER          :: nj



  OPEN(15,FILE=foutp,STATUS='UNKNOWN')
  REWIND(16)

! Link reactions
  WRITE(15,"('  SELECT CASE (jl)')")
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
        WRITE(15,101) translib(n,2)
        IF(brat(n)>0.9999) THEN
          WRITE(15,102,ADVANCE='NO') translib(n,1)
         ELSE
          WRITE(15,103,ADVANCE='NO') translib(n,1),brat(n)
        ENDIF
        WRITE(15,"(' ! ',A)") trim(tdblab(n))
      ENDIF
    ENDDO
  ENDDO
  WRITE(15,'(2X,"END SELECT")')

  CLOSE(15)
  CLOSE(16)

101 FORMAT(4X,"CASE(",I3,")")
102 FORMAT(6X,"j(",I4,") = seval(n,theta,tmp,tmp2,b,c,d)")
103 FORMAT(6X,"j(",I4,") = seval(n,theta,tmp,tmp2,b,c,d)*",F5.3)
104 FORMAT(A,I4,A,I4,A)

END SUBROUTINE wrtoutp