!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINES associated with reading input data from input files.   !
!                                                                      !
!   Contains:                                                          !
!   - jmech                                                            !
!   - tdlnk                                                            !
!   - tuvdb                                                            !
!   - bratio                                                           !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE jmech(fmech,translib)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE jmech                                                   !
!                                                                      !
! PURPOSE:                                                             !
! Identify photoreactions and IDs used in the current DSMACC mechanism.!
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
! • fmech:      Path + name of mechanism (kpp) file                    !
! • translib:   Database with DSMACC photolysis IDs and associated TUV !
!               photolysis IDs and switch for TUV reaction treatment   !
!                                                                      !
! internal:                                                            !
! • nj:         ID for photoreactions used in DSMACC                   !
! • i,j:        counter for loops                                      !
! • ierr:       index for read error treatment                         !
! • line:       memory of lines read in from kpp file                  !
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
  CHARACTER(flen), INTENT(IN)   :: fmech
  INTEGER, INTENT(IN)           :: translib(np,2+nbr)

! internal:
  INTEGER               :: nj, i, j, ierr
  CHARACTER(llen)       :: line

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

  OPEN(15,FILE=fmech,STATUS='OLD')
  OPEN(16,FILE="sortj.tmp")

! Force include of inorganic photolysis reactions, if inorg is set to true in params.
! This is to include output of inorganic photolysis labels for copy/paste
! to the DSMACC module constants.f90, while only updating organic.kpp in DSMACC.
  SELECT CASE(mech)
    CASE(1)
      DO i = 1,8
        WRITE(16,*) i
      ENDDO
    CASE(2)
      DO i = 1, nrxn
        WRITE(16,*) translib(i,1)
        DO j = 2, nbr
          IF(translib(i,j)==0) THEN
            EXIT
           ELSE
            WRITE(16,*) translib(i,j)
          ENDIF
        ENDDO
      ENDDO
      RETURN
  END SELECT

! Read over mechanism file line by line
! and identify photolysis reactions in the mechanism:

fil: &
  DO

! read in all lines
    READ(15,'(A)',IOSTAT=ierr) line
    IF(ierr<0) THEN
      EXIT
     ELSEIF(ierr>0) THEN
      STOP "Read error in mechanism file!"
    ENDIF

!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

! check that the whole line is read in
    IF(INDEX(line,";")<=0 .and. INDEX(line,".}")>0) THEN
       WRITE(*,'(A)') "WARNING! Possible exceeding of maximum line length."
       WRITE(*,'(A)') "         Increase parameter 'llen'."
    ENDIF

! search for photolysis label
    IF(INDEX(line,"J(")>=1) THEN
      line = line(INDEX(line,"J(")+2:)
      READ(line(:INDEX(line,")")-1),*) nj
      WRITE(16,*) nj
    ENDIF
  ENDDO fil

! Sort j labels and eliminate double entries
  CALL SYSTEM("sort -u 'sortj.tmp' -o 'sortj.tmp'")
  CLOSE(15)
END SUBROUTINE jmech

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE tdlnk(flink,translib,tdblab,brat)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE tdlnk                                                   !
!                                                                      !
! PURPOSE:                                                             !
! Read in DSMACC photolysis IDs and TUV labels to link them to TUV     !
! photolysis IDs later.                                                !
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
! • flink:      Path + name of database file with DSMACC IDs           !
!               and TUV labels                                         !
! • translib:   Database with DSMACC photolysis IDs and associated TUV !
!               photolysis IDs and switch for TUV reaction treatment   !
! • tdblab:     TUV labels associated with DSMACC photolysis IDs       !
! • brat:       branching ratios used in DSMACC for certain photolysis !
!               reactions.                                             !
!                                                                      !
! internal:                                                            !
! • i:          counter for loops                                      !
! • idx:        index (for character string treatment)                 !
! • ierr:       index for read error treatment                         !
! • tid:        temporary memory for DSMACC photolysis IDs             !
! • line:       memory of lines read in from kpp file                  !
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
  CHARACTER(flen), INTENT(IN)   :: flink
  INTEGER, INTENT(OUT)          :: translib(np,2+nbr)
  REAL(4), INTENT(OUT)          :: brat(np,nbr)
  CHARACTER(llab), INTENT(OUT)  :: tdblab(np)

! internal:
  INTEGER               :: i,idx,ierr
  INTEGER               :: tid
  CHARACTER(llen)       :: line

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Intialisation:

  translib  = 0
  tdblab    = ''
  brat      = 0.

! get database with TUV-DSMACC links
  OPEN(15,FILE=flink,STATUS='OLD')

!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

td: &
  DO i = 1,np

! read in database and save to memory
    READ(15,'(A)',IOSTAT=ierr) line
    IF(ierr<0) THEN
      EXIT
     ELSEIF(ierr>0) THEN
      STOP "Read error in database file!"
    ENDIF

! save data to database:
    IF(line(1:1)=='#') CYCLE ! Ignore comments
    nrxn = nrxn + 1 ! counter for number of (active) reactions
    idx = INDEX(line,":")
    READ(line(:idx-1),*) tid
    line = line(idx+1:)
    IF(line(1:1) == ':') THEN
      translib(nrxn,1) = tid
      READ(line(2:),'(A)') tdblab(nrxn)
      tdblab(nrxn) = ADJUSTL(tdblab(nrxn))
     ELSE
      CALL bratio(line,tid,translib,brat,tdblab)
    ENDIF
  ENDDO td

