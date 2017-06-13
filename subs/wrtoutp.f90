!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINES associated with writing output files.                  !
!                                                                      !
!   Contains:                                                          !
!   - wrtoupt                                                          !
!   - adjARRsiz                                                        !
!   - adjCASE                                                          !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE wrtoutp(foutp,translib,tdblab,brat,jmax)

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
! • jmax:       maximum value of DSMACC j labels rounded to the next   !
!               full 100 needed to define array size in DSMACC         !
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
  INTEGER, INTENT(OUT)          :: jmax

! internal:
  INTEGER          :: i,j,n,ierr
  INTEGER          :: nj

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!


  jmax = 0
  OPEN(15,FILE=foutp,STATUS='UNKNOWN')
  REWIND(16)

!----------------------------------------------------------------------!

! Link reactions
! Initialise select case in output source code
  WRITE(15,"('  SELECT CASE (jl)')")
! Loop over DSMACC j values
  DO
    READ(16,*,IOSTAT=ierr) nj
!   Treat read errors
    IF(ierr<0) THEN
      EXIT
     ELSEIF(ierr>0) THEN
      STOP "Read error in temporary file 'sortj.tmp'!"
    ENDIF

!----------------------------------------------------------------------!

! Find associated TUV label
    DO n = 1, nrxn
! Warn of F flags in used reactions
      IF(nj==translib(n,1)) THEN
        IF(translib(n,2+nbr)==0) THEN
          WRITE(*,'(A)') "WARNING! TUV reaction flag set to FALSE for:"
          WRITE(*,104) "J(",translib(n,1+nbr),") in TUV"
        ENDIF
        WRITE(15,101) translib(n,1+nbr)
! Determine branching ratios in DSMACC
        IF(brat(n,1)<0.0001) THEN
          WRITE(15,102) translib(n,1),trim(tdblab(n))
         ELSE
          DO i = 1,nbr
            IF(translib(n,i)==0) EXIT
            IF(brat(n,i)>0.9999 .and. brat(n,i)<1.0001) THEN
                WRITE(15,102) translib(n,1),trim(tdblab(n))
              ELSE
                WRITE(15,103) translib(n,i),brat(n,i),trim(tdblab(n))
            ENDIF
          ENDDO
        ENDIF
        EXIT
       ELSEIF(n==nrxn) THEN
! On last library entry:
! Search for associated TUV label
        DO j = 2, nbr
          DO i = 1, nrxn
            IF(nj==translib(i,j)) GOTO 201
          ENDDO
        ENDDO
! STOP on error, if no corresponding TUV reaction could be found
        WRITE(*,'(A,I4,A)') "ERROR! No entry for reaction ",nj, &
                            " found in database."
        STOP "Programme linkphot"
      ENDIF
 201  CONTINUE
    ENDDO
! Search for largest DSMACC photolysis label
    IF(nj > jmax) jmax = nj
  ENDDO
! End select case
  WRITE(15,'(2X,"END SELECT")')

!----------------------------------------------------------------------!

! Close files and delete temporary files
  CLOSE(15)
  CLOSE(16, STATUS='DELETE')
! Round array size to next full 100
  DO i = 1, 100
    IF(MOD(jmax,100)==0) EXIT
    jmax = jmax + 1
  ENDDO

!----------------------------------------------------------------------!

! Formats:
101 FORMAT(4X,"CASE(",I3,")")
102 FORMAT(6X,"j(",I4,") = seval(szabin,theta,tmp,tmp2,b,c,d) ! ",A)
103 FORMAT(6X,"j(",I4,") = seval(szabin,theta,tmp,tmp2,b,c,d)*",F5.3," ! ",A)
104 FORMAT(A,I4,A)

END SUBROUTINE wrtoutp

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE adjARRsiz(fglob,jmax)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE adjARRsiz                                               !
!                                                                      !
! PURPOSE:                                                             !
! Adjust array sizes related to j values in the DSMACC constants       !
! module.                                                              !
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
! • fglob:      Path + name of DSMACC global.inc file                  !
! • jmax:       maximum value of DSMACC j labels rounded to the next   !
!               full 100 needed to define array size in DSMACC         !
!                                                                      !
! internal:                                                            !
! • cmd:        string for UNIX commands called by CALL SYSTEM         !
!               read from temporary file                               !
! • ioexist:    error number for file read errors                      !
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
  CHARACTER(flen), INTENT(IN) ::    fglob
  INTEGER, INTENT(IN) ::            jmax

