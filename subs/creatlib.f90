SUBROUTINE creatlib(translib,tdblab,idtuv,tuvlab,fltuv)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE creatlib                                                !
!                                                                      !
! PURPOSE:                                                             !
! Create library with links of DSMACC and TUV photolysis labels        !
! and flags for treatment of these reactions in TUV.                   !
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
! • translib:   Database with DSMACC photolysis IDs and associated TUV !
!               photolysis IDs and switch for TUV reaction treatment   !
! • tdblab:     TUV labels associated with DSMACC photolysis IDs       !
! • idtuv:      Database with TUV photolysis IDs                       !
! • tuvlab:     Database with TUV labels                               !
! • fltuv:      Database with switches to toggle on/off photolysis     !
!               reactions in TUV.                                      !
!                                                                      !
! internal:                                                            !
! • i,j:        counter for loops                                      !
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
  INTEGER                      :: translib(np,2+nbr)
  CHARACTER(llab), INTENT(IN)  :: tdblab(np)
  INTEGER, INTENT(IN)          :: idtuv(np)
  CHARACTER(llab), INTENT(IN)  :: tuvlab(np)
  CHARACTER(1), INTENT(IN)     :: fltuv(np)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! internal:
  INTEGER               :: i,j

  DO i = 1, nrxn
! For every DSMACC ID search for associated TUV ID
    DO j = 1,np
      IF(tdblab(i)==tuvlab(j)) THEN
! Link IDs:
        translib(i,nbr+1) = idtuv(j)
! Save TUV switches for reaction treatment:
        IF(fltuv(j)=='T') translib(i,2+nbr) = 1
        EXIT
! Warn about broken links:
       ELSEIF(j==np .and. tdblab(i)/=tuvlab(j)) THEN
        WRITE(*,'(A)') "WARNING! No TUV reaction found for label:"
        WRITE(*,'(A)') trim(tdblab(i))
      ENDIF
    ENDDO
  ENDDO


END SUBROUTINE creatlib
