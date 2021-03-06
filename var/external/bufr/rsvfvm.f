      SUBROUTINE RSVFVM(NEM1,NEM2)

C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C
C SUBPROGRAM:    RSVFVM
C   PRGMMR: WOOLLEN          ORG: NP20       DATE: 1994-01-06
C
C ABSTRACT: THIS SUBROUTINE STEPS THROUGH THE "FOLLOWING VALUE"
C   MNEMONIC NEM1 AND, FOR EACH "." CHARACTER ENCOUNTERED (EXCEPT FOR
C   THE INITIAL ONE), OVERWRITES IT WITH THE NEXT CORRESPONDING
C   CHARACTER FROM NEM2 (SEE REMARKS).
C
C PROGRAM HISTORY LOG:
C 1994-01-06  J. WOOLLEN -- ORIGINAL AUTHOR
C 2003-11-04  J. ATOR    -- ADDED DOCUMENTATION
C 2003-11-04  S. BENDER  -- ADDED REMARKS/BUFRLIB ROUTINE
C                           INTERDEPENDENCIES
C 2003-11-04  D. KEYSER  -- UNIFIED/PORTABLE FOR WRF; ADDED HISTORY
C                           DOCUMENTATION
C
C USAGE:    CALL RSVFVM (NEM1, NEM2)
C   INPUT ARGUMENT LIST:
C     NEM1     - CHARACTER*8: "FOLLOWING VALUE" MNEMONIC
C     NEM2     - CHARACTER*8: MNEMONIC IMMEDIATELY FOLLOWING NEM1
C                WITHIN USER DICTIONARY TABLE
C
C   OUTPUT ARGUMENT LIST:
C     NEM1     - CHARACTER*8: COPY OF INPUT NEM1 WITH ALL "."
C                CHARACTERS (EXCEPT INITIAL ONE) OVERWRITTEN WITH
C                CORRESPONDING CHARACTERS FROM NEM2
C
C REMARKS:
C    FOR EXAMPLE:
C     if, on input:    NEM1 = ".DTH...."
C                      NEM2 = "MXTM    "
C     then, on output: NEM1 = ".DTHMXTM"
C
C
C    THIS ROUTINE CALLS:        None
C    THIS ROUTINE IS CALLED BY: NEMTBD   SEQSDX
C                               Normally not called by any application
C                               programs.
C
C ATTRIBUTES:
C   LANGUAGE: FORTRAN 77
C   MACHINE:  PORTABLE TO ALL PLATFORMS
C
C$$$

      CHARACTER*8 NEM1,NEM2

      DO I=1,LEN(NEM1)
      IF(I.EQ.1) THEN

C        Skip initial "." and initialize J.

         J = 1
      ELSE
         IF(NEM1(I:I).EQ.'.') THEN
            NEM1(I:I) = NEM2(J:J)
            J = J+1
         ENDIF
      ENDIF
      ENDDO

      RETURN
      END
