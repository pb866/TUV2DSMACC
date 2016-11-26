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
! • i,j,n:      counter for loops                                      !
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
  INTEGER, INTENT(IN)           :: translib(np,2+nbr)
  CHARACTER(llab), INTENT(IN)   :: tdblab(np)
  REAL(4), INTENT(IN)           :: brat(np,nbr)

! internal:
  INTEGER          :: i,j,n,ierr
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
        IF(translib(n,2+nbr)==0) THEN
          WRITE(*,'(A)') "WARNING! TUV reaction flag set to FALSE for:"
          WRITE(*,104) &
               "J(",translib(n,1+nbr),") in TUV"
        ENDIF
        WRITE(15,101) translib(n,1+nbr)
        IF(brat(n,1)<0.0001) THEN
          WRITE(15,102) translib(n,1),trim(tdblab(n))
         ELSE
          DO i = 1,nbr
            IF(translib(n,i)==0) EXIT
            WRITE(15,103) translib(n,i),brat(n,i),trim(tdblab(n))
          ENDDO
        ENDIF
        EXIT
       ELSEIF(n==nrxn) THEN
        DO j = 2, nbr
          DO i = 1, nrxn
            IF(nj==translib(i,j)) GOTO 201
          ENDDO
        ENDDO
        WRITE(*,'(A,I4,A)') "ERROR! No entry for reaction ",nj, &
                            " found in database."
        STOP "Programme linkphot"
      ENDIF
 201  CONTINUE
    ENDDO
  ENDDO
  WRITE(15,'(2X,"END SELECT")')

  CLOSE(15)
  CLOSE(16, STATUS='DELETE')

101 FORMAT(4X,"CASE(",I3,")")
102 FORMAT(6X,"j(",I4,") = seval(n,theta,tmp,tmp2,b,c,d) ! ",A)
103 FORMAT(6X,"j(",I4,") = seval(n,theta,tmp,tmp2,b,c,d)*",F5.3," ! ",A)
104 FORMAT(A,I4,A)

END SUBROUTINE wrtoutp