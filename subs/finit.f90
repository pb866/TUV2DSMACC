SUBROUTINE finit(fmech,flink,foutp,ftuv)

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

  CHARACTER(flen), INTENT(OUT)  :: fmech,ftuv,flink,foutp

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! derive programme parameters (or use pre-defined):
  CALL getarg(1,fmech)
  CALL getarg(2,ftuv)
  CALL getarg(3,flink)
  CALL getarg(4,foutp)

  IF(fmech=="") fmech = "MCM331.kpp"
  IF(ftuv =="") ftuv  = "usrinp"
  IF(flink=="") flink = "MCM331.db"
  IF(foutp=="") foutp = "MCM331.f90"

  fmech = ADJUSTL(fmech)
  ftuv  = ADJUSTL(ftuv)
  flink = ADJUSTL(flink)
  foutp = ADJUSTL(foutp)

  IF(fmech(:3)/='IO/') fmech = "IO/"//fmech
  IF(ftuv(:3)/='DB/') ftuv  = "DB/"//ftuv
  IF(flink(:3)/='DB/') flink = "DB/"//flink
  IF(foutp(:3)/='IO/') foutp = "IO/"//foutp


!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

  WRITE(*,'(A)') "I/O files:"
  WRITE(*,'(2A)') "Mechanism:      ", trim(fmech)
  WRITE(*,'(2A)') "TUV input file: ", trim(ftuv)
  WRITE(*,'(2A)') "Link database:  ", trim(flink)
  WRITE(*,'(2A)') "Output:         ", trim(foutp)


END SUBROUTINE finit