! internal:
  CHARACTER(2*flen) :: cmd
  LOGICAL ::           ioexist

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Check for existance of DSMACC constants file
  INQUIRE(FILE=fglob, exist=ioexist)
! If not existing, issue warning on screen and skip routine
  IF(.not.ioexist) THEN
    WRITE(*,'(A)') "WARNING! No DSMACC global.inc file found."
    WRITE(*,'(2A)') "File name: ", trim(fglob)
    WRITE(*,'(A)') &
      "Please, specify correct file name (and path) in programme argument 5."
    WRITE(*,'(A)') "Adjustment of DSMACC array sizes skipped."
    RETURN
  ENDIF

!----------------------------------------------------------------------!

! If existing, define perl command to search for the definition of
! Parameter jmax and replace with current array size limit
  cmd = " "
  WRITE(cmd,"(A,I5,2A)") "perl -pi -e 's/jmax\s*=\s*[0-9]+/jmax=", &
       jmax,"/g;' ",trim(fglob)
! Execute perl
  CALL SYSTEM(cmd)

END SUBROUTINE adjARRsiz

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

SUBROUTINE adjCASE(fconst,foutp)

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!                                                                      !
!   SUBROUTINE adjCASE                                                 !
!                                                                      !
! PURPOSE:                                                             !
! Add CASE to SELECT CASE of TUVvers,                                  !
! if current include file is missing.                                  !
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
! • fconst:     Path + name of DSMACC constants file                   !
! • foutp:      Path + name of output DSMACC include file              !
!                                                                      !
! internal:                                                            !
! • line:       memory for lines of DSMACC constants file              !
! • cmd:        string for UNIX commands called by CALL SYSTEM         !
!               read from temporary file                               !
! • fname:      Path + name of currently define DSMACC include file    !
!               (from programme argument)                              !
! • fcase:      Names of include files defined in the selcect case of  !
!               TUVvers in the DSMACC constants file                   !
! • ierr:       error number for file read errors                      !
! • ib/ie:      indices for beginning and end of substrings            !
! • ncase:      number of largest case and ammended case               !
! • icase:      case number of TUVvers                                 !
! • newcase:    flag for usage of currently defined include file in    !
!               select case of TUVvers                                 !
!                                                                      !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Modules:
! ========
USE params


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
! Variable declarations:                                               !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

  IMPLICIT NONE

  CHARACTER(flen), INTENT(IN) :: fconst, foutp

  CHARACTER(llen) ::  line, cmd
  CHARACTER(flen) ::  fname,fcase
  INTEGER ::          ierr, ib, ie
  INTEGER ::          icase, ncase
  LOGICAL ::          newcase

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!

! Skip routine, if no DSMACC constants file is defined
  IF(fconst==" ") THEN
    WRITE(*,'(A)') "WARNING! No DSMACC constants file found."
    WRITE(*,'(2A)') "File name: ", trim(fconst)
    WRITE(*,'(A)') &
      "Please, specify correct file name (and path) in programme argument 6."
    WRITE(*,'(A)') "Check of SELECT CASE of TUVvers skipped."
    RETURN
  ENDIF

! Initialise variables
  ncase = 0
  newcase = .TRUE.
! Retrieve file name of current include file from argument 4
  fname = foutp(INDEX(fconst,'/',back=.TRUE.)+1:)

! Open DSMACC constants file and temporary constants file
  OPEN(15,FILE=fconst)
  OPEN(16,FILE='constants.tmp')

!----------------------------------------------------------------------!

! Loop over constants file
  fil: DO
! Read line by line
    READ(15, "(A)", iostat=ierr) line
! Error handling
    IF(ierr < 0) THEN
      EXIT fil
     ELSEIF(ierr > 0) THEN
      WRITE(*,*) trim(line)
      STOP "Read error in DSMACC constants file!"
    ENDIF

