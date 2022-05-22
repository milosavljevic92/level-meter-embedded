'****************************************************************
'*  Name    : ReEnterPBP-18.bas                                 *
'*  Author  : Darrel Taylor / Timothy Box                       *
'*  Date    : MAR 18, 2006                                      *
'*  Version : 1.4  MAR 24, 2008                                 *
'*  Notes   : Allows re-entry to PBP from a High Priority       *
'*          :                               ASM interrupt       *
'*          : Must have DT_INTS-18.bas loaded first             *
'****************************************************************
'*  Versions:                                                   *
'*   1.4  MAR 24, 2008                                          *
'*       Corrects an initialization problem affecting the first *
'*         pass system var save. Found by dcorraliza            *
'*       Fixed T7 "Warning" error. Found by Kamikaze47          *
'*   1.3  Aug 26, 2007                                          *
'*       Update for PBP 2.50 using LONG's with PBPL             *
'*   1.2  JUL 18, 2006                                          *
'*       Modified to handle smaller BANKA in the newer chips    *
'****************************************************************
DISABLE DEBUG

DEFINE   ReEnterHPused  1
VarsSaved_H   VAR BIT
VarsSaved_H = 0

goto OverReEnterH
   
' Save locations for PBP system Vars during High Priority Interrupts
HP_Vars  VAR  WORD[34]        ; group vars together for less banking
    R0_SaveH      VAR HP_Vars[0]
    R1_SaveH      VAR HP_Vars[2]
    R2_SaveH      VAR HP_Vars[4]
    R3_SaveH      VAR HP_Vars[6]
    R4_SaveH      VAR HP_Vars[8]
    R5_SaveH      VAR HP_Vars[9]
    R6_SaveH      VAR HP_Vars[10]
    R7_SaveH      VAR HP_Vars[11]
    R8_SaveH      VAR HP_Vars[12]
    Flag_GOP_H    VAR HP_Vars[13]
      Flags_SaveH   VAR Flag_GOP_H.lowbyte
      GOP_SaveH     VAR Flag_GOP_H.highbyte
    RM_H          VAR HP_Vars[14]
      RM1_SaveH     VAR RM_H.lowbyte
      RM2_SaveH     VAR RM_H.highbyte
    RR_H          VAR HP_Vars[15]
      RR1_SaveH     VAR RR_H.lowbyte
      RR2_SaveH     VAR RR_H.highbyte
    RS_H          VAR HP_Vars[16]
      RS1_SaveH     VAR RS_H.lowbyte
      RS2_SaveH     VAR RS_H.highbyte
    T1_SaveH      VAR HP_Vars[17]
    T2_SaveH      VAR HP_Vars[19]
    T3_SaveH      VAR HP_Vars[21]
    T4_SaveH      VAR HP_Vars[23]
    T5_SaveH      VAR HP_Vars[25]
    T6_SaveH      VAR HP_Vars[27]
    T7_SaveH      VAR HP_Vars[29]
    TBLPTRU_H     VAR HP_Vars[31]
      TBLPTRU_SaveH VAR TBLPTRU_H.lowbyte
    TBLPTR_H      VAR HP_Vars[32]
      TBLPTRH_SaveH VAR TBLPTR_H.highbyte
      TBLPTRL_SaveH VAR TBLPTR_H.lowbyte
    Product_H     VAR HP_Vars[33]
    
SavePBP_H:               ' Save all PBP system Vars High Priority
  if VarsSaved_H = 0 then
    R0_SaveH = R0
    R1_SaveH = R1
    R2_SaveH = R2
    R3_SaveH = R3
    asm
        if (PBPLongs_Used == 1)
            MOVE?WW  R0+2, _R0_SaveH+2
            MOVE?WW  R1+2, _R1_SaveH+2
            MOVE?WW  R2+2, _R2_SaveH+2
            MOVE?WW  R3+2, _R3_SaveH+2
        endif
    endasm
    R4_SaveH = R4
    R5_SaveH = R5
    R6_SaveH = R6
    R7_SaveH = R7
    R8_SaveH = R8
    Flags_SaveH = FLAGS
    GOP_SaveH = GOP
    RM1_SaveH = RM1
    RM2_SaveH = RM2
    RR1_SaveH = RR1
    RR2_SaveH = RR2
@ if Save_TBLPTR == 1
    TBLPTRU_SaveH = TBLPTRU
    TBLPTRH_SaveH = TBLPTRH
    TBLPTRL_SaveH = TBLPTRL
