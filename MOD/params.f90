!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   MODULE params                                                      !
!                                                                      !
!   With parameters for array size definitions.                        !
!                                                                      !
! • llen:   Maximum character length of line length                    !
! • flen:   Maximum string length of file name                         !
! • llab:   Maximum string length of photolysis labels                 !
! • np:     Maximum number of photolysis reactions                     !
!           (and associated data)                                      !
! • nrxn:   Total number of DSMACC photolysis processes                !
! • inorg:  Switch to force inorganic photolysis reactions             !
!           to be included                                             !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

MODULE params
  INTEGER, PARAMETER    :: llen=100, flen=80, llab=50
  INTEGER, PARAMETER    :: np = 500, nbr=3
  INTEGER, SAVE         :: nrxn
  LOGICAL, PARAMETER    :: inorg=.TRUE.

  DATA rxn / 0 /
END MODULE params