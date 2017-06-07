PROGRAM linkphot

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   PROGRAMME linkphot                                                 !
!                                                                      !
! PURPOSE:                                                             !
! Create FORTRAN 90 code for DSMACC to link TUV photolysis labels      !
! (or IDs) to DSMACC internal labelling.                               !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
! INCLUDES:                                                            !
! • params with array sizes.                                           !
!                                                                      !
!                                                                      !
! VARIABLES:                                                           !
!                                                                      !
! • fmech/flink/foutp/ftuv/fglob/fconst:                               !
!               Paths + names of I/O files                             !
! • translib:   Library of IDs used in DSMACC and corresponding TUV IDs!
!               as well as switches to toggle on/off reactions in TUV  !
! • tdblab:     memory of TUV labels to link DSMACC and TUV databases  !
! • brat:       branching ratios used in DSMACC for certain photolysis !
!               reactions.                                             !
! • tuvlab:     TUV labels from TUV input file                         !
! • idtuv:      IDs of TUV photoreactions                              !
! • fltuv:      Memory of flags used to toggle photoreactions on/off   !
!               in TUV                                                 !
! • jmax:       maximum value of DSMACC j labels rounded to the next   !
!               full 100 needed to define array size in DSMACC         !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Modules:
! ========
USE params


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
! Variable declarations:                                               !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

  IMPLICIT NONE

  CHARACTER(flen)  :: fmech,flink,foutp,ftuv,fglob,fconst
  INTEGER          :: translib(np,2+nbr),idtuv(np)
  REAL(4)          :: brat(np,nbr)
  CHARACTER(llab)  :: tdblab(np),tuvlab(np)
  CHARACTER(1)     :: fltuv(np)
  INTEGER          :: jmax

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! initialise files (get file names from arguments or use standard names)
  CALL finit(fmech,flink,foutp,ftuv,fglob,fconst)

! read photolysis IDs and labels from files
  CALL tdlnk(flink,translib,tdblab,brat)
  CALL tuvdb(ftuv,idtuv,tuvlab,fltuv)
! create library with associated IDs (and flags from TUV)
  CALL creatlib(translib,tdblab,idtuv,tuvlab,fltuv)

!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!)

! Read in all j IDs used in current mechanism and sort them ascending
  CALL jmech(fmech,translib)
! translate IDs and write them into mechanism
! (check that all IDs are available)
  CALL wrtoutp(foutp,translib,tdblab,brat,jmax)

! Adjust DSMACC constants file:
! - Adjust array sizes related to j values
  CALL adjARRsiz(fglob,jmax)
! - Amend select case of TUVvers by missing include files
  CALL adjCASE(fconst,foutp)

!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

  WRITE(*,'(A)') "Done."

END PROGRAM linkphot