@ endif
    ASM
        ifdef RS1
            MOVE?BB    RS1, _RS1_SaveH
        endif
        ifdef RS2
            MOVE?BB    RS2, _RS2_SaveH
        endif
        ifdef MUL_USED
            MOVE?WW    PRODL, _Product_H
        endif
        ifdef T1
            MOVE?WW    T1, _T1_SaveH
            if (PBPLongs_Used == 1)
                MOVE?WW  T1+2, _T1_SaveH+2
            endif
        endif
        ifdef T2
            MOVE?WW    T2, _T2_SaveH
            if (PBPLongs_Used == 1)
                MOVE?WW  T2+2, _T2_SaveH+2
            endif
        endif
        ifdef T3
            MOVE?WW    T3, _T3_SaveH
            if (PBPLongs_Used == 1)
                MOVE?WW  T3+2, _T3_SaveH+2
            endif
        endif
        ifdef T4
            MOVE?WW    T4, _T4_SaveH
            if (PBPLongs_Used == 1)
                MOVE?WW  T4+2, _T4_SaveH+2
            endif
        endif
        ifdef T5
            MOVE?WW    T5, _T5_SaveH
            if (PBPLongs_Used == 1)
                MOVE?WW  T5+2, _T5_SaveH+2
            endif
        endif
        ifdef T6
            MOVE?WW    T6, _T6_SaveH
            if (PBPLongs_Used == 1)
                MOVE?WW  T6+2, _T6_SaveH+2
            endif
        endif
        ifdef T7
            MOVE?WW    T7, _T7_SaveH
            if (PBPLongs_Used == 1)
                MOVE?WW  T7+2, _T7_SaveH+2
            endif
        endif
    ENDASM   
    VarsSaved_H = 1
  endif
@ INT_RETURN

RestorePBP_H:
  if VarsSaved_H = 1 then
    R0 = R0_SaveH
    R1 = R1_SaveH
    R2 = R2_SaveH
    R3 = R3_SaveH
    asm
        if (PBPLongs_Used == 1)
            MOVE?WW  _R0_SaveH+2, R0+2
            MOVE?WW  _R1_SaveH+2, R1+2 
            MOVE?WW  _R2_SaveH+2, R2+2 
            MOVE?WW  _R3_SaveH+2, R3+2 
        endif
    endasm
    R4 = R4_SaveH
    R5 = R5_SaveH
    R6 = R6_SaveH
    R7 = R7_SaveH
    R8 = R8_SaveH
    FLAGS = Flags_SaveH
    GOP = GOP_SaveH
    RM1 = RM1_SaveH
    RM2 = RM2_SaveH
    RR1 = RR1_SaveH
    RR2 = RR2_SaveH
@ if Save_TBLPTR == 1
    TBLPTRU = TBLPTRU_SaveH
    TBLPTRH = TBLPTRH_SaveH
    TBLPTRL = TBLPTRL_SaveH
@ endif
    ASM
        ifdef RS1
            MOVE?BB    _RS1_SaveH, RS1
        endif
        ifdef RS2
            MOVE?BB    _RS2_SaveH, RS2
        endif
        ifdef MUL
            MOVE?WW    _Product_H, PRODL
        endif
        ifdef T1
            MOVE?WW    _T1_SaveH, T1
            if (PBPLongs_Used == 1)
                MOVE?WW  _T1_SaveH+2, T1+2 
            endif
        endif
        ifdef T2
            MOVE?WW    _T2_SaveH, T2
            if (PBPLongs_Used == 1)
                MOVE?WW  _T2_SaveH+2, T2+2 
            endif
        endif
        ifdef T3
            MOVE?WW    _T3_SaveH, T3
            if (PBPLongs_Used == 1)
                MOVE?WW  _T3_SaveH+2, T3+2 
            endif
        endif
        ifdef T4
            MOVE?WW    _T4_SaveH, T4
            if (PBPLongs_Used == 1)
                MOVE?WW  _T4_SaveH+2, T4+2 
            endif
        endif
        ifdef T5
            MOVE?WW    _T5_SaveH, T5
            if (PBPLongs_Used == 1)
                MOVE?WW  _T5_SaveH+2, T5+2 
            endif
        endif
        ifdef T6
            MOVE?WW    _T6_SaveH, T6
            if (PBPLongs_Used == 1)
                MOVE?WW  _T6_SaveH+2, T6+2 
            endif
        endif
        ifdef T7
            MOVE?WW    _T7_SaveH, T7
            if (PBPLongs_Used == 1)
                MOVE?WW  _T7_SaveH+2, T7+2 
            endif
        endif
        ifdef T8
            ifndef NO_T7_WARNING
                messg "Temp variables exceeding T7"
            endif
        endif
    ENDASM   
    VarsSaved_H = 0
  ENDIF
@ INT_RETURN

OverReEnterH:
ENABLE DEBUG