!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

! Array size check:
  IF (i > np) THEN
    WRITE(*,'(A)') &
    "WARNING! Possibly not all photoreactions are being considered."
    WRITE(*,'(A)') "         Increase parameter 'np'."
  ENDIF
  CLOSE(15)

END SUBROUTINE tdlnk

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE tuvdb(ftuv,idtuv,tuvlab,fltuv)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE tuvdb                                                   !
!                                                                      !
! PURPOSE:                                                             !
! Read in TUV photolysis IDs and labels to link them to DSMACC later.  !
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
! • ftuv:       Path + name of TUV input file                          !
! • idtuv:      Database with TUV photolysis IDs                       !
! • tuvlab:     Database with TUV labels                               !
! • fltuv:      Database with switches to toggle on/off photolysis     !
!               reactions in TUV.                                      !
!                                                                      !
! internal:                                                            !
! • i:          counter for loops                                      !
! • ierr:       index for read error treatment                         !
! • line:       memory of lines read in from kpp file                  !
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
  CHARACTER(flen), INTENT(IN)   :: ftuv
  INTEGER, INTENT(OUT)          :: idtuv(np)
  CHARACTER(llab), INTENT(OUT)  :: tuvlab(np)
  CHARACTER(1), INTENT(OUT)     :: fltuv(np)

! internal:
  INTEGER               :: i, ierr
  CHARACTER(llen)       :: line

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! get TUV database (numbers (or IDs) and labels)
  OPEN(15,FILE=ftuv,STATUS='OLD')
th: &
  DO
! read away TUV settings and spectral weighting functions
    READ(15,'(A)',IOSTAT=ierr) line
    IF(ierr<0) THEN
      EXIT
     ELSEIF(ierr>0) THEN
      STOP "Read error (1) in TUV file!"
    ENDIF
    IF(line(:37)=="===== Available photolysis reactions:") EXIT
  ENDDO th

!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

  idtuv  = 0
  tuvlab = ''
  fltuv  = ''

tuv: &
  DO i = 1, np
! read TUV flags, IDs, and reactions
    READ(15,'(A)',IOSTAT=ierr) line
    IF(ierr<0 .or. line(:3)=="===") THEN
      EXIT
     ELSEIF(ierr>0) THEN
      STOP "Read error (2) in TUV file!"
    ENDIF
! save data:
    fltuv(i) = line(1:1)
    READ(line(2:4),'(I3)') idtuv(i)
    tuvlab(i) = line(6:)
  ENDDO tuv

!––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––!

! Array size check:
  IF (i > np) THEN
    WRITE(*,'(A)') &
    "WARNING! Possibly not all photoreactions are being considered."
    WRITE(*,'(A)') "         Increase parameter 'np'."
  ENDIF
  CLOSE(15)

END SUBROUTINE tuvdb

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE bratio(line,tid,translib,brat,tdblab)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE tuvdb                                                   !
!                                                                      !
! PURPOSE:                                                             !
! Read in TUV photolysis IDs and labels to link them to DSMACC later.  !
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
! • line:       memory of lines read in from kpp file                  !
! • tid:        temporary memory for DSMACC photolysis IDs             !
! • translib:   Database with DSMACC photolysis IDs and associated TUV !
!               photolysis IDs and switch for TUV reaction treatment   !
! • brat:       branching ratios used in DSMACC for certain photolysis !
!               reactions.                                             !
! • tdblab:     TUV labels associated with DSMACC photolysis IDs       !
!                                                                      !
! internal:                                                            !
! • i,j:        counter for loops                                      !
! • idx:        index (for character string treatment)                 !
! • brr:        temporary memory for branching ratios                  !
! • tlab:       temporary memory for photolysis labels                 !
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
  INTEGER, INTENT(IN)           :: tid
  CHARACTER(llen), INTENT(INOUT):: line
  REAL(4), INTENT(INOUT)        :: brat(np,nbr)
  CHARACTER(llab), INTENT(INOUT):: tdblab(np)
  INTEGER, INTENT(INOUT)        :: translib(np,2+nbr)

  INTEGER               :: i,j,idx
  REAL(4)               :: brr
  CHARACTER(llab)       :: tlab

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!


  idx = INDEX(line,':')
  READ(line(:idx-1),*) brr
  READ(line(idx+1:),'(A)') tlab
  tlab = ADJUSTL(tlab)

  DO i = 1,nrxn-1
    IF(tlab(:INDEX(tlab,'->'))==tdblab(i)(:INDEX(tlab,'->'))) THEN
      nrxn = nrxn - 1
      DO j = 2, nbr
        IF(translib(i,j)==0) THEN
          translib(i,j) = tid
          brat(i,j)     = brr
          EXIT
        ENDIF
      ENDDO
     ELSEiF(i==nrxn-1) THEN
      translib(nrxn,1) = tid
      brat(nrxn,1)     = brr
      tdblab(nrxn)     = tlab
    ENDIF
  ENDDO

END SUBROUTINE bratio

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!