!----------------------------------------------------------------------!

! Search for SELECT CASE of TUVvers:
    csi: IF((INDEX(line,'SELECT CASE') >= 1 .or. INDEX(line,'select case') >= 1) &
          .and. INDEX(line,'TUVvers') >= 1) THEN
      WRITE(16,'(A)') trim(line)
! Loop over cases
      csd: DO
!       Read lines from constants file + error handling
        READ(15, "(A)", iostat=ierr) line
        IF(ierr < 0) THEN
          WRITE(*,"(3A)") "End of file reached for file ", trim(fconst),"."
          STOP
         ELSEIF(ierr > 0) THEN
          WRITE(*,*) trim(line)
          STOP "Read error in DSMACC constants file!"
        ENDIF

!----------------------------------------------------------------------!

! Wrap up on last default case
        cs: IF(INDEX(line,"CASE DEFAULT") > 0 .or. &
          INDEX(line,"case dafault") > 0) THEN
! If current include file is not included in one of the cases, add case
          ncs: IF(newcase) THEN
            ! Get number of leading whitespaces for output formatting
            IF(INDEX(line,"CASE DEFAULT") > 0) THEN
              ib = INDEX(line,'C')-1
            ELSE
              ib = INDEX(line,'c')-1
            ENDIF
! Define new case number and print source code to temporary constants file
            cmd = " "
            ncase = ncase + 1
            WRITE(cmd(ib+1:),"(A,I2,A)") "CASE(",ncase,")"
            WRITE(16,'(A)') trim(cmd)
! Print include command with current include file name
            cmd = " "
            WRITE(cmd(ib+1:),"(3A)") " INCLUDE './TUV_5.2.1/",trim(fname),"'"
            WRITE(16,'(A)') trim(cmd)
! Print default case with adjusted warning
            WRITE(16,'(A)') trim(line)
            READ(15,"(A)") line
            cmd = " "
            WRITE(cmd(ib+1:),"(A,I2,A)") &
                 ' STOP "Select TUV case between 0 and ',ncase,'."'
           WRITE(16,'(A)') trim(cmd)
          ELSE ncs
! If case already exists, print original default case
            WRITE(16,'(A)') trim(line)
            READ(15,"(A)") line
            WRITE(16,'(A)') trim(line)
          ENDIF ncs
! Exit select case loop on treatment of default case
          EXIT csd

!----------------------------------------------------------------------!

        ELSEIF(INDEX(line,'CASE') > 0 .or. INDEX(line,'case') > 0) THEN cs
! Treat different cases of TUVvers
          WRITE(16,'(A)') trim(line) ! write case line unadjusted
          ! get string position of case number
          ib = INDEX(line,'(')+1
          ie = INDEX(line,')')-1
! Retrieve case numbers of TUVvers and save largest case number
          READ(line(ib:ie),*) icase
          IF(icase > ncase) ncase = icase

!----------------------------------------------------------------------!

        ELSEIF(INDEX(line,'INCLUDE') > 0) THEN cs
! Treat different include files
          ! get string position of file name in include statement
          ib = INDEX(line,'/',back=.TRUE.)+1
          ie = INDEX(line,"'",back=.TRUE.)-1
! Retrieve file names of all include files defined in the TUVvers cases
! and flag, if current file is already part of those cases
          fcase = line(ib:ie)
          IF(fcase==fname) newcase = .FALSE.
          WRITE(16,'(A)') trim(line)
        ENDIF cs
      ENDDO csd
    ELSE csi

!----------------------------------------------------------------------!
! General case: Write lines unadjusted outside the TUVvers select case
      WRITE(16,'(A)') trim(line)
    ENDIF csi
  ENDDO fil

!----------------------------------------------------------------------!

! Close all files
  CLOSE(15)
  CLOSE(16)

! Rename temporary file to file name define by argument 5 and save
! in define location
  cmd = " "
  WRITE(cmd,"(2A)") "mv constants.tmp ",trim(fconst)
  CALL SYSTEM(cmd)

END SUBROUTINE adjCASE

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
