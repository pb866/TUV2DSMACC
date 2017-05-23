SUBROUTINE finit(fmech,flink,foutp,ftuv,fconst)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE finit                                                   !
!                                                                      !
! PURPOSE:                                                             !
! Read in file names from programme arguments or assign default names. !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
! INCLUDES:                                                            !
! • params with array sizes.                                           !
!                                                                      !
!                                                                      !
! VARIABLES:                                                           !
!                                                                      !
! • fmech/flink/foutp/ftuv:                                            !
!               Paths + names of I/O files                             !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Modules:
! ========
USE params


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
! Variable declarations:                                               !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

  IMPLICIT NONE

  CHARACTER(flen), INTENT(OUT)  :: fmech,ftuv,flink,foutp,fconst

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! derive programme parameters (or use pre-defined):
  CALL getarg(1,fmech)
  CALL getarg(2,ftuv)
  CALL getarg(3,flink)
  CALL getarg(4,foutp)
  CALL getarg(5,fconst)

  IF(fmech =="") fmech  = "organic.kpp"
  IF(ftuv  =="") ftuv   = "usrinp"
  IF(flink =="") flink  = "MCM331.db"
  IF(foutp =="") foutp  = "MCM331.inc"

  fmech  = ADJUSTL(fmech)
  ftuv   = ADJUSTL(ftuv)
  flink  = ADJUSTL(flink)
  foutp  = ADJUSTL(foutp)
  fconst = ADJUSTL(fconst)

  IF(INDEX(fmech ,'/') <= 0) fmech  = "IO/"//fmech(:flen-3)
  IF(INDEX(ftuv  ,'/') <= 0) ftuv   = "IO/"//ftuv(:flen-3)
  IF(INDEX(flink ,'/') <= 0) flink  = "DB/"//flink(:flen-3)
  IF(INDEX(foutp ,'/') <= 0) foutp  = "IO/"//foutp(:flen-3)
  IF(INDEX(fconst,'/') <= 0 .and. fconst/="") &
    fconst = "IO/"//fconst(:flen-3)


!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

  WRITE(*,'(A)') "I/O files:"
  WRITE(*,'(2A)') "Mechanism:             ", trim(fmech)
  WRITE(*,'(2A)') "TUV input file:        ", trim(ftuv)
  WRITE(*,'(2A)') "Link database:         ", trim(flink)
  WRITE(*,'(2A)') "Output:                ", trim(foutp)
  WRITE(*,'(2A)') "DSMACC constants file: ", trim(fconst)
  WRITE(*,"(A)")
  WRITE(*,"(A)") "-------------------------------------"
  WRITE(*,"(A)")


END SUBROUTINE finit
