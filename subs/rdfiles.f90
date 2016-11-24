!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINES associated with reading input data from input files.   !
!                                                                      !
!   Contains:                                                          !
!   - jmech                                                            !
!   - tdlnk                                                            !
!   - tuvdb                                                            !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE jmech(fmech)

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
!                                                                      !
! internal:                                                            !
! • nj:         ID for photoreactions used in DSMACC                   !
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

! internal:
  INTEGER               :: nj,ierr
  CHARACTER(llen)       :: line

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

  OPEN(15,FILE=fmech,STATUS='OLD')
  OPEN(16,FILE="sortj.tmp")

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

SUBROUTINE tdlnk(flink,translib,tdblab)

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
!                                                                      !
! internal:                                                            !
! • i:          counter for loops                                      !
! • idx:        index (for character string treatment)                 !
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
  CHARACTER(flen), INTENT(IN)   :: flink
  INTEGER, INTENT(OUT)          :: translib(np,3)
  CHARACTER(llab), INTENT(OUT)  :: tdblab(np)

! internal:
  INTEGER               :: i,idx,ierr
  CHARACTER(llen)       :: line

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Intialisation:

  translib  = 0
  tdblab = ''

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
    READ(line(:idx-1),*) translib(nrxn,1)
    READ(line(idx+1:),'(A)') tdblab(nrxn)
    tdblab(nrxn) = ADJUSTL(tdblab(nrxn))
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