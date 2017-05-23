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
! • mech:   Switch to include only different subsets of photolyses:    !
!   - 0:    Only reactions used in the current mechanism are outputted.!
!   - 1:    As case 0, but also includes inorganics.                   !
!   - 2:    Includes all reactions defined in the database.            !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

MODULE params
  INTEGER, PARAMETER    :: llen=120, flen=80, llab=50
  INTEGER, PARAMETER    :: np = 500, nbr=3
  INTEGER, PARAMETER    :: mech = 2
  INTEGER, SAVE         :: nrxn

  DATA rxn / 0 /
END MODULE params
