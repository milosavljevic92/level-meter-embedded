
; PICBASIC PRO(TM) Compiler 3.0.4.1, (c) 1998, 2011 microEngineering Labs, Inc. All Rights Reserved. 
MPASMX_USED			EQU	1

#define	PBP_PATH	C:\PROGRAM FILES (X86)\PBP3\




        NOLIST
    ifdef PM_USED
        LIST
        "Error: PM does not support this device.  Use MPASM."
        NOLIST
    else
        LIST
        LIST p = 18F4550, r = dec, w = -311, w = -230, f = inhx32
        INCLUDE "P18F4550.INC"	; MPASM  Header
        NOLIST
    endif
        LIST
EEPROM_START	EQU	0F00000h
BLOCK_SIZE	EQU	32


PBP_HARDWAREDEF  macro
  endm



; Define statements.
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00020	DEFINE  INTHAND       INT_ENTRY_H  ' Context saving for High Priority Ints
#define		INTHAND		       INT_ENTRY_H  
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00021	DEFINE  INTLHAND      INT_ENTRY_L  ' Context saving for Low Priority Ints
#define		INTLHAND		      INT_ENTRY_L  
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00022	DEFINE   ReEnterHPused  1
#define		ReEnterHPused		  1
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00015	    DEFINE OSC 4
#define		OSC		 4
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00016	    DEFINE I2C_SLOW 1  
#define		I2C_SLOW		 1  
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00017	    DEFINE CHAR_PACING 1000
#define		CHAR_PACING		 1000

RAM_START       		EQU	00000h
RAM_END         		EQU	007FFh
RAM_BANKS       		EQU	00008h
BANK0_START     		EQU	00060h
BANK0_END       		EQU	000FFh
BANK1_START     		EQU	00100h
BANK1_END       		EQU	001FFh
BANK2_START     		EQU	00200h
BANK2_END       		EQU	002FFh
BANK3_START     		EQU	00300h
BANK3_END       		EQU	003FFh
BANK4_START     		EQU	00400h
BANK4_END       		EQU	004FFh
BANK5_START     		EQU	00500h
BANK5_END       		EQU	005FFh
BANK6_START     		EQU	00600h
BANK6_END       		EQU	006FFh
BANK7_START     		EQU	00700h
BANK7_END       		EQU	007FFh
BANKA_START     		EQU	00000h
BANKA_END       		EQU	0005Fh

; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00028	A00000	FLAGS   VAR     BYTE BANKA SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 000h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00027	A00001	GOP     VAR     BYTE BANKA SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 001h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00012	A00002	R0      VAR     WORD BANKA SYSTEM       ' System Register
R0              		EQU	RAM_START + 002h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00013	A00004	R1      VAR     WORD BANKA SYSTEM       ' System Register
R1              		EQU	RAM_START + 004h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00014	A00006	R2      VAR     WORD BANKA SYSTEM       ' System Register
R2              		EQU	RAM_START + 006h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00015	A00008	R3      VAR     WORD BANKA SYSTEM       ' System Register
R3              		EQU	RAM_START + 008h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00016	A0000A	R4      VAR     WORD BANKA SYSTEM       ' System Register
R4              		EQU	RAM_START + 00Ah
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00017	A0000C	R5      VAR     WORD BANKA SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ch
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00018	A0000E	R6      VAR     WORD BANKA SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Eh
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00019	A00010	R7      VAR     WORD BANKA SYSTEM       ' System Register
R7              		EQU	RAM_START + 010h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00020	A00012	R8      VAR     WORD BANKA SYSTEM       ' System Register
R8              		EQU	RAM_START + 012h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00001	A00014	'*********************************************************************
T1              		EQU	RAM_START + 014h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00001	A00016	'*********************************************************************
T2              		EQU	RAM_START + 016h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00038	A00018	INT_Flags   VAR BYTE  BANKA  SYSTEM
INT_Flags       		EQU	RAM_START + 018h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00023	A00019	RM1     VAR     BYTE BANKA SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 019h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00026	A0001A	RM2     VAR     BYTE BANKA SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 01Ah
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00021	A0001B	RR1     VAR     BYTE BANKA SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 01Bh
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00024	A0001C	RR2     VAR     BYTE BANKA SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 01Ch
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00022	A0001D	RS1     VAR     BYTE BANKA SYSTEM       ' Pin 1 Bank
RS1             		EQU	RAM_START + 01Dh
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00025	A0001E	RS2     VAR     BYTE BANKA SYSTEM       ' Pin 2 Bank
RS2             		EQU	RAM_START + 01Eh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00023	A0001F	wsave       var byte  BANKA  SYSTEM   ' location for WREG
wsave           		EQU	RAM_START + 01Fh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00036	A00020	RetAddrH    VAR BYTE[3]  BANKA  SYSTEM  ' 21-bit return address Hi Pri.
RetAddrH        		EQU	RAM_START + 020h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00037	A00023	RetAddrL    VAR BYTE[3]  BANKA  SYSTEM  '                       Lo Pri.
RetAddrL        		EQU	RAM_START + 023h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00001	A00026	'*********************************************************************
PB01            		EQU	RAM_START + 026h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00001	A00027	'*********************************************************************
PB02            		EQU	RAM_START + 027h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00001	A00028	'*********************************************************************
PB03            		EQU	RAM_START + 028h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00013	A00029	LCD_BuffLen     VAR WORD        ; Length of data in buffer
_LCD_BuffLen     		EQU	RAM_START + 029h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00134	A0002B	    Bazen1Ukljucen          var byte
_Bazen1Ukljucen  		EQU	RAM_START + 02Bh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00135	A0002C	    Bazen2Ukljucen          var byte
_Bazen2Ukljucen  		EQU	RAM_START + 02Ch
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00136	A0002D	    Bazen3Ukljucen          var byte   
_Bazen3Ukljucen  		EQU	RAM_START + 02Dh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00133	A0002E	    BrojMenija              var byte
_BrojMenija      		EQU	RAM_START + 02Eh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00137	A0002F	    countLevelA1            var byte
_countLevelA1    		EQU	RAM_START + 02Fh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00138	A00030	    countLevelA2            var byte 
_countLevelA2    		EQU	RAM_START + 030h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00141	A00031	    countLevelA23           var byte     
_countLevelA23   		EQU	RAM_START + 031h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00139	A00032	    countLevelA3            var byte
_countLevelA3    		EQU	RAM_START + 032h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00140	A00033	    countLevelA4            var byte
_countLevelA4    		EQU	RAM_START + 033h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00142	A00034	    countLevelB1            var byte  
_countLevelB1    		EQU	RAM_START + 034h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00143	A00035	    countLevelB2            var byte
_countLevelB2    		EQU	RAM_START + 035h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00146	A00036	    countLevelB23           var byte    
_countLevelB23   		EQU	RAM_START + 036h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00144	A00037	    countLevelB3            var byte
_countLevelB3    		EQU	RAM_START + 037h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00145	A00038	    countLevelB4            var byte
_countLevelB4    		EQU	RAM_START + 038h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00147	A00039	    countLevelC1            var byte  
_countLevelC1    		EQU	RAM_START + 039h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00148	A0003A	    countLevelC2            var byte
_countLevelC2    		EQU	RAM_START + 03Ah
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00151	A0003B	    countLevelC23           var byte
_countLevelC23   		EQU	RAM_START + 03Bh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00149	A0003C	    countLevelC3            var byte
_countLevelC3    		EQU	RAM_START + 03Ch
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00150	A0003D	    countLevelC4            var byte
_countLevelC4    		EQU	RAM_START + 03Dh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00015	A0003E	LCD_Byte        VAR BYTE        ; Nibbles to Send
_LCD_Byte        		EQU	RAM_START + 03Eh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00022	A0003F	LCD_Byte2       VAR BYTE        ; Same nibble without E bit
_LCD_Byte2       		EQU	RAM_START + 03Fh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00014	A00040	LCD_Data        VAR BYTE        ; Data to Send to LCD
_LCD_Data        		EQU	RAM_START + 040h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00023	A00041	LCD_Idx         VAR BYTE
_LCD_Idx         		EQU	RAM_START + 041h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00020	A00042	LCD_WriteMode   VAR BYTE        ; 1=LowNibble, 2=HighNibble, 3=Both
_LCD_WriteMode   		EQU	RAM_START + 042h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00024	A00043	testmode        var byte
_testmode        		EQU	RAM_START + 043h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00132	A00044	    x                       var byte
_x               		EQU	RAM_START + 044h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00130	A00045	    Displej                 var byte[7]'niz 7 bajtova Displej[0],Displej[1]...... 
_Displej         		EQU	RAM_START + 045h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00030	A00060	fsave0H     var WORD  BANK0  SYSTEM   ' locations for FSR registers
fsave0H         		EQU	RAM_START + 060h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00033	A00062	fsave0L     var WORD  BANK0  SYSTEM   ' low priority FSR locations
fsave0L         		EQU	RAM_START + 062h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00031	A00064	fsave1H     var WORD  BANK0  SYSTEM
fsave1H         		EQU	RAM_START + 064h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00034	A00066	fsave1L     var WORD  BANK0  SYSTEM
fsave1L         		EQU	RAM_START + 066h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00032	A00068	fsave2H     var WORD  BANK0  SYSTEM
fsave2H         		EQU	RAM_START + 068h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00035	A0006A	fsave2L     var WORD  BANK0  SYSTEM
fsave2L         		EQU	RAM_START + 06Ah
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00025	A0006C	bsave       var byte  BANK0  SYSTEM   ' location for BSR register
bsave           		EQU	RAM_START + 06Ch
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00028	A0006D	psaveH      VAR BYTE  BANK0  SYSTEM   ' PCLATH Hi Pri.
psaveH          		EQU	RAM_START + 06Dh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00029	A0006E	psaveL      VAR BYTE  BANK0  SYSTEM   '        Lo Pri.
psaveL          		EQU	RAM_START + 06Eh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00026	A0006F	psaveUH     VAR BYTE  BANK0  SYSTEM   ' PCLATU Hi Pri.
psaveUH         		EQU	RAM_START + 06Fh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00027	A00070	psaveUL     VAR BYTE  BANK0  SYSTEM   '        Lo Pri.
psaveUL         		EQU	RAM_START + 070h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00024	A00071	ssave       var byte  BANK0  SYSTEM   ' location for STATUS register
ssave           		EQU	RAM_START + 071h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00011	A00072	LCD_Buff        VAR BYTE[LCD_BuffSize]
_LCD_Buff        		EQU	RAM_START + 072h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00029	A00090	HP_Vars  VAR  WORD[34]        ; group vars together for less banking
_HP_Vars         		EQU	RAM_START + 090h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00030	    R0_SaveH      VAR HP_Vars[0]
_R0_SaveH        		EQU	_HP_Vars
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00031	    R1_SaveH      VAR HP_Vars[2]
_R1_SaveH        		EQU	_HP_Vars + 004h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00032	    R2_SaveH      VAR HP_Vars[4]
_R2_SaveH        		EQU	_HP_Vars + 008h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00033	    R3_SaveH      VAR HP_Vars[6]
_R3_SaveH        		EQU	_HP_Vars + 00Ch
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00034	    R4_SaveH      VAR HP_Vars[8]
_R4_SaveH        		EQU	_HP_Vars + 010h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00035	    R5_SaveH      VAR HP_Vars[9]
_R5_SaveH        		EQU	_HP_Vars + 012h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00036	    R6_SaveH      VAR HP_Vars[10]
_R6_SaveH        		EQU	_HP_Vars + 014h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00037	    R7_SaveH      VAR HP_Vars[11]
_R7_SaveH        		EQU	_HP_Vars + 016h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00038	    R8_SaveH      VAR HP_Vars[12]
_R8_SaveH        		EQU	_HP_Vars + 018h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00039	    Flag_GOP_H    VAR HP_Vars[13]
_Flag_GOP_H      		EQU	_HP_Vars + 01Ah
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00042	    RM_H          VAR HP_Vars[14]
_RM_H            		EQU	_HP_Vars + 01Ch
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00045	    RR_H          VAR HP_Vars[15]
_RR_H            		EQU	_HP_Vars + 01Eh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00048	    RS_H          VAR HP_Vars[16]
_RS_H            		EQU	_HP_Vars + 020h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00051	    T1_SaveH      VAR HP_Vars[17]
_T1_SaveH        		EQU	_HP_Vars + 022h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00052	    T2_SaveH      VAR HP_Vars[19]
_T2_SaveH        		EQU	_HP_Vars + 026h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00053	    T3_SaveH      VAR HP_Vars[21]
_T3_SaveH        		EQU	_HP_Vars + 02Ah
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00054	    T4_SaveH      VAR HP_Vars[23]
_T4_SaveH        		EQU	_HP_Vars + 02Eh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00055	    T5_SaveH      VAR HP_Vars[25]
_T5_SaveH        		EQU	_HP_Vars + 032h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00056	    T6_SaveH      VAR HP_Vars[27]
_T6_SaveH        		EQU	_HP_Vars + 036h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00057	    T7_SaveH      VAR HP_Vars[29]
_T7_SaveH        		EQU	_HP_Vars + 03Ah
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00058	    TBLPTRU_H     VAR HP_Vars[31]
_TBLPTRU_H       		EQU	_HP_Vars + 03Eh
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00060	    TBLPTR_H      VAR HP_Vars[32]
_TBLPTR_H        		EQU	_HP_Vars + 040h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00063	    Product_H     VAR HP_Vars[33]
_Product_H       		EQU	_HP_Vars + 042h
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00271	PORTL   VAR     PORTB
_PORTL           		EQU	 PORTB
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00272	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00273	TRISL   VAR     TRISB
_TRISL           		EQU	 TRISB
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00274	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00040	      Flags_SaveH   VAR Flag_GOP_H.lowbyte
_Flags_SaveH     		EQU	_Flag_GOP_H
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00041	      GOP_SaveH     VAR Flag_GOP_H.highbyte
_GOP_SaveH       		EQU	_Flag_GOP_H + 001h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00043	      RM1_SaveH     VAR RM_H.lowbyte
_RM1_SaveH       		EQU	_RM_H
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00044	      RM2_SaveH     VAR RM_H.highbyte
_RM2_SaveH       		EQU	_RM_H + 001h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00046	      RR1_SaveH     VAR RR_H.lowbyte
_RR1_SaveH       		EQU	_RR_H
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00047	      RR2_SaveH     VAR RR_H.highbyte
_RR2_SaveH       		EQU	_RR_H + 001h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00049	      RS1_SaveH     VAR RS_H.lowbyte
_RS1_SaveH       		EQU	_RS_H
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00050	      RS2_SaveH     VAR RS_H.highbyte
_RS2_SaveH       		EQU	_RS_H + 001h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00059	      TBLPTRU_SaveH VAR TBLPTRU_H.lowbyte
_TBLPTRU_SaveH   		EQU	_TBLPTRU_H
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00061	      TBLPTRH_SaveH VAR TBLPTR_H.highbyte
_TBLPTRH_SaveH   		EQU	_TBLPTR_H + 001h
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00062	      TBLPTRL_SaveH VAR TBLPTR_H.lowbyte
_TBLPTRL_SaveH   		EQU	_TBLPTR_H
_Flag_GOP_H??LOWBYTE		EQU	_Flag_GOP_H
_Flag_GOP_H??HIGHBYTE		EQU	_Flag_GOP_H + 001h
_RM_H??LOWBYTE   		EQU	_RM_H
_RM_H??HIGHBYTE  		EQU	_RM_H + 001h
_RR_H??LOWBYTE   		EQU	_RR_H
_RR_H??HIGHBYTE  		EQU	_RR_H + 001h
_RS_H??LOWBYTE   		EQU	_RS_H
_RS_H??HIGHBYTE  		EQU	_RS_H + 001h
_TBLPTRU_H??LOWBYTE		EQU	_TBLPTRU_H
_TBLPTR_H??HIGHBYTE		EQU	_TBLPTR_H + 001h
_TBLPTR_H??LOWBYTE		EQU	_TBLPTR_H
#define _Serviced_H      	_INT_Flags??0
#define _Serviced_L      	_INT_Flags??1
#define _InHPint         	_INT_Flags??2
#define _NoPriority      	_INT_Flags??3
#define _VarsSaved_H     	 PB03, 003h
#define _rs232Tx         	_PORTB??7
#define _rs232Rx         	_PORTB??6
#define _SDA             	_PORTD??6
#define _SCL             	_PORTD??7
#define _levelA1         	_PORTA??0
#define _levelA2         	_PORTA??1
#define _levelA3         	_PORTA??2
#define _levelA4         	_PORTA??3
#define _levelB1         	_PORTA??4
#define _levelB2         	_PORTA??5
#define _levelB3         	_PORTE??0
#define _levelB4         	_PORTE??1
#define _levelC1         	_PORTE??2
#define _levelC2         	_PORTC??2
#define _levelC3         	_PORTC??0
#define _levelC4         	_PORTC??1
#define _inputZ1         	_PORTA??6
#define _valveA          	_PORTC??6
#define _pumpA           	_PORTC??7
#define _valveB          	_PORTD??1
#define _pumpB           	_PORTD??0
#define _valveC          	_PORTD??2
#define _pumpC           	_PORTD??3
#define _tService        	_PORTB??0
#define _tUp             	_PORTB??1
#define _tDown           	_PORTB??2
#define _tRight          	_PORTB??3
#define _tOk             	_PORTB??4
#define _tLeft           	_PORTB??5
#define _output1         	_PORTD??4
#define _NovoStanjeDesno 	 PB01, 005h
#define _NovoStanjeLevo  	 PB02, 000h
#define _NovoStanjeGore  	 PB01, 007h
#define _NovoStanjeDole  	 PB01, 006h
#define _NovoStanjeOk    	 PB02, 001h
#define _NovoStanjeService	 PB02, 002h
#define _StaroStanjeDesno	 PB02, 005h
#define _StaroStanjeLevo 	 PB03, 000h
#define _StaroStanjeGore 	 PB02, 007h
#define _StaroStanjeDole 	 PB02, 006h
#define _StaroStanjeOk   	 PB03, 001h
#define _StaroStanjeService	 PB03, 002h
#define _gore            	 PB01, 002h
#define _dole            	 PB01, 001h
#define _levo            	 PB01, 004h
#define _desno           	 PB01, 000h
#define _ok              	 PB02, 003h
#define _Service         	 PB02, 004h
#define _LCD_RS          	_LCD_Byte??0
#define _LCD_RW          	_LCD_Byte??1
#define _LCD_E           	_LCD_Byte??2
#define _LCD_BackLight   	_LCD_Byte??3
#define _LCD_CommandMode 	 PB01, 003h
#define _INT_Flags??0    	 INT_Flags, 000h
#define _INT_Flags??1    	 INT_Flags, 001h
#define _INT_Flags??2    	 INT_Flags, 002h
#define _INT_Flags??3    	 INT_Flags, 003h
#define _PORTB??7        	 PORTB, 007h
#define _PORTB??6        	 PORTB, 006h
#define _PORTD??6        	 PORTD, 006h
#define _PORTD??7        	 PORTD, 007h
#define _PORTA??0        	 PORTA, 000h
#define _PORTA??1        	 PORTA, 001h
#define _PORTA??2        	 PORTA, 002h
#define _PORTA??3        	 PORTA, 003h
#define _PORTA??4        	 PORTA, 004h
#define _PORTA??5        	 PORTA, 005h
#define _PORTE??0        	 PORTE, 000h
#define _PORTE??1        	 PORTE, 001h
#define _PORTE??2        	 PORTE, 002h
#define _PORTC??2        	 PORTC, 002h
#define _PORTC??0        	 PORTC, 000h
#define _PORTC??1        	 PORTC, 001h
#define _PORTA??6        	 PORTA, 006h
#define _PORTC??6        	 PORTC, 006h
#define _PORTC??7        	 PORTC, 007h
#define _PORTD??1        	 PORTD, 001h
#define _PORTD??0        	 PORTD, 000h
#define _PORTD??2        	 PORTD, 002h
#define _PORTD??3        	 PORTD, 003h
#define _PORTB??0        	 PORTB, 000h
#define _PORTB??1        	 PORTB, 001h
#define _PORTB??2        	 PORTB, 002h
#define _PORTB??3        	 PORTB, 003h
#define _PORTB??4        	 PORTB, 004h
#define _PORTB??5        	 PORTB, 005h
#define _PORTD??4        	 PORTD, 004h
#define _INTCON2??7      	 INTCON2, 007h
#define _UCON??3         	 UCON, 003h
#define _UCFG??3         	 UCFG, 003h
#define _LCD_Byte??0     	_LCD_Byte, 000h
#define _LCD_Byte??1     	_LCD_Byte, 001h
#define _LCD_Byte??2     	_LCD_Byte, 002h
#define _LCD_Byte??3     	_LCD_Byte, 003h
#define _LCD_WriteMode??1	_LCD_WriteMode, 001h
#define _LCD_WriteMode??0	_LCD_WriteMode, 000h

; Constants.
_USBMEMORYADDRESS		EQU	00400h
_majorVer        		EQU	00001h
_revisionVer     		EQU	00001h
_tPause          		EQU	0012Ch
_Strelica        		EQU	0003Eh
_LCD_Addr        		EQU	0004Eh
_LCD_Addr2       		EQU	0004Eh
_rsMode          		EQU	0000Ch
_LCD_BuffSize    		EQU	0001Eh

; EEPROM data.


	INCLUDE	"LEVEL-METER.MAC"
	INCLUDE	"C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.LIB"


; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00036	#HEADER
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00252	BANKA   $0000, $005F
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00253	BANK0   $0060, $00FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00254	BANK1   $0100, $01FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00255	BANK2   $0200, $02FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00256	BANK3   $0300, $03FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00257	BANK4   $0400, $04FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00258	BANK5   $0500, $05FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00259	BANK6   $0600, $06FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00260	BANK7   $0700, $07FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00266	    INCLUDE "PBPPI18L.RAM"
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00267	#ELSE
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00268	    LIBRARY  "PBPPIC18"

; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00269	    INCLUDE "PBPPIC18.RAM"
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00270	#ENDIF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00275	USBMEMORYADDRESS Con	$400	' USB RAM starts here
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00279	#HEADER

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00013	    INCLUDE "DT_INTS-18.bas"     

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00018	DISABLE DEBUG
	DDISABLE?	
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00020	DEFINE  INTHAND       INT_ENTRY_H  ' Context saving for High Priority Ints
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00021	DEFINE  INTLHAND      INT_ENTRY_L  ' Context saving for Low Priority Ints

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00044	INT_Flags = 0 
	MOVE?CB	000h, INT_Flags

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00046	goto  OVER_DT_INTS_18
	GOTO?L	_OVER_DT_INTS_18

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00048	ASM

	ASM?

;____ Check for PBPL (PBP ver. 2.50 and above only)__________________________
PBPLongs_Used = 0
  if (R1 - R0 == 4)
PBPLongs_Used = 1
;    messg PBPL Used = 1
  endif

  nolist
;____ DEFINE available interrupt sources_____________________________________

  #define INT_INT   INTCON, INT0IF  ;-- INT External, 16F compatible
  #define INT0_INT  INTCON, INT0IF  ;-- INT0 External 
  #define INT1_INT  INTCON3,INT1IF  ;-- INT1 External 
  #define INT2_INT  INTCON3,INT2IF  ;-- INT2 External 
  #define INT3_INT  INTCON3,INT3IF  ;-- INT3 External 
  #define RBC_INT   INTCON, RBIF    ;-- RB Port Change 
  #define TMR0_INT  INTCON, TMR0IF  ;-- TMR0 Overflow  18F
  #define TMR1_INT  PIR1, TMR1IF    ;-- TMR1 Overflow 
  #define TMR2_INT  PIR1, TMR2IF    ;-- TMR2 to PR2 Match 
  #define TMR3_INT  PIR2, TMR3IF    ;-- TMR3 Overflow 
  #define TMR4_INT  PIR3, TMR4IF    ;-- TMR4 Overflow 
  #define TX_INT    PIR1, TXIF      ;-- USART Transmit 
  #define TX1_INT   PIR1, TX1IF     ;-- USART1 Transmit 
  #define TX2_INT   PIR3, TX2IF     ;-- USART2 Transmit 
  #define RX_INT    PIR1, RCIF      ;-- USART Receive 
  #define RX1_INT   PIR1, RC1IF     ;-- USART1 Receive 
  #define RX2_INT   PIR3, RC2IF     ;-- USART2 Receive 
  #define CMP_INT   PIR2, CMIF      ;-- Comparator 
  #define EE_INT    PIR2, EEIF      ;-- EEPROM/FLASH Write Operation 
  #define BUS_INT   PIR2, BCLIF     ;-- Bus Collision 
  #define LVD_INT   PIR2, LVDIF     ;-- Low Voltage Detect 
  #define HLVD_INT  PIR2, HLVDIF    ;-- High/Low Voltage Detect 
  #define PSP_INT   PIR1, PSPIF     ;-- Parallel Slave Port Read/Write 
  #define AD_INT    PIR1, ADIF      ;-- A/D Converter 
  #define SSP_INT   PIR1, SSPIF     ;-- Master Synchronous Serial Port 
  #define CCP1_INT  PIR1, CCP1IF    ;-- CCP1 
  #define CCP2_INT  PIR2, CCP2IF    ;-- CCP2 
  #define CCP3_INT  PIR3, CCP3IF    ;-- CCP3 
  #define CCP4_INT  PIR3, CCP4IF    ;-- CCP4 
  #define CCP5_INT  PIR3, CCP5IF    ;-- CCP5 
  #define OSC_INT   PIR2, OSCFIF    ;-- Oscillator Fail 

; -- Added for ver. 3.2 --
  #define SPP_INT   PIR1, SPPIF     ;-- Streaming Parallel Port Read/Write
  #define BUS1_INT  PIR2, BCL1IF    ;-- Bus 1 Collision 
  #define BUS2_INT  PIR3, BCL2IF    ;-- Bus 2 Collision
  #define ECCP1_INT PIR2, ECCP1IF   ;-- ECCP1
  #define LCD_INT   PIR3, LCDIF     ;-- LCD Driver
  #define PMP_INT   PIR1, PMPIF     ;-- Parallel Master Port
  #define SSP1_INT  PIR1, SSP1IF    ;-- Synchronous Serial Port 1
  #define SSP2_INT  PIR3, SSP2IF    ;-- Synchronous Serial Port 2
  #define TMR5_INT  PIR3, TMR5IF    ;-- Timer 5
  #define PT_INT    PIR3, PTIF      ;-- PWM Time Base
  #define IC1IF_INT  PIR3, IC1IF    ;-- Motion Feedback
  #define IC2QEIF_INT  PIR3, IC2QEIF  ;-- Motion Feedback
  #define IC3DRIF_INT  PIR3, IC3DRIF  ;-- Motion Feedback

;_____ Comparators __________________________________________________________
  #define CMP0_INT  PIR1, CMP0IF    ;-- Comparator 0 - 1230/1330 only

CMPIFREG = PIR2                     ;-- Comparator 1
CMPIEREG = PIE2
CMPIPREG = IPR2
    ifdef C1IF                      ;     18F24K20  18F25K20  18F26K20
CM1IFBIT = C1IF                     ;     18F44K20  18F45K20  18F46K20
    endif
    ifdef CM1IF
CM1IFBIT = CM1IF                    ;     several J PICs
    endif
    ifdef CMP1IF
CMPIFREG = PIR1                     ;     1230/1330 only
CM1IFBIT = CMP1IF
CMPIEREG = PIE1
CMPIPREG = IPR1
    endif

    ifdef CM1IFBIT
       #define CMP1_INT  CMPIFREG, CM1IFBIT     
    endif

    ifdef C2IF                      ;-- Comparator 2
CM2IFBIT = C2IF                     ;     18F24K20  18F25K20  18F26K20
    endif                           ;     18F44K20  18F45K20  18F46K20
    ifdef CM2IF
CM2IFBIT = CM2IF                    ;     several J PICs
    endif    
    ifdef CMP2IF
CM2IFBIT = CMP2IF                   ;     1230/1330 only
    endif    

    ifdef CM2IFBIT
      #define CMP2_INT  CMPIFREG, CM2IFBIT     
    endif

;_____ USB Module ___________________________________________________________

  #define USB_INT       PIR2, USBIF   ;-- USB Interrupt (funnel)
  #define USB_ACTV_INT  UIR,  ACTVIF  ;-- Bus Activity Detect 
  #define USB_ERR_INT   UIR,  UERRIF  ;-- USB Error Condition INT (funnel)
  #define USB_RST_INT   UIR,  URSTIF  ;-- USB Reset 
  #define USB_IDLE_INT  UIR,  IDLEIF  ;-- Idle Detect 
  #define USB_STALL_INT UIR,  STALLIF ;-- A STALL Handshake 
  #define USB_TRN_INT   UIR,  TRNIF   ;-- Transaction Complete 
  #define USB_SOF_INT   UIR,  SOFIF   ;-- START-OF-FRAME Token 

; -- USB Error Flags --
  #define USB_BTO_INT   UEIR, BTOEF   ;-- Bus Turnaround Time-out Error
  #define USB_BTS_INT   UEIR, BTSEF   ;-- Bit Stuff Error
  #define USB_CRC16_INT UEIR, CRC16EF ;-- CRC16 Failure
  #define USB_CRC5_INT  UEIR, CRC5EF  ;-- CRC5 Host Error
  #define USB_DFN8_INT  UEIR, DFN8EF  ;-- Data Field Size Error
  #define USB_PID_INT   UEIR, PIDEF   ;-- PID Check Failure
   
;_____ Ethernet Module ______________________________________________________
  #define ETH_INT       PIR2, ETHIF   ;-- Ethernet Module
  #define ETH_DMA_INT    EIR, DMAIF   ;-- DMA Interrupt
  #define ETH_LINK_INT   EIR, LINKIF  ;-- Link Status Change
  #define ETH_PKT_INT    EIR, PKTIF   ;-- Receive Packet Pending
  #define ETH_RXER_INT   EIR, RXERIF  ;-- Receive Error
  #define ETH_TXER_INT   EIR, TXERIF  ;-- Transmit Error
  #define ETH_TX_INT     EIR, TXIF    ;-- Transmit

;_____ CAN Module ___________________________________________________________
  #define CAN_ERR_INT    PIR3, ERRIF    ;-- CAN bus Error
  #define CAN_IRX_INT    PIR3, IRXIF    ;-- Invalid Received Message
  #define CAN_RXB0_INT   PIR3, RXB0IF   ;-* Receive Buffer 0      Mode 0
  #define CAN_FIFOWM_INT PIR3, FIFOWMIF ;-- FIFO Watermark        Mode 1, 2
  #define CAN_RXB1_INT   PIR3, RXB1IF   ;-* Receive Buffer 1      Mode 0
  #define CAN_RXBn_INT   PIR3, RXBnIF   ;-- Any Receive Buffer    Mode 1, 2
  #define CAN_TXB0_INT   PIR3, TXB0IF   ;-- Transmit Buffer 0
  #define CAN_TXB1_INT   PIR3, TXB1IF   ;-- Transmit Buffer 1
  #define CAN_TXB2_INT   PIR3, TXB2IF   ;-* Transmit Buffer 2     Mode 0
  #define CAN_TXBn_INT   PIR3, TXBnIF   ;-- Any Transmit Buffer   Mode 1, 2
  #define CAN_WAKE_INT   PIR3, WAKIF    ;-- CAN bus Activity Wake-up


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00185	asm

	ASM?

; -- macro --
INT_Source  macro  IFR, IFB, IER, IEB, IPR, IPB
    if (IflagReg == IFR) && (IflagBit == IFB)  
  list  
INT_Flag_Reg = IFR
INT_Flag_Bit = IFB
INT_Enable_Reg = IER
INT_Enable_Bit = IEB
INT_Priority_Reg = IPR
INT_Priority_Bit = IPB
Found = 1
    endif
  nolist  
    endm 


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00203	asm

	ASM?

;____________________________________________________________________________
GetIntInfo  macro  IflagReg, IflagBit
  nolist
INT_Flag_Reg = -1
INT_Flag_Bit = -1
INT_Enable_Reg = -1
INT_Enable_Bit = -1
  ifdef  IPR1
INT_Priority_Reg = -1
INT_Priority_Bit = -1
  endif
Found = 0

  ifdef INT0IF  ;----{ INT0 External Interrupt }----------[INTCON, INT0IF]---
      INT_Source  INTCON,INT0IF, INTCON,INT0IE, -1, -1
  endif
  ifdef INT1IF  ;----{ INT1 External Interrupt }---------[INTCON3, INT1IF]---
      INT_Source  INTCON3,INT1IF, INTCON3,INT1IE, INTCON3,INT1IP
  endif
  ifdef INT2IF  ;----{ INT2 External Interrupt }---------[INTCON3, INT2IF]---
      INT_Source  INTCON3,INT2IF, INTCON3,INT2IE, INTCON3,INT2IP
  endif
  ifdef INT3IF  ;----{ INT3 External Interrupt }---------[INTCON3, INT3IF]---
      INT_Source  INTCON3,INT3IF, INTCON3,INT3IE, INTCON2,INT3IP
  endif
  ifdef RBIF    ;----{ RB Port Change Interrupt }-----------[INTCON, RBIF]---
      INT_Source  INTCON,RBIF, INTCON, RBIE,INTCON2,RBIP
  endif
  ifdef TMR0IF  ;----{ TMR0 Overflow Interrupt }----------[INTCON, TMR0IF]---
      INT_Source  INTCON,TMR0IF, INTCON,TMR0IE, INTCON2,TMR0IP
  endif
  ifdef TMR1IF  ;----{ TMR1 Overflow Interrupt }------------[PIR1, TMR1IF]---
      INT_Source  PIR1,TMR1IF, PIE1,TMR1IE, IPR1,TMR1IP
  endif
  ifdef TMR2IF  ;----{ TMR2 to PR2 Match Interrupt }--------[PIR1, TMR2IF]---
      INT_Source  PIR1,TMR2IF, PIE1,TMR2IE, IPR1,TMR2IP
  endif
  ifdef TMR3IF  ;----{ TMR3 Overflow Interrupt }------------[PIR2, TMR3IF]---
      INT_Source  PIR2,TMR3IF, PIE2,TMR3IE, IPR2,TMR3IP
  endif
  ifdef TMR4IF  ;----{ TMR4 Overflow Interrupt }------------[PIR3, TMR4IF]---
      INT_Source  PIR3,TMR4IF, PIE3,TMR4IE, IPR3,TMR4IP
  endif
  ifndef TX1IF  ;----{ USART Transmit Interrupt }-------------[PIR1, TXIF]---
      ifdef TXIF
          INT_Source  PIR1,TXIF, PIE1,TXIE, IPR1,TXIP
      endif
  endif
  ifdef TX1IF   ;----{ USART1 Transmit Interrupt }-----------[PIR1, TX1IF]---
      INT_Source  PIR1,TX1IF, PIE1,TX1IE, IPR1,TX1IP
  endif
  ifdef TX2IF   ;----{ USART2 Transmit Interrupt }-----------[PIR3, TX2IF]---
      INT_Source  PIR3,TX2IF, PIE3,TX2IE, IPR3,TX2IP
  endif
  ifndef RC1IF  ;----{ USART Receive Interrupt }---------------[PIR1 RCIF]---  
    ifdef RCIF
        INT_Source  PIR1,RCIF, PIE1,RCIE, IPR1,RCIP
    endif
  endif
  ifdef RC1IF   ;----{ USART1 Receive Interrupt }------------[PIR1, RC1IF]---
      INT_Source  PIR1,RC1IF, PIE1,RC1IE, IPR1,RC1IP
  endif
  ifdef RC2IF   ;----{ USART2 Receive Interrupt }------------[PIR3, RC2IF]---
      INT_Source  PIR3,RC2IF, PIE3,RC2IE, IPR3,RC2IP
  endif
  ifdef CMIF    ;----{ Comparator Interrupt }-----------------[PIR2, CMIF]---
      INT_Source  PIR2,CMIF, PIE2,CMIE, IPR2,CMIP
  endif
  ifdef EEIF    ;----{ EEPROM/FLASH Write Operation Interrupt [PIR2, EEIF]---
      INT_Source  PIR2,EEIF, PIE2,EEIE, IPR2,EEIP
  endif
  ifdef BCLIF   ;----{ Bus Collision Interrupt }-------------[PIR2, BCLIF]---
      INT_Source  PIR2,BCLIF, PIE2,BCLIE, IPR2,BCLIP
  endif
  ifdef LVDIF   ;----{ Low Voltage Detect Interrupt }--------[PIR2, LVDIF]---
      INT_Source  PIR2,LVDIF, PIE2,LVDIE, IPR2,LVDIP
  endif
  ifdef HLVDIF  ;----{ High/Low Voltage Detect Interrupt }--[PIR2, HLVDIF]---
      INT_Source  PIR2,HLVDIF, PIE2,HLVDIE, IPR2,HLVDIP
  endif
  ifdef PSPIF   ;----{ Parallel Slave Port Interrupt }-------[PIR1, PSPIF]---
      INT_Source  PIR1,PSPIF, PIE1,PSPIE, IPR1,PSPIP
  endif
  ifdef ADIF    ;----{ A/D Converter Interrupt }--------------[PIR1, ADIF]---
      INT_Source  PIR1,ADIF, PIE1,ADIE, IPR1,ADIP
  endif
  ifdef SSPIF   ;----{ Synchronous Serial Port Interrupt }---[PIR1, SSPIF]---
      INT_Source  PIR1,SSPIF, PIE1,SSPIE, IPR1,SSPIP
  endif
  ifdef CCP1IF  ;----{ CCP1 Interrupt }---------------------[PIR1, CCP1IF]---
      INT_Source  PIR1,CCP1IF, PIE1,CCP1IE, IPR1,CCP1IP
  endif
  ifdef CCP2IF  ;----{ CCP2 Interrupt Flag }----------------[PIR2, CCP2IF]---
      INT_Source  PIR2,CCP2IF, PIE2,CCP2IE, IPR2,CCP2IP
  endif
  ifdef CCP3IF  ;----{ CCP3 Interrupt Flag }----------------[PIR3, CCP3IF]---
      INT_Source  PIR3,CCP3IF, PIE3,CCP3IE, IPR3,CCP3IP
  endif
  ifdef CCP4IF  ;----{ CCP4 Interrupt Flag }----------------[PIR3, CCP4IF]---
      INT_Source  PIR3,CCP4IF, PIE3,CCP4IE, IPR3,CCP4IP
  endif
  ifdef CCP5IF  ;----{ CCP5 Interrupt Flag }----------------[PIR3, CCP5IF]---
      INT_Source  PIR3,CCP5IF, PIE3,CCP5IE, IPR3,CCP5IP
  endif
  ifdef OSCFIF  ;----{ Osc Fail  Interrupt Flag }-----------[PIR2, OSCFIF]---
      INT_Source  PIR2,OSCFIF, PIE2,OSCFIE, IPR2,OSCFIP
  endif


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00313	asm

	ASM?

; -- Added for ver. 3.2 --
  ifdef SPPIF   ;----{ Streaming Parallel Port Read/Write }--[PIR1, SPPIF]---
      INT_Source  PIR1,SPPIF, PIE1,SPPIE, IPR1,SPPIP
  endif
  ifdef BCL1IF  ;----{ Bus 1 Collision }--------------------[PIR2, BCL1IF]---
      INT_Source  BUS1_INT, PIE2,BCL1IE, IPR2,BCL1IP
  endif
  ifdef BCL2IF  ;----{ Bus 2 Collision }--------------------[PIR3, BCL2IF]---
      INT_Source  BUS2_INT, PIE3,BCL2IE, IPR3,BCL2IP
  endif
  ifdef CMP0IF  ;----{ Comparator 0 }-----------------------[PIR1, CMP0IF]---
      INT_Source  CMP0_INT, PIE1,CMP0IE, IPR1,CMP0IP
  endif
  ifdef CM1IFBIT  ;--{ Comparator 1 }-----------------------------[varies]---
      INT_Source  CMP1_INT, CMPIEREG,CM1IFBIT, CMPIPREG,CM1IFBIT
  endif
  ifdef CM2IFBIT  ;--{ Comparator 2 }-----------------------------[varies]---
      INT_Source  CMP2_INT, CMPIEREG,CM2IFBIT, CMPIPREG,CM2IFBIT
  endif
  ifdef ECCP1IF  ;---{ ECCP1 }-----------------------------[PIR2, ECCP1IF]---
      INT_Source  ECCP1_INT, PIE2,ECCP1IE, IPR2,ECCP1IP
  endif
  ifdef LCDIF   ;----{ LCD Driver }--------------------------[PIR3, LCDIF]---
      INT_Source  LCD_INT, PIE3,LCDIE, IPR3,LCDIP
  endif
  ifdef PMPIF   ;----{ Parallel Master Port }----------------[PIR1, PMPIF]---
      INT_Source  PMP_INT, PIE1,PMPIE, IPR1,PMPIP
  endif
  ifdef SSP1IF  ;----{ Synchronous Serial Port 1 }----------[PIR1, SSP1IF]---
      INT_Source  SSP1_INT, PIE1,SSP1IE, IPR1,SSP1IP
  endif
  ifdef SSP2IF  ;----{ Synchronous Serial Port 2 }----------[PIR3, SSP2IF]---
      INT_Source  SSP2_INT, PIE3,SSP2IE, IPR3,SSP2IP
  endif
  ifdef TMR5IF  ;----{ Timer 5 }----------------------------[PIR3, TMR5IF]---
      INT_Source  TMR5_INT, PIE3,TMR5IE, IPR3,TMR5IP
  endif
  ifdef PTIF    ;----{ PWM Time Base }------------------------[PIR3, PTIF]---
      INT_Source  PT_INT, PIE3,PTIE, IPR3,PTIP
  endif
  ifdef IC1IF   ;----{ Motion Feedback IC1}------------------[PIR3, IC1IF]---
      INT_Source  IC1IF_INT, PIE3,IC1IE, IPR3,IC1IP
  endif
  ifdef IC2QEIF ;----{ Motion Feedback IC2QE}--------------[PIR3, IC2QEIF]---
      INT_Source  IC2QEIF_INT, PIE3,IC2QEIE, IPR3,IC2QEIP
  endif
  ifdef IC3DRIF ;----{ Motion Feedback IC3DR}--------------[PIR3, IC3DRIF]---
      INT_Source  IC3DRIF_INT, PIE3,IC3DRIE, IPR3,IC3DRIP
  endif
  
;  ifdef   ;----{  }-------------[, ]---
;      INT_Source  , ,, ,
;  endif


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00369	asm  ; -- USB sources --

	ASM?
  ; -- USB sources --
  ifdef USBIF   ;----{ USB  Interrupt funnel }---------------[PIR2, USBIF]---
      INT_Source  PIR2,USBIF, PIE2,USBIE, IPR2,USBIP
          
                ;----{ Bus Activity Detect }-----------------[UIR, ACTVIF]---
      INT_Source  USB_ACTV_INT, UIE,ACTVIE, _NoPriority
  
                ;----{ USB Reset }---------------------------[UIR, URSTIF]---
      INT_Source  USB_RST_INT, UIE,URSTIE, _NoPriority
  
                ;----{ Idle Detect }-------------------------[UIR, IDLEIF]---
      INT_Source  USB_IDLE_INT, UIE,IDLEIE, _NoPriority
  
                ;----{ A STALL Handshake }------------------[UIR, STALLIF]---
      INT_Source  USB_STALL_INT, UIE,STALLIE, _NoPriority
  
                ;----{ Transaction Complete }-----------------[UIR, TRNIF]---
      INT_Source  USB_TRN_INT, UIE,TRNIE, _NoPriority
  
                ;----{ START-OF-FRAME Token }-----------------[UIR, SOFIF]---
      INT_Source  USB_SOF_INT, UIE,SOFIE, _NoPriority
  
; -- USB Error Flags --
                ;----{ USB Error Condition Int funnel }------[UIR, UERRIF]---
      INT_Source  USB_ERR_INT, UIE,UERRIE, _NoPriority
   
                ;----{ Bus Turnaround Time-out Error }-------[UEIR, BTOEF]---
      INT_Source  USB_BTO_INT, UEIE,BTOEE, _NoPriority
   
                ;----{ Bit Stuff Error }---------------------[UEIR, BTSEF]---
      INT_Source  USB_BTS_INT, UEIE,BTSEE, _NoPriority
   
                ;--{ CRC16 Failure }-----------------------[UEIR, CRC16EF]---
      INT_Source  USB_CRC16_INT, UEIE,CRC16EE, _NoPriority
   
                ;---{ CRC5 Host Error }---------------------[UEIR, CRC5EF]---
      INT_Source  USB_CRC5_INT, UEIE,CRC5EE, _NoPriority
   
                ;---{ Data Field Size Error }---------------[UEIR, DFN8EF]---
      INT_Source  USB_DFN8_INT, UEIE,DFN8EE, _NoPriority
   
                ;----{ PID Check Failure }-------------------[UEIR, PIDEF]---
      INT_Source  USB_PID_INT, UEIE,PIDEE, _NoPriority
  endif


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00415	asm  ; -- Ethernet sources --

	ASM?
  ; -- Ethernet sources --
  ifdef ETHIF  ;----{ Ethernet Module }----------------------[PIR2, ETHIF]---
      INT_Source  ETH_INT, PIE2,ETHIE, IPR2,ETHIP
   
               ;----{ DMA Interrupt }-------------------------[EIR, DMAIF]---
      INT_Source  ETH_DMA_INT, EIE,DMAIE, _NoPriority
   
               ;----{ Link Status Change }-------------------[EIR, LINKIF]---
      INT_Source  ETH_LINK_INT, EIE,LINKIE, _NoPriority
   
               ;----{ Receive Packet Pending }----------------[EIR, PKTIF]---
      INT_Source  ETH_PKT_INT, EIE,PKTIE, _NoPriority
   
               ;----{ Receive Error }------------------------[EIR, RXERIF]---
      INT_Source  ETH_RXER_INT, EIE,RXERIE, _NoPriority
              
               ;----{ Transmit Error }-----------------------[EIR, TXERIF]---
      INT_Source  ETH_TXER_INT, EIE,TXERIE, _NoPriority
   
               ;----{ Transmit }-------------------------------[EIR, TXIF]---
      INT_Source  ETH_TX_INT, EIE,TXIE, _NoPriority
  endif


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00439	asm  ; -- CAN Module --

	ASM?
  ; -- CAN Module --
  ifdef WAKIF  
               ;----{ CAN bus Error }------------------------[PIR3, ERRIF]---
      INT_Source  CAN_ERR_INT, PIE3,ERRIE, IPR3,ERRIP
  
               ;----{ Invalid Received Message }-------------[PIR3, IRXIF]---
      INT_Source  CAN_IRX_INT, PIE3,IRXIE, IPR3,IRXIP
  
               ;----{ Receive Buffer 0 }------Mode 0--------[PIR3, RXB0IF]---
      INT_Source  CAN_RXB0_INT, PIE3,RXB0IE, IPR3,RXB0IP
               ;----{ FIFO Watermark }--------Mode 1, 2---[PIR3, FIFOWMIF]---
      INT_Source  CAN_FIFOWM_INT, PIE3,FIFOWMIE, IPR3,FIFOWMIP
  
               ;----{ Receive Buffer 1 }------Mode 0--------[PIR3, RXB1IF]---
      INT_Source  CAN_RXB1_INT, PIE3,RXB1IE, IPR3,RXB1IP
               ;----{ Any Receive Buffer }----Mode 1, 2-----[PIR3, RXBnIF]---
      INT_Source  CAN_RXBn_INT, PIE3,RXBnIE, IPR3,RXBnIP
  
               ;----{ Transmit Buffer 0 }-------------------[PIR3, TXB0IF]---
      INT_Source  CAN_TXB0_INT, PIE3,TXB0IE, IPR3,TXB0IP
  
               ;----{ Transmit Buffer 1 }-------------------[PIR3, TXB1IF]---
      INT_Source  CAN_TXB1_INT, PIE3,TXB1IE, IPR3,TXB1IP
  
               ;----{ Transmit Buffer 2 }-----Mode 0=-------[PIR3, TXB2IF]---
      INT_Source  CAN_TXB2_INT, PIE3,TXB2IE, IPR3,TXB2IP
               ;----{ Any Transmit Buffer }---Mode 1, 2-----[PIR3, TXBnIF]---
      INT_Source  CAN_TXBn_INT, PIE3,TXBnIE, IPR3,TXBnIP
  
               ;----{ CAN bus Activity Wake-up }-------------[PIR3, WAKIF]---
      INT_Source  CAN_WAKE_INT, PIE3,WAKIE, IPR3,WAKIP
  endif
  
  list
    endm
  list  


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00478	ASM

	ASM?

    ifndef  USE_LOWPRIORITY
INT_ENTRY_L
        retfie
    else
        if (USE_LOWPRIORITY != 1)
INT_ENTRY_L
            retfie
        endif
    endif        


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00491	Asm

	ASM?

asm = 0    ; Assembly language Interrupts
ASM = 0
Asm = 0
pbp = 1    ; Basic language interrupts
PBP = 1
Pbp = 1
YES = 1
yes = 1
Yes = 1
NO = 0
no = 0
No = 0
H equ 'H'  ; High Priority
h equ 'H'
L equ 'L'  ; Low Priority
l equ 'L'

  nolist
  
;_____________________________________________________________________________
SaveFSR  macro  F, Pr
  list
    if (F >= 0) && (F <= 2)
        if (Pr == H) || (Pr == L)
            movff    FSR#v(F)L, fsave#v(F)Pr
            movff    FSR#v(F)H, fsave#v(F)Pr + 1
          nolist
        else
            ERROR "SaveFSR - Invalid Priority"
        endif
    else
        ERROR "SaveFSR - Invalid FSR number"
    endif
    list
  endm


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00530	Asm

	ASM?

RestFSR  macro  F, Pr
  list
    if (F >= 0) && (F <= 2)
        if (Pr == H) || (Pr == L)
            movff    fsave#v(F)Pr , FSR#v(F)L
            movff    fsave#v(F)Pr + 1 , FSR#v(F)H 
          nolist
        else
            ERROR "RestFSR - Invalid Priority"
        endif
    else
        ERROR "RestFSR - Invalid FSR number"
    endif
    list
  endm


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00549	Asm

	ASM?

INT_FINISH_H   macro
  endm


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00555	ASM

	ASM?

INT_CREATE_H  macro
  local OverCREATE
    goto OverCREATE
Priority = H    
INT_ENTRY_H  
    movff   PCLATU, psaveUH
    movff   PCLATH, psaveH
    SaveFSR  0, H
    SaveFSR  1, H
    SaveFSR  2, H
    bsf      _InHPint, 0
List_Start_H
    bcf      _Serviced_H, 0         ; Clear Serviced flag
    clrf  BSR
PREV_BANK = 0
    ifdef INT_LIST_H
        INT_LIST_H                  ; Expand the users list of HP INT handlers
    else
        ifdef INT_LIST
            INT_LIST                ; Expand the 16F Compatible List
        else
            error "INT_CREATE_H - INT_LIST or INT_LIST_H not found"
        endif
    endif
    btfsc    _Serviced_H,0          ; if anything was serviced
    goto     List_Start_H           ; go around, and check again

    ifdef ReEnterHPused             ; was ReEnterPBP-18.bas included
        GetAddress21  INT_EXIT_H, RetAddrH
        L?GOTO   _RestorePBP_H      ; Restore PBP system Vars
    endif

INT_EXIT_H
PREV_BANK = 0
    bcf      _InHPint, 0
    RestFSR  0, H                   ; Restore FSR0, if it was saved?
    RestFSR  1, H                   ; Restore FSR1, if it was saved?
    RestFSR  2, H                   ; Restore FSR2, if it was saved?
    movff    psaveH, PCLATH
    movff    psaveUH, PCLATU
    retfie    FAST                  ; Return from Interrupt
OverCREATE
    bsf   INTCON,GIE, 0             ; Enable High Priority Interrupts
    bsf   INTCON,PEIE, 0            ; Enable Peripheral Interrupts
  endm

;---[Stay compatible with the 14-bit version]---------------------------------
INT_CREATE  macro
    INT_CREATE_H
  endm


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00609	ASM

	ASM?

INT_CREATE_L  macro
  local OverCREATE
    goto OverCREATE
    ifdef USE_LOWPRIORITY
        if (USE_LOWPRIORITY != 1)
       error "'DEFINE USE_LOWPRIORITY 1' required for Low Priority Interrupts"
        endif
    else
       error "'DEFINE USE_LOWPRIORITY 1' required for Low Priority Interrupts"
    endif
Priority = L
INT_ENTRY_L  
    movff   WREG, wsave             ; Wreg
    movff   STATUS, ssave           ; STATUS
    movff   BSR, bsave              ; BSR
    movff   PCLATU, psaveUL
    movff   PCLATH, psaveL
    SaveFSR  0, L                   ; FSR0
    SaveFSR  1, L                   ; FSR1
    SaveFSR  2, L                   ; FSR2
    bcf      _InHPint, 0    
List_Start_L
  clrf  BSR
PREV_BANK = 0
    bcf      _Serviced_L, 0
    ifdef INT_LIST_L
        INT_LIST_L                  ; Expand the users list of HP INT handlers
    else
        error "INT_CREATE_L - INT_LIST_L not defined, can not create"
    endif
    btfsc    _Serviced_L, 0         ; if anything was serviced
    goto     List_Start_L           ; go around, and check again

    ifdef ReEnterLPused             ; was ReEnterPBP-18LP.bas included
        GetAddress21  INT_EXIT_L, RetAddrL
        L?GOTO   _RestorePBP_L      ; Restore PBP system Vars
    endif

INT_EXIT_L
PREV_BANK = 0
    RestFSR  0, L                   ; Restore saved vars
    RestFSR  1, L
    RestFSR  2, L                
    movff   psaveUL, PCLATU
    movff   psaveL, PCLATH
    movff   bsave, BSR              ; BSR
    movff   wsave, WREG             ; WREG
    movff   ssave, STATUS           ; STATUS
    retfie                          ; Return from Interrupt
OverCREATE
    bsf   RCON,IPEN, 0              ; Enable Interrupt Priorities
    bsf   INTCON,GIEL, 0            ; Enable Low Priority Interrupts
  endm


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00665	ASM

	ASM?

;---[Returns the Address of a Label as a Word]--(under 64K)------------------
GetAddress macro Label, Wout
    CHK?RP Wout
    movlw low Label          ; get low byte
    movwf Wout
    movlw High Label         ; get high byte
    movwf Wout + 1
    endm

;---[Returns the Address of a Label as a 3 byte array]---(under/over 64k)-----
GetAddress21 macro Label, Aout
    CHK?RP Aout
    movlw low Label          ; get low byte
    movwf Aout
    movlw high Label         ; get high byte
    movwf Aout + 1
    movlw upper Label        ; get upper byte
    movwf Aout + 2
    endm

;---[find correct bank for a PBP BIT variable]-------------------------------
CHKRP?T  macro reg, bit
        CHK?RP  reg
    endm
    


;---[find Assigned Priority for specified INT Source]------------------------
INT_Count = 0

FindIntPriority  macro IntFlagReg, IntFlagBit
  local LoopCount
    nolist
Pfound = 0
LoopCount = 1
      while LoopCount <= INT_Count
          if  (IntFlagReg == PrList#v(LoopCount)R)
             if (IntFlagBit == PrList#v(LoopCount)B)
  list
Priority =  PrList#v(LoopCount)Priority
Pfound = 1
             endif
          endif
LoopCount += 1
      endw
  endm  


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00714	ASM

	ASM?


;---[Add an Interrupt Source to the user's list of INT Handlers]--------------
INT_Handler  macro  IntFlagReg, IntFlagBit, Label, Type, Reset
  list
    local AfterSave, AfterUser, NoInt
INT_Count += 1
PrList#v(INT_Count)R = IntFlagReg
PrList#v(INT_Count)B = IntFlagBit
PrList#v(INT_Count)Priority = Priority
        GetIntInfo   IntFlagReg, IntFlagBit
        if (Found == YES)
            btfss    INT_Enable_Reg, INT_Enable_Bit, 0  ; if INT is enabled
            goto   NoInt
            btfss    INT_Flag_Reg, INT_Flag_Bit, 0      ; and the Flag set?
            goto     NoInt
            if (Priority == H)
                bsf      _Serviced_H, 0
            else
                bsf      _Serviced_L, 0
            endif
            ifdef NO_CLRWDT
                if  (NO_CLRWDT != 1)
                    CLRWDT
                endif
            else
                CLRWDT
            endif
                
            if (Type == PBP)                         ; If INT handler is PBP
              if (Priority == H)
                ifdef ReEnterHPused
                    GetAddress21  AfterSave, RetAddrH  
                    L?GOTO  _SavePBP_H        ; Save PBP system Vars in HP INT
                else
    error "ReEnterPBP-18 must be INCLUDEd to use High Priority PBP interrupts"
                endif
              else ; Priority = L
                ifdef ReEnterLPused
                    GetAddress21  AfterSave, RetAddrL  
                    L?GOTO  _SavePBP_L        ; Save PBP system Vars in LP INT
                else
   error "ReEnterPBP-18LP must be INCLUDEd to use Low Priority PBP interrupts"
                endif
              endif
            endif
AfterSave
PREV_BANK = 0
            if (Priority == H)
                  GetAddress21  AfterUser, RetAddrH  
            else ; Priority = L
                  GetAddress21  AfterUser, RetAddrL
            endif  
            L?GOTO   Label                        ; goto the users INT handler
                    
AfterUser
PREV_BANK = 0
            if (Reset == YES)                      ; reset flag (if specified)
                bcf      INT_Flag_Reg, INT_Flag_Bit, 0 
            endif
        else
            error Interrupt Source (IntFlagReg,IntFlagBit) not found
        endif
NoInt
    clrf  BSR
PREV_BANK = 0
    endm


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00783	asm

	ASM?

;---[Returns from a "goto" subroutine]--(21-bit RetAddr? must be set first)---
INT_RETURN  macro
  local Ret2LP, Ret2HP
      btfsc   _InHPint, 0
      goto    Ret2HP
Ret2LP
      movff   RetAddrL + 2, PCLATU  ; Load PC buffers with return address
      movff   RetAddrL + 1, PCLATH
      movf    RetAddrL, W, 0
    clrf  BSR                    ; Set to BANK0 before returning
PREV_BANK = 0                    ; Tell PBP about the BANK change
      movwf   PCL, 0             ; Go back to where we were
      
Ret2HP       
      movff   RetAddrH + 2, PCLATU ; Load PC buffers with return address
      movff   RetAddrH + 1, PCLATH
      movf    RetAddrH, W, 0
    clrf  BSR                    ; Set to BANK0 before returning
PREV_BANK = 0                    ; Tell PBP about the BANK change
      movwf   PCL, 0             ; Go back to where we were
    endm    
    
;---[Enable an interrupt source]----------------------------------------------
INT_ENABLE  macro  IntFlagReg, IntFlagBit
      GetIntInfo   IntFlagReg, IntFlagBit
      if (Found == YES)
          FindIntPriority  IntFlagReg, IntFlagBit
          if (Pfound == 1)
              if (INT_Priority_Reg != -1)
                  if (Priority == H)
                      bsf  INT_Priority_Reg, INT_Priority_Bit, 0
                  else
                      if (Priority == L)
                          bcf  INT_Priority_Reg, INT_Priority_Bit, 0
                      else
                          error "INT_ENABLE - Invalid Priority Specified"
                      endif
                  endif
              else
                  if (Priority == L)
                      error "INT0_INT can NOT be assigned to Low Priority"
                  endif
              endif
          else
              error "INT_ENABLE - Priority State Not Found"
          endif
;          bcf     INT_Flag_Reg, INT_Flag_Bit, 0        ; clear the flag first 
          bsf     INT_Enable_Reg, INT_Enable_Bit, 0    ; enable the INT source  
      else
          error  "INT_ENABLE - Interrupt Source not found!"
      endif
    endm    

;---[Disable an interrupt source]---------------------------------------------
INT_DISABLE  macro  IntFlagReg, IntFlagBit
      GetIntInfo   IntFlagReg, IntFlagBit
      if (Found == YES)
          bcf     INT_Enable_Reg, INT_Enable_Bit, 0   ; disable the INT source  
      else
          error "INT_DISABLE - Interrupt Source not found!"
      endif
    endm    

;---[Clear an interrupt Flag]-------------------------------------------------
INT_CLEAR  macro  IntFlagReg, IntFlagBit
      GetIntInfo   IntFlagReg, IntFlagBit
      if (Found == YES)
          bcf     INT_Flag_Reg, INT_Flag_Bit, 0       ; clear the INT flag
      else
          error "INT_CLEAR -  Interrupt Source not found!"
      endif
    endm



	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00860	ASM

	ASM?

Save_TBLPTR = 0

    ifdef SIN_USED
Save_TBLPTR = 1
    endif
    ifdef DTMFOUT_USED
Save_TBLPTR = 1
    endif
    ifdef SERDELAY_USED
Save_TBLPTR = 1
    endif
    ifdef CONVBIT_USED
Save_TBLPTR = 1
    endif
    ifdef ERASECODE_USED
Save_TBLPTR = 1
    endif
    ifdef READCODE_USED
Save_TBLPTR = 1
    endif
    ifdef WRITECODE_USED
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?BCLB
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?BCLT
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?BCLW
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?CCLB
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?CCLT
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?CCLW
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?WCLB
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?WCLT
Save_TBLPTR = 1
    endif
    ifdef LOOKDOWN?WCLW
Save_TBLPTR = 1
    endif
    ifdef LOOK2_USED 
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?BCLB
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?BCLT
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?BCLW
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?CCLB
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?CCLT
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?CCLW
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?TCLB
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?TCLT
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?TCLW
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?WCLB
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?WCLT
Save_TBLPTR = 1
    endif
    ifdef LOOKUP?WCLW
Save_TBLPTR = 1
    endif


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00952	OVER_DT_INTS_18:

	LABEL?L	_OVER_DT_INTS_18	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\DT_INTS-18.BAS	00954	ENABLE DEBUG
	DENABLE?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00014	    include "ReEnterPBP-18.bas"  

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00020	DISABLE DEBUG
	DDISABLE?	
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00022	DEFINE   ReEnterHPused  1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00024	VarsSaved_H = 0
	MOVE?CT	000h, _VarsSaved_H

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00026	goto OverReEnterH
	GOTO?L	_OverReEnterH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00065	SavePBP_H:               ' Save all PBP system Vars High Priority

	LABEL?L	_SavePBP_H	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00066	  if VarsSaved_H = 0 then
	CMPNE?TCL	_VarsSaved_H, 000h, L00001

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00067	    R0_SaveH = R0
	MOVE?WW	R0, _R0_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00068	    R1_SaveH = R1
	MOVE?WW	R1, _R1_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00069	    R2_SaveH = R2
	MOVE?WW	R2, _R2_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00070	    R3_SaveH = R3
	MOVE?WW	R3, _R3_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00071	    asm

	ASM?

        if (PBPLongs_Used == 1)
            MOVE?WW  R0+2, _R0_SaveH+2
            MOVE?WW  R1+2, _R1_SaveH+2
            MOVE?WW  R2+2, _R2_SaveH+2
            MOVE?WW  R3+2, _R3_SaveH+2
        endif
    

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00079	    R4_SaveH = R4
	MOVE?WW	R4, _R4_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00080	    R5_SaveH = R5
	MOVE?WW	R5, _R5_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00081	    R6_SaveH = R6
	MOVE?WW	R6, _R6_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00082	    R7_SaveH = R7
	MOVE?WW	R7, _R7_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00083	    R8_SaveH = R8
	MOVE?WW	R8, _R8_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00084	    Flags_SaveH = FLAGS
	MOVE?BB	FLAGS, _Flags_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00085	    GOP_SaveH = GOP
	MOVE?BB	GOP, _GOP_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00086	    RM1_SaveH = RM1
	MOVE?BB	RM1, _RM1_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00087	    RM2_SaveH = RM2
	MOVE?BB	RM2, _RM2_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00088	    RR1_SaveH = RR1
	MOVE?BB	RR1, _RR1_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00089	    RR2_SaveH = RR2
	MOVE?BB	RR2, _RR2_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00090	@ if Save_TBLPTR == 1

	ASM?
 if Save_TBLPTR == 1

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00091	    TBLPTRU_SaveH = TBLPTRU
	MOVE?BB	TBLPTRU, _TBLPTRU_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00092	    TBLPTRH_SaveH = TBLPTRH
	MOVE?BB	TBLPTRH, _TBLPTRH_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00093	    TBLPTRL_SaveH = TBLPTRL
	MOVE?BB	TBLPTRL, _TBLPTRL_SaveH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00094	@ endif

	ASM?
 endif

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00095	    ASM

	ASM?

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
    

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00148	    VarsSaved_H = 1
	MOVE?CT	001h, _VarsSaved_H

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00149	  endif
	LABEL?L	L00001	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00150	@ INT_RETURN

	ASM?
 INT_RETURN

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00152	RestorePBP_H:

	LABEL?L	_RestorePBP_H	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00153	  if VarsSaved_H = 1 then
	CMPNE?TCL	_VarsSaved_H, 001h, L00003

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00154	    R0 = R0_SaveH
	MOVE?WW	_R0_SaveH, R0

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00155	    R1 = R1_SaveH
	MOVE?WW	_R1_SaveH, R1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00156	    R2 = R2_SaveH
	MOVE?WW	_R2_SaveH, R2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00157	    R3 = R3_SaveH
	MOVE?WW	_R3_SaveH, R3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00158	    asm

	ASM?

        if (PBPLongs_Used == 1)
            MOVE?WW  _R0_SaveH+2, R0+2
            MOVE?WW  _R1_SaveH+2, R1+2 
            MOVE?WW  _R2_SaveH+2, R2+2 
            MOVE?WW  _R3_SaveH+2, R3+2 
        endif
    

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00166	    R4 = R4_SaveH
	MOVE?WW	_R4_SaveH, R4

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00167	    R5 = R5_SaveH
	MOVE?WW	_R5_SaveH, R5

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00168	    R6 = R6_SaveH
	MOVE?WW	_R6_SaveH, R6

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00169	    R7 = R7_SaveH
	MOVE?WW	_R7_SaveH, R7

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00170	    R8 = R8_SaveH
	MOVE?WW	_R8_SaveH, R8

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00171	    FLAGS = Flags_SaveH
	MOVE?BB	_Flags_SaveH, FLAGS

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00172	    GOP = GOP_SaveH
	MOVE?BB	_GOP_SaveH, GOP

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00173	    RM1 = RM1_SaveH
	MOVE?BB	_RM1_SaveH, RM1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00174	    RM2 = RM2_SaveH
	MOVE?BB	_RM2_SaveH, RM2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00175	    RR1 = RR1_SaveH
	MOVE?BB	_RR1_SaveH, RR1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00176	    RR2 = RR2_SaveH
	MOVE?BB	_RR2_SaveH, RR2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00177	@ if Save_TBLPTR == 1

	ASM?
 if Save_TBLPTR == 1

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00178	    TBLPTRU = TBLPTRU_SaveH
	MOVE?BB	_TBLPTRU_SaveH, TBLPTRU

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00179	    TBLPTRH = TBLPTRH_SaveH
	MOVE?BB	_TBLPTRH_SaveH, TBLPTRH

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00180	    TBLPTRL = TBLPTRL_SaveH
	MOVE?BB	_TBLPTRL_SaveH, TBLPTRL

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00181	@ endif

	ASM?
 endif

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00182	    ASM

	ASM?

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
    

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00240	    VarsSaved_H = 0
	MOVE?CT	000h, _VarsSaved_H

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00241	  ENDIF
	LABEL?L	L00003	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00242	@ INT_RETURN

	ASM?
 INT_RETURN

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00244	OverReEnterH:

	LABEL?L	_OverReEnterH	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\REENTERPBP-18.BAS	00245	ENABLE DEBUG
	DENABLE?	
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00015	    DEFINE OSC 4
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00016	    DEFINE I2C_SLOW 1  
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00017	    DEFINE CHAR_PACING 1000

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00021	    asm

	ASM?

            __CONFIG    _CONFIG1L, _PLLDIV_1_1L & _CPUDIV_OSC1_PLL2_1L & _USBDIV_1_1L
            __CONFIG    _CONFIG1H, _FOSC_INTOSC_HS_1H & _FCMEN_OFF_1H & _IESO_OFF_1H
            __CONFIG    _CONFIG2L, _PWRT_ON_2L & _BOR_OFF_2L & _BORV_3_2L & _VREGEN_OFF_2L
            __CONFIG    _CONFIG2H, _WDT_OFF_2H & _WDTPS_512_2H
            __CONFIG    _CONFIG3H, _CCP2MX_OFF_3H & _PBADEN_OFF_3H & _LPT1OSC_OFF_3H & _MCLRE_OFF_3H
            __CONFIG    _CONFIG4L, _STVREN_OFF_4L & _LVP_OFF_4L & _XINST_OFF_4L   
            __CONFIG    _CONFIG5L, _CP1_ON_5L & _CP0_ON_5L
            __CONFIG    _CONFIG5H, _CPB_ON_5H & _CPD_ON_5H          
    

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00043	    input levelA1 
	INPUT?T	_levelA1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00044	    input levela2 
	INPUT?T	_levelA2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00045	    input levelA3 
	INPUT?T	_levelA3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00046	    input levelA4 
	INPUT?T	_levelA4

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00052	    input levelB1 
	INPUT?T	_levelB1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00053	    input levelB2 
	INPUT?T	_levelB2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00054	    input levelB3 
	INPUT?T	_levelB3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00055	    input levelB4 
	INPUT?T	_levelB4

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00061	    input levelC1 
	INPUT?T	_levelC1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00062	    input levelC2 
	INPUT?T	_levelC2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00063	    input levelC3 
	INPUT?T	_levelC3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00064	    input levelC4   
	INPUT?T	_levelC4

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00067	    input inputZ1
	INPUT?T	_inputZ1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00073	    output valveA
	OUTPUT?T	_valveA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00074	    output pumpA
	OUTPUT?T	_pumpA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00078	    output valveB
	OUTPUT?T	_valveB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00079	    output pumpB
	OUTPUT?T	_pumpB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00083	    output valveC
	OUTPUT?T	_valveC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00084	    output pumpC
	OUTPUT?T	_pumpC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00092	    input tLeft      
	INPUT?T	_tLeft

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00093	    input tOk           
	INPUT?T	_tOk

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00094	    input tRight        
	INPUT?T	_tRight

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00095	    input tUp           
	INPUT?T	_tUp

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00096	    input tDown           
	INPUT?T	_tDown

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00097	    input tService       
	INPUT?T	_tService

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00100	    output output1
	OUTPUT?T	_output1
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00102	    majorVer con 1
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00103	    revisionVer con 1
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00104	    tPause con 300
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00105	    Strelica con ">"
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00106	    LCD_Addr CON $4E
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00107	    LCD_Addr2 CON $4E
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00108	    rsMode con 12

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00111	    ASM

	ASM?

    INT_LIST  macro    
         INT_Handler   TMR1_INT,  _Logika,   PBP,  yes
        endm
        INT_CREATE               
    

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00117	    T1CON = $31                      
	MOVE?CB	031h, T1CON

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00118	    @ INT_ENABLE  TMR1_INT  'Upali tajmer  

	ASM?
 INT_ENABLE  TMR1_INT  

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00120	    ADCON1              = $0F 'iskljuèi komparatore na  portevima
	MOVE?CB	00Fh, ADCON1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00121	    CMCON               = $7
	MOVE?CB	007h, CMCON

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00122	    INTCON2.7           = $0 'ukljuciti interne pull na portb
	MOVE?CT	000h, _INTCON2??7

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00123	    UCON.3              = $0 '
	MOVE?CT	000h, _UCON??3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00124	    UCFG.3              = $1 
	MOVE?CT	001h, _UCFG??3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00125	    PORTB               = $00 'postavi sve na portu B na 0
	MOVE?CB	000h, PORTB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00126	    PORTC               = $00 'postavi sve na portu B na 0
	MOVE?CB	000h, PORTC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00127	    OSCCON              = %01110110 'setovanje osccon registra    
	MOVE?CB	076h, OSCCON

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00172	    valveA = 0
	MOVE?CT	000h, _valveA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00173	    valveb = 0
	MOVE?CT	000h, _valveB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00174	    valvec = 0
	MOVE?CT	000h, _valveC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00175	    pumpA  = 0
	MOVE?CT	000h, _pumpA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00176	    pumpB  = 0 
	MOVE?CT	000h, _pumpB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00177	    pumpC  = 0
	MOVE?CT	000h, _pumpC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00178	    output1 = 0
	MOVE?CT	000h, _output1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00179	    clear
	CLEAR?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00180	    INCLUDE "LCD_PCF8574A.pbp"
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00010	LCD_BuffSize    CON 30
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00012	LCD_BuffAddr    CON EXT : @LCD_BuffAddr = _LCD_Buff

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00012	LCD_BuffAddr    CON EXT : @LCD_BuffAddr = _LCD_Buff

	ASM?
LCD_BuffAddr = _LCD_Buff

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00026	GOTO Over_LCDPCF8574 
	GOTO?L	_Over_LCDPCF8574
; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00029	USERCOMMAND "LCD_WRITE"

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00030	LCD_WRITE_:

	LABEL?L	_LCD_WRITE_	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00031	   LCD_E = 1
	MOVE?CT	001h, _LCD_E

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00032	   IF LCD_WriteMode.1 = 1 THEN                             ; Write High Nibble
	CMPNE?TCL	_LCD_WriteMode??1, 001h, L00005

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00033	     LCD_Byte = (LCD_Byte & $0F) | (LCD_Data  & $F0)
	AND?BCW	_LCD_Byte, 00Fh, T1
	AND?BCW	_LCD_Data, 0F0h, T2
	OR?WWB	T1, T2, _LCD_Byte

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00034	     LCD_Byte2 = LCD_Byte & $FB    
	AND?BCB	_LCD_Byte, 0FBh, _LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00035	     I2CWRITE SDA,SCL, LCD_Addr,[LCD_Byte, LCD_Byte2]
	I2CDATA?T	_SDA
	I2CCLOCK?T	_SCL
	I2CWRITE?C	_LCD_Addr
	I2CWRITE?B	_LCD_Byte
	I2CWRITES?B	_LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00036	   ENDIF
	LABEL?L	L00005	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00038	   IF LCD_WriteMode.0 = 1 THEN                             ; Write Low Nibble
	CMPNE?TCL	_LCD_WriteMode??0, 001h, L00007

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00039	     LCD_Byte = (LCD_Byte & $0F) | ((LCD_Data << 4 )& $F0)
	AND?BCW	_LCD_Byte, 00Fh, T1
	SHIFTL?BCW	_LCD_Data, 004h, T2
	AND?WCW	T2, 0F0h, T2
	OR?WWB	T1, T2, _LCD_Byte

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00040	     LCD_Byte2 = LCD_Byte & $FB
	AND?BCB	_LCD_Byte, 0FBh, _LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00041	     I2CWRITE SDA,SCL, LCD_Addr,[LCD_Byte, LCD_Byte2]
	I2CDATA?T	_SDA
	I2CCLOCK?T	_SCL
	I2CWRITE?C	_LCD_Addr
	I2CWRITE?B	_LCD_Byte
	I2CWRITES?B	_LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00042	   ENDIF
	LABEL?L	L00007	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00043	return
	RETURN?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00045	ASM

	ASM?

LCD_WRITE?  macro
    L?CALL _LCD_WRITE_
  endm


	ENDASM?

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00052	USERCOMMAND "LCD_WRITEBUFF"

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00053	LCD_WRITEBUFF_:

	LABEL?L	_LCD_WRITEBUFF_	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00060	    LCD_BuffLen = R5 - LCD_BuffAddr -1
	SUB?WCW	R5, LCD_BuffAddr, T1
	SUB?WCW	T1, 001h, _LCD_BuffLen

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00061	    LCD_WriteMode = 3          ; Both Nibbles
	MOVE?CB	003h, _LCD_WriteMode

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00062	    LCD_CommandMode = 0
	MOVE?CT	000h, _LCD_CommandMode

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00063	    FOR LCD_Idx = 0 TO LCD_BuffLen
	MOVE?CB	000h, _LCD_Idx
	LABEL?L	L00009	
	CMPGT?BWL	_LCD_Idx, _LCD_BuffLen, L00010

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00064	        IF LCD_Buff(LCD_Idx) = $FE THEN LCD_CommandMode = 1 : GOTO LCD_ByteDone
	AOUT?BBB	_LCD_Buff, _LCD_Idx, T1
	CMPNE?BCL	T1, 0FEh, L00011
	MOVE?CT	001h, _LCD_CommandMode
	GOTO?L	_LCD_ByteDone
	LABEL?L	L00011	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00065	        IF LCD_CommandMode THEN
	CMPF?TL	_LCD_CommandMode, L00013

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00066	            LCD_RS = 0   ' this is a command
	MOVE?CT	000h, _LCD_RS

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00067	            LCD_CommandMode = 0 ' false, next byte will be data
	MOVE?CT	000h, _LCD_CommandMode

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00068	        ELSE
	GOTO?L	L00014
	LABEL?L	L00013	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00069	            LCD_RS = 1   ' this is data
	MOVE?CT	001h, _LCD_RS

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00070	        ENDIF
	LABEL?L	L00014	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00071	        LCD_Data = LCD_Buff(LCD_Idx)
	AOUT?BBB	_LCD_Buff, _LCD_Idx, _LCD_Data

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00072	        LCD_Write
	LCD_WRITE?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00073	        IF LCD_CommandMode THEN
	CMPF?TL	_LCD_CommandMode, L00015

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00074	            PAUSE 2
	PAUSE?C	002h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00075	        ELSE
	GOTO?L	L00016
	LABEL?L	L00015	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00076	            PAUSEUS 50
	PAUSEUS?C	032h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00077	        ENDIF
	LABEL?L	L00016	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00079	      LCD_ByteDone:

	LABEL?L	_LCD_ByteDone	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00080	    NEXT LCD_Idx
	NEXT?BCL	_LCD_Idx, 001h, L00009
	LABEL?L	L00010	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00082	    LCD_CommandMode = 0
	MOVE?CT	000h, _LCD_CommandMode

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00083	RETURN
	RETURN?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00085	ASM

	ASM?

LCD_WRITEBUFF?  macro
    L?CALL _LCD_WRITEBUFF_
  endm


	ENDASM?

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00091	USERCOMMAND "LED_WRITE"

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00092	LED_Write_:    

	LABEL?L	_LED_Write_	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00094	    LCD_E = 1
	MOVE?CT	001h, _LCD_E

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00095	    IF LCD_WriteMode.0 = 1 THEN                                  ; Write Low Nibble
	CMPNE?TCL	_LCD_WriteMode??0, 001h, L00017

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00096	       LCD_Byte = (LCD_Byte & $0F) | (LCD_Data  & $F0)
	AND?BCW	_LCD_Byte, 00Fh, T1
	AND?BCW	_LCD_Data, 0F0h, T2
	OR?WWB	T1, T2, _LCD_Byte

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00097	       LCD_Byte2 = LCD_Byte & $FB
	AND?BCB	_LCD_Byte, 0FBh, _LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00098	       i2cwrite SDA,SCL, LCD_Addr2,[LCD_Byte]
	I2CDATA?T	_SDA
	I2CCLOCK?T	_SCL
	I2CWRITE?C	_LCD_Addr2
	I2CWRITES?B	_LCD_Byte

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00099	       pause 500
	PAUSE?C	001F4h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00100	       i2cwrite SDA,SCL, LCD_Addr2,[LCD_Byte2]
	I2CDATA?T	_SDA
	I2CCLOCK?T	_SCL
	I2CWRITE?C	_LCD_Addr2
	I2CWRITES?B	_LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00101	       pause 500
	PAUSE?C	001F4h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00102	    endif
	LABEL?L	L00017	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00103	    IF LCD_WriteMode.0 = 1 THEN                                  ; Write Low Nibble
	CMPNE?TCL	_LCD_WriteMode??0, 001h, L00019

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00104	       LCD_Byte = (LCD_Byte & $0F) | ((LCD_Data << 4 )& $F0)
	AND?BCW	_LCD_Byte, 00Fh, T1
	SHIFTL?BCW	_LCD_Data, 004h, T2
	AND?WCW	T2, 0F0h, T2
	OR?WWB	T1, T2, _LCD_Byte

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00105	       LCD_Byte2 = LCD_Byte & $FB
	AND?BCB	_LCD_Byte, 0FBh, _LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00106	       i2cwrite SDA,SCL, LCD_Addr2,[LCD_Byte]
	I2CDATA?T	_SDA
	I2CCLOCK?T	_SCL
	I2CWRITE?C	_LCD_Addr2
	I2CWRITES?B	_LCD_Byte

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00107	       pause 500
	PAUSE?C	001F4h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00108	       i2cwrite SDA,SCL, LCD_Addr2,[LCD_Byte2]
	I2CDATA?T	_SDA
	I2CCLOCK?T	_SCL
	I2CWRITE?C	_LCD_Addr2
	I2CWRITES?B	_LCD_Byte2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00109	       pause 500
	PAUSE?C	001F4h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00110	    endif   
	LABEL?L	L00019	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00111	RETURN
	RETURN?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00113	ASM

	ASM?

LED_WRITE?  macro
    L?CALL _LED_WRITE_
  endm


	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00119	Over_LCDPCF8574:

	LABEL?L	_Over_LCDPCF8574	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00122	PAUSE 250             ; LCD Power-on delay
	PAUSE?C	0FAh

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00123	LCD_Backlight = 1     ; Backlight OFF
	MOVE?CT	001h, _LCD_BackLight

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00124	LCD_RW = 0            ; Write to LCD
	MOVE?CT	000h, _LCD_RW

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00125	LCD_RS = 0            ; Command Register
	MOVE?CT	000h, _LCD_RS

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00127	LCD_WriteMode = 1     ;-- Low Nibbles only
	MOVE?CB	001h, _LCD_WriteMode

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00128	LCD_Data = 3          ; Reset 3 times
	MOVE?CB	003h, _LCD_Data

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00129	gosub LCD_Write_
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00130	PAUSEUS 6000
	PAUSEUS?C	01770h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00131	gosub LCD_Write_
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00132	PAUSEUS 1000
	PAUSEUS?C	003E8h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00133	gosub LCD_Write_
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00134	PAUSEUS 1000
	PAUSEUS?C	003E8h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00136	LCD_Data = 2          ; Start 4-bit mode
	MOVE?CB	002h, _LCD_Data

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00137	gosub LCD_Write_
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00138	PAUSEUS 1000
	PAUSEUS?C	003E8h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00140	LCD_WriteMode = 3     ;-- Both Nibbles
	MOVE?CB	003h, _LCD_WriteMode

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00141	LCD_Data = $28
	MOVE?CB	028h, _LCD_Data

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00142	gosub LCD_Write_      ; Function Set, 4-bit, 2-line, 5x7
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00143	LCD_Data = $0C
	MOVE?CB	00Ch, _LCD_Data

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00144	gosub LCD_Write_      ; Display ON
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00145	LCD_Data = $01
	MOVE?CB	001h, _LCD_Data

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00146	gosub LCD_Write_      ; Clear Screen
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00147	PAUSE 2
	PAUSE?C	002h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00148	LCD_Data = $06 
	MOVE?CB	006h, _LCD_Data

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00149	gosub LCD_Write_      ; Entry Mode
	GOSUB?L	_LCD_WRITE_

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LCD_PCF8574A.PBP	00151	PAUSE 2               ; Let command finish
	PAUSE?C	002h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00181	    pause 500	
	PAUSE?C	001F4h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00184	Splash:   

	LABEL?L	_Splash	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00185	    gosub ReadFromEeprom
	GOSUB?L	_ReadFromEeprom

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00186	    SEROUT rs232Tx,rsMode,["Nivomat FW:",#majorVer,".",#revisionver,13,10]
	SERPIN?T	_rs232Tx
	SERMODE?C	_rsMode
	SEROUT?C	04Eh
	SEROUT?C	069h
	SEROUT?C	076h
	SEROUT?C	06Fh
	SEROUT?C	06Dh
	SEROUT?C	061h
	SEROUT?C	074h
	SEROUT?C	020h
	SEROUT?C	046h
	SEROUT?C	057h
	SEROUT?C	03Ah
	SEROUTD?C	_majorVer
	SEROUT?C	02Eh
	SEROUTD?C	_revisionVer
	SEROUT?C	00Dh
	SEROUT?C	00Ah

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00187	    ARRAYWRITE LCD_Buff, [$FE, $2, "Nivomat init.         "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	04Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	076h
	ARRAYWRITE?C	06Fh
	ARRAYWRITE?C	06Dh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	02Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00188	    LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00189	    ARRAYWRITE LCD_Buff, [$FE, $C0, "FW:",#majorVer,".",#revisionver," # DM 2017"]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	046h
	ARRAYWRITE?C	057h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?C	_majorVer
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	02Eh
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?C	_revisionVer
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	023h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	044h
	ARRAYWRITE?C	04Dh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	032h
	ARRAYWRITE?C	030h
	ARRAYWRITE?C	031h
	ARRAYWRITE?C	037h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00190	    LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00191	    pause 1500
	PAUSE?C	005DCh

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00192	    x = 1
	MOVE?CB	001h, _x

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00193	    pause 30  
	PAUSE?C	01Eh

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00194	    SEROUT rs232Tx,rsMode,["Nivomat v1, revision 1",13,10]
	SERPIN?T	_rs232Tx
	SERMODE?C	_rsMode
	SEROUT?C	04Eh
	SEROUT?C	069h
	SEROUT?C	076h
	SEROUT?C	06Fh
	SEROUT?C	06Dh
	SEROUT?C	061h
	SEROUT?C	074h
	SEROUT?C	020h
	SEROUT?C	076h
	SEROUT?C	031h
	SEROUT?C	02Ch
	SEROUT?C	020h
	SEROUT?C	072h
	SEROUT?C	065h
	SEROUT?C	076h
	SEROUT?C	069h
	SEROUT?C	073h
	SEROUT?C	069h
	SEROUT?C	06Fh
	SEROUT?C	06Eh
	SEROUT?C	020h
	SEROUT?C	031h
	SEROUT?C	00Dh
	SEROUT?C	00Ah

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00195	    pause 50 
	PAUSE?C	032h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00196	    SEROUT rs232Tx,rsMode,["Tecomatic.rs Damir Milosavljevic",13,10] 
	SERPIN?T	_rs232Tx
	SERMODE?C	_rsMode
	SEROUT?C	054h
	SEROUT?C	065h
	SEROUT?C	063h
	SEROUT?C	06Fh
	SEROUT?C	06Dh
	SEROUT?C	061h
	SEROUT?C	074h
	SEROUT?C	069h
	SEROUT?C	063h
	SEROUT?C	02Eh
	SEROUT?C	072h
	SEROUT?C	073h
	SEROUT?C	020h
	SEROUT?C	044h
	SEROUT?C	061h
	SEROUT?C	06Dh
	SEROUT?C	069h
	SEROUT?C	072h
	SEROUT?C	020h
	SEROUT?C	04Dh
	SEROUT?C	069h
	SEROUT?C	06Ch
	SEROUT?C	06Fh
	SEROUT?C	073h
	SEROUT?C	061h
	SEROUT?C	076h
	SEROUT?C	06Ch
	SEROUT?C	06Ah
	SEROUT?C	065h
	SEROUT?C	076h
	SEROUT?C	069h
	SEROUT?C	063h
	SEROUT?C	00Dh
	SEROUT?C	00Ah

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00197	    pause 50
	PAUSE?C	032h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00198	    gosub Main
	GOSUB?L	_Main

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00201	Main: 

	LABEL?L	_Main	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00202	    gosub OcitajTastere
	GOSUB?L	_OcitajTastere

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00203	    ARRAYWRITE LCD_Buff, [$FE,$2,"Nivomat  ","FW:",#majorVer,".",#revisionver]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	04Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	076h
	ARRAYWRITE?C	06Fh
	ARRAYWRITE?C	06Dh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	046h
	ARRAYWRITE?C	057h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?C	_majorVer
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	02Eh
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?C	_revisionVer
	ARRAYWRITEDEC?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00204	    LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00205	    ARRAYWRITE LCD_Buff, [$FE,$C0,"VB:",#bazen1ukljucen, "MB:",#bazen2ukljucen,"SB:",#bazen3ukljucen,"     "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	042h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?B	_Bazen1Ukljucen
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	04Dh
	ARRAYWRITE?C	042h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?B	_Bazen2Ukljucen
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	042h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?B	_Bazen3Ukljucen
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00206	    LCD_WriteBuff   
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00207	    if ok = 1 then 
	CMPNE?TCL	_ok, 001h, L00021

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00208	        Brojmenija = 1
	MOVE?CB	001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00209	        gosub menu
	GOSUB?L	_menu

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00210	    endif   
	LABEL?L	L00021	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00211	    if service = 1 then gosub ServiceMode
	CMPNE?TCL	_Service, 001h, L00023
	GOSUB?L	_ServiceMode
	LABEL?L	L00023	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00212	    pause 10
	PAUSE?C	00Ah

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00213	    SEROUT rs232Tx,rsMode,["A: ",#levelA1,#levelA2,#levelA3,#levelA4," B: ",#levelB1,#levelB2,#levelB3,#levelB4," C:",#levelC1,#levelC2,#levelC3,#levelC4,10,"\xFD"
	SERPIN?T	_rs232Tx
	SERMODE?C	_rsMode
	SEROUT?C	041h
	SEROUT?C	03Ah
	SEROUT?C	020h
	SEROUTD?T	_levelA1
	SEROUTD?T	_levelA2
	SEROUTD?T	_levelA3
	SEROUTD?T	_levelA4
	SEROUT?C	020h
	SEROUT?C	042h
	SEROUT?C	03Ah
	SEROUT?C	020h
	SEROUTD?T	_levelB1
	SEROUTD?T	_levelB2
	SEROUTD?T	_levelB3
	SEROUTD?T	_levelB4
	SEROUT?C	020h
	SEROUT?C	043h
	SEROUT?C	03Ah
	SEROUTD?T	_levelC1
	SEROUTD?T	_levelC2
	SEROUTD?T	_levelC3
	SEROUTD?T	_levelC4
	SEROUT?C	00Ah
	SEROUT?C	05Ch
	SEROUT?C	078h
	SEROUT?C	046h
	SEROUT?C	044h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00214	    pause 100
	PAUSE?C	064h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00215	    SEROUT rs232Tx,rsMode,["[PV] "," A: ",#pumpa,#valvea," B: ",#pumpb,#valveb," C: ",#pumpc,#valvec,10]
	SERPIN?T	_rs232Tx
	SERMODE?C	_rsMode
	SEROUT?C	05Bh
	SEROUT?C	050h
	SEROUT?C	056h
	SEROUT?C	05Dh
	SEROUT?C	020h
	SEROUT?C	020h
	SEROUT?C	041h
	SEROUT?C	03Ah
	SEROUT?C	020h
	SEROUTD?T	_pumpA
	SEROUTD?T	_valveA
	SEROUT?C	020h
	SEROUT?C	042h
	SEROUT?C	03Ah
	SEROUT?C	020h
	SEROUTD?T	_pumpB
	SEROUTD?T	_valveB
	SEROUT?C	020h
	SEROUT?C	043h
	SEROUT?C	03Ah
	SEROUT?C	020h
	SEROUTD?T	_pumpC
	SEROUTD?T	_valveC
	SEROUT?C	00Ah

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00216	    pause 100 
	PAUSE?C	064h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00217	goto Main
	GOTO?L	_Main

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00219	Logika: 'labela koja se izvrsava u pozadini na svaki 1sec

	LABEL?L	_Logika	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00222	if Bazen1Ukljucen = 1 then 
	CMPNE?BCL	_Bazen1Ukljucen, 001h, L00025

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00223	        if levelA1 = 0 then 
	CMPNE?TCL	_levelA1, 000h, L00027

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00224	            countLevelA1 = countlevelA1 + 1 
	ADD?BCB	_countLevelA1, 001h, _countLevelA1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00225	            if countlevela1 = 15 then
	CMPNE?BCL	_countLevelA1, 00Fh, L00029

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00226	                countlevela1 = 0
	MOVE?CB	000h, _countLevelA1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00227	                valvea = 0
	MOVE?CT	000h, _valveA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00228	            endif 
	LABEL?L	L00029	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00229	        else
	GOTO?L	L00028
	LABEL?L	L00027	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00230	            countlevela1 = 0 
	MOVE?CB	000h, _countLevelA1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00231	        endif         
	LABEL?L	L00028	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00232	        if levelA2 = 1 then 
	CMPNE?TCL	_levelA2, 001h, L00031

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00233	            countlevela2 = countlevela2 + 1 
	ADD?BCB	_countLevelA2, 001h, _countLevelA2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00234	            if countlevela2 = 15 then 
	CMPNE?BCL	_countLevelA2, 00Fh, L00033

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00235	                countlevela2 = 0        
	MOVE?CB	000h, _countLevelA2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00236	                valvea = 1 
	MOVE?CT	001h, _valveA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00237	            endif
	LABEL?L	L00033	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00238	        else
	GOTO?L	L00032
	LABEL?L	L00031	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00239	            countlevela2 = 0   
	MOVE?CB	000h, _countLevelA2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00240	        endif
	LABEL?L	L00032	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00242	        if levelA2 = 0 and levelA3 = 0 then 
	CMPEQ?TCB	_levelA2, 000h, T1
	CMPEQ?TCB	_levelA3, 000h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00035

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00243	            countLevelA23 = countlevelA23 + 1 
	ADD?BCB	_countLevelA23, 001h, _countLevelA23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00244	            if countLevelA23 = 15 then 
	CMPNE?BCL	_countLevelA23, 00Fh, L00037

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00245	                countlevelA23 = 0 
	MOVE?CB	000h, _countLevelA23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00246	                pumpa = 1
	MOVE?CT	001h, _pumpA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00247	            endif  
	LABEL?L	L00037	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00248	        else
	GOTO?L	L00036
	LABEL?L	L00035	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00249	            countlevelA23 = 0 
	MOVE?CB	000h, _countLevelA23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00250	        endif 
	LABEL?L	L00036	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00252	        if levelA3 = 1 and levelA2 = 1 then 
	CMPEQ?TCB	_levelA3, 001h, T1
	CMPEQ?TCB	_levelA2, 001h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00039

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00253	            countLevelA3 = countlevelA3 + 1 
	ADD?BCB	_countLevelA3, 001h, _countLevelA3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00254	            if countLevelA3 = 15 then 
	CMPNE?BCL	_countLevelA3, 00Fh, L00041

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00255	                countLevela3 = 0 
	MOVE?CB	000h, _countLevelA3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00256	                pumpa = 0
	MOVE?CT	000h, _pumpA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00257	            endif 
	LABEL?L	L00041	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00258	        else
	GOTO?L	L00040
	LABEL?L	L00039	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00259	            countLevela3 = 0             
	MOVE?CB	000h, _countLevelA3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00260	        endif
	LABEL?L	L00040	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00261	else
	GOTO?L	L00026
	LABEL?L	L00025	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00262	    pumpa = 0
	MOVE?CT	000h, _pumpA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00263	    valvea = 0
	MOVE?CT	000h, _valveA

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00264	endif 
	LABEL?L	L00026	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00267	if Bazen2Ukljucen = 1 then 
	CMPNE?BCL	_Bazen2Ukljucen, 001h, L00043

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00268	        if levelb1 = 0 then 
	CMPNE?TCL	_levelB1, 000h, L00045

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00269	            countLevelb1 = countlevelb1 + 1 
	ADD?BCB	_countLevelB1, 001h, _countLevelB1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00270	            if countlevelb1 = 15 then
	CMPNE?BCL	_countLevelB1, 00Fh, L00047

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00271	                countlevelb1 = 0
	MOVE?CB	000h, _countLevelB1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00272	                valveb = 0
	MOVE?CT	000h, _valveB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00273	            endif 
	LABEL?L	L00047	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00274	        else
	GOTO?L	L00046
	LABEL?L	L00045	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00275	            countlevelb1 = 0 
	MOVE?CB	000h, _countLevelB1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00276	        endif        
	LABEL?L	L00046	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00277	        if levelb2 = 1 then 
	CMPNE?TCL	_levelB2, 001h, L00049

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00278	            countlevelb2 = countlevelb2 + 1 
	ADD?BCB	_countLevelB2, 001h, _countLevelB2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00279	            if countlevelb2 = 15 then 
	CMPNE?BCL	_countLevelB2, 00Fh, L00051

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00280	                countlevelb2 = 0        
	MOVE?CB	000h, _countLevelB2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00281	                valveb = 1 
	MOVE?CT	001h, _valveB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00282	            endif
	LABEL?L	L00051	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00283	        else
	GOTO?L	L00050
	LABEL?L	L00049	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00284	            countlevelb2 = 0   
	MOVE?CB	000h, _countLevelB2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00285	        endif
	LABEL?L	L00050	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00287	        if levelb2 = 0 and levelb3 = 0 then 
	CMPEQ?TCB	_levelB2, 000h, T1
	CMPEQ?TCB	_levelB3, 000h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00053

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00288	            countLevelb23 = countlevelb23 + 1 
	ADD?BCB	_countLevelB23, 001h, _countLevelB23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00289	            if countLevelb23 = 15 then 
	CMPNE?BCL	_countLevelB23, 00Fh, L00055

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00290	                countlevelb23 = 0 
	MOVE?CB	000h, _countLevelB23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00291	                pumpb = 1
	MOVE?CT	001h, _pumpB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00292	            endif  
	LABEL?L	L00055	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00293	        else
	GOTO?L	L00054
	LABEL?L	L00053	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00294	            countlevelb23 = 0 
	MOVE?CB	000h, _countLevelB23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00295	        endif 
	LABEL?L	L00054	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00297	        if levelb3 = 1 and levelb2 = 1 then 
	CMPEQ?TCB	_levelB3, 001h, T1
	CMPEQ?TCB	_levelB2, 001h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00057

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00298	            countLevelb3 = countlevelb3 + 1 
	ADD?BCB	_countLevelB3, 001h, _countLevelB3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00299	            if countLevelb3 = 15 then 
	CMPNE?BCL	_countLevelB3, 00Fh, L00059

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00300	                countLevelb3 = 0 
	MOVE?CB	000h, _countLevelB3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00301	                pumpb = 0
	MOVE?CT	000h, _pumpB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00302	            endif 
	LABEL?L	L00059	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00303	        else
	GOTO?L	L00058
	LABEL?L	L00057	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00304	            countLevelb3 = 0             
	MOVE?CB	000h, _countLevelB3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00305	        endif
	LABEL?L	L00058	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00306	else
	GOTO?L	L00044
	LABEL?L	L00043	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00307	    pumpb = 0
	MOVE?CT	000h, _pumpB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00308	    valveb = 0
	MOVE?CT	000h, _valveB

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00309	endif
	LABEL?L	L00044	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00312	if Bazen3Ukljucen = 1 then 
	CMPNE?BCL	_Bazen3Ukljucen, 001h, L00061

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00313	        if levelc1 = 0 then 
	CMPNE?TCL	_levelC1, 000h, L00063

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00314	            countLevelc1 = countlevelc1 + 1 
	ADD?BCB	_countLevelC1, 001h, _countLevelC1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00315	            if countlevelc1 = 15 then
	CMPNE?BCL	_countLevelC1, 00Fh, L00065

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00316	                countlevelc1 = 0
	MOVE?CB	000h, _countLevelC1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00317	                valvec = 0
	MOVE?CT	000h, _valveC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00318	            endif 
	LABEL?L	L00065	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00319	        else
	GOTO?L	L00064
	LABEL?L	L00063	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00320	            countlevelc1 = 0 
	MOVE?CB	000h, _countLevelC1

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00321	        endif         
	LABEL?L	L00064	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00322	        if levelC2 = 1 then 
	CMPNE?TCL	_levelC2, 001h, L00067

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00323	            countlevelc2 = countlevelc2 + 1 
	ADD?BCB	_countLevelC2, 001h, _countLevelC2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00324	            if countlevelc2 = 15 then 
	CMPNE?BCL	_countLevelC2, 00Fh, L00069

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00325	                countlevelc2 = 0        
	MOVE?CB	000h, _countLevelC2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00326	                valvec = 1 
	MOVE?CT	001h, _valveC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00327	            endif
	LABEL?L	L00069	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00328	        else
	GOTO?L	L00068
	LABEL?L	L00067	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00329	            countlevelc2 = 0   
	MOVE?CB	000h, _countLevelC2

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00330	        endif
	LABEL?L	L00068	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00332	        if levelc2 = 0 and levelc3 = 0 then 
	CMPEQ?TCB	_levelC2, 000h, T1
	CMPEQ?TCB	_levelC3, 000h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00071

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00333	            countLevelc23 = countlevelc23 + 1 
	ADD?BCB	_countLevelC23, 001h, _countLevelC23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00334	            if countLevelc23 = 15 then 
	CMPNE?BCL	_countLevelC23, 00Fh, L00073

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00335	                countlevelc23 = 0 
	MOVE?CB	000h, _countLevelC23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00336	                pumpc = 1
	MOVE?CT	001h, _pumpC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00337	            endif  
	LABEL?L	L00073	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00338	        else
	GOTO?L	L00072
	LABEL?L	L00071	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00339	            countlevelc23 = 0 
	MOVE?CB	000h, _countLevelC23

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00340	        endif 
	LABEL?L	L00072	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00342	        if levelc3 = 1 and levelc2 = 1 then 
	CMPEQ?TCB	_levelC3, 001h, T1
	CMPEQ?TCB	_levelC2, 001h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00075

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00343	            countLevelc3 = countlevelc3 + 1 
	ADD?BCB	_countLevelC3, 001h, _countLevelC3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00344	            if countLevelc3 = 15 then 
	CMPNE?BCL	_countLevelC3, 00Fh, L00077

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00345	                countLevelc3 = 0 
	MOVE?CB	000h, _countLevelC3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00346	                pumpc = 0
	MOVE?CT	000h, _pumpC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00347	            endif 
	LABEL?L	L00077	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00348	        else
	GOTO?L	L00076
	LABEL?L	L00075	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00349	            countLevelc3 = 0             
	MOVE?CB	000h, _countLevelC3

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00350	        endif
	LABEL?L	L00076	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00351	else
	GOTO?L	L00062
	LABEL?L	L00061	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00352	    pumpc = 0
	MOVE?CT	000h, _pumpC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00353	    valvec = 0
	MOVE?CT	000h, _valveC

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00354	endif
	LABEL?L	L00062	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00355	@ INT_RETURN

	ASM?
 INT_RETURN

	ENDASM?


; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00357	Menu: 

	LABEL?L	_menu	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00358	    gosub OcitajTastere
	GOSUB?L	_OcitajTastere

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00359	    if dole = 1 then 
	CMPNE?TCL	_dole, 001h, L00079

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00360	        if Brojmenija = 3 then 
	CMPNE?BCL	_BrojMenija, 003h, L00081

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00361	            Brojmenija = 3
	MOVE?CB	003h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00362	        else
	GOTO?L	L00082
	LABEL?L	L00081	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00363	            Brojmenija = Brojmenija + 1      
	ADD?BCB	_BrojMenija, 001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00364	        endif
	LABEL?L	L00082	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00365	    endif
	LABEL?L	L00079	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00366	    if gore = 1 then 
	CMPNE?TCL	_gore, 001h, L00083

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00367	        if Brojmenija = 1 then 
	CMPNE?BCL	_BrojMenija, 001h, L00085

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00368	            Brojmenija = 1
	MOVE?CB	001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00369	        else
	GOTO?L	L00086
	LABEL?L	L00085	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00370	            Brojmenija = Brojmenija - 1 
	SUB?BCB	_BrojMenija, 001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00371	        endif
	LABEL?L	L00086	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00372	    endif
	LABEL?L	L00083	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00373	    if levo = 1 then
	CMPNE?TCL	_levo, 001h, L00087

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00374	        Brojmenija = 1
	MOVE?CB	001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00375	        goto main 
	GOTO?L	_Main

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00376	    endif
	LABEL?L	L00087	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00377	    if ok = 1 then                
	CMPNE?TCL	_ok, 001h, L00089

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00378	        if brojMenija = 1 then read 5,x
	CMPNE?BCL	_BrojMenija, 001h, L00091
	READADDRESS?C	005h
	READ?B	_x
	LABEL?L	L00091	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00379	        if brojMenija = 2 then read 6,x
	CMPNE?BCL	_BrojMenija, 002h, L00093
	READADDRESS?C	006h
	READ?B	_x
	LABEL?L	L00093	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00380	        if brojMenija = 3 then read 7,x
	CMPNE?BCL	_BrojMenija, 003h, L00095
	READADDRESS?C	007h
	READ?B	_x
	LABEL?L	L00095	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00381	        gosub MenuAutomatika
	GOSUB?L	_MenuAutomatika

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00382	    endif
	LABEL?L	L00089	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00383	    Select case brojmenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00384	        case 1   
	CMPNE?BCL	_BrojMenija, 001h, L00099

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00385	            ARRAYWRITE LCD_Buff, [$FE,$2,Strelica,"Veliki bazen       "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	_Strelica
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Bh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00386	            LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00387	            ARRAYWRITE LCD_Buff, [$FE,$C0," Mali bazen         "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	04Dh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00388	            LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00389	        case 2    
	GOTO?L	L00098
	LABEL?L	L00099	
	CMPNE?BCL	_BrojMenija, 002h, L00100

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00390	            ARRAYWRITE LCD_Buff, [$FE,$2," Veliki bazen       " ]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Bh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00391	            LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00392	            ARRAYWRITE LCD_Buff, [$FE,$C0,Strelica ,"Mali bazen       "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	_Strelica
	ARRAYWRITE?C	04Dh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00393	            LCD_WriteBuff        
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00394	        case 3  
	GOTO?L	L00098
	LABEL?L	L00100	
	CMPNE?BCL	_BrojMenija, 003h, L00101

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00395	            ARRAYWRITE LCD_Buff, [$FE,$2,strelica,"Spoljni bazen       " ]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	_Strelica
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	070h
	ARRAYWRITE?C	06Fh
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	06Ah
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00396	            LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00397	            ARRAYWRITE LCD_Buff, [$FE,$C0,"                        "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00398	            LCD_WriteBuff                          
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00399	    end select           
	LABEL?L	L00101	
	LABEL?L	L00098	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00400	goto Menu 
	GOTO?L	_menu

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00402	MenuAutomatika:

	LABEL?L	_MenuAutomatika	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00403	    gosub OcitajTastere
	GOSUB?L	_OcitajTastere

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00404	    if levo = 1 then goto menu
	CMPNE?TCL	_levo, 001h, L00102
	GOTO?L	_menu
	LABEL?L	L00102	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00405	    if gore = 1 then x = 1 
	CMPNE?TCL	_gore, 001h, L00104
	MOVE?CB	001h, _x
	LABEL?L	L00104	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00406	    if dole = 1 then x = 0  
	CMPNE?TCL	_dole, 001h, L00106
	MOVE?CB	000h, _x
	LABEL?L	L00106	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00407	    ARRAYWRITE LCD_Buff, [$FE,$2,"Automatika       " ]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	041h
	ARRAYWRITE?C	075h
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	06Fh
	ARRAYWRITE?C	06Dh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Bh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00408	    LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00409	    select case x

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00410	    case 0       
	CMPNE?BCL	_x, 000h, L00110

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00411	        ARRAYWRITE LCD_Buff, [$FE,$C0,"[OK] - Ugasena "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	05Bh
	ARRAYWRITE?C	04Fh
	ARRAYWRITE?C	04Bh
	ARRAYWRITE?C	05Dh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	02Dh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	055h
	ARRAYWRITE?C	067h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	073h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00412	        LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00413	    case 1
	GOTO?L	L00109
	LABEL?L	L00110	
	CMPNE?BCL	_x, 001h, L00111

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00414	        ARRAYWRITE LCD_Buff, [$FE,$C0,"[OK] - Upaljena "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	05Bh
	ARRAYWRITE?C	04Fh
	ARRAYWRITE?C	04Bh
	ARRAYWRITE?C	05Dh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	02Dh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	055h
	ARRAYWRITE?C	070h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	06Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00415	        LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00416	    end select 
	LABEL?L	L00111	
	LABEL?L	L00109	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00417	    if ok = 1 then 
	CMPNE?TCL	_ok, 001h, L00112

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00418	        if brojmenija = 1 then write 5,x 
	CMPNE?BCL	_BrojMenija, 001h, L00114
	WRITEADDRESS?C	005h
	WRITE?B	_x
	LABEL?L	L00114	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00419	        if brojmenija = 2 then write 6,x 
	CMPNE?BCL	_BrojMenija, 002h, L00116
	WRITEADDRESS?C	006h
	WRITE?B	_x
	LABEL?L	L00116	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00420	        if brojmenija = 3 then write 7,x 
	CMPNE?BCL	_BrojMenija, 003h, L00118
	WRITEADDRESS?C	007h
	WRITE?B	_x
	LABEL?L	L00118	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00421	        gosub ReadFromEeprom
	GOSUB?L	_ReadFromEeprom

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00422	        gosub Sacuvano            
	GOSUB?L	_Sacuvano

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00423	    endif   
	LABEL?L	L00112	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00424	goto MenuAutomatika
	GOTO?L	_MenuAutomatika

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00426	ServiceMode:

	LABEL?L	_ServiceMode	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00427	    gosub OcitajTastere
	GOSUB?L	_OcitajTastere

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00428	    if dole = 1 then 
	CMPNE?TCL	_dole, 001h, L00120

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00429	        if Brojmenija = 4 then 
	CMPNE?BCL	_BrojMenija, 004h, L00122

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00430	            Brojmenija = 4
	MOVE?CB	004h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00431	        else
	GOTO?L	L00123
	LABEL?L	L00122	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00432	            Brojmenija = Brojmenija + 1      
	ADD?BCB	_BrojMenija, 001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00433	        endif
	LABEL?L	L00123	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00434	    endif
	LABEL?L	L00120	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00435	    if gore = 1 then 
	CMPNE?TCL	_gore, 001h, L00124

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00436	        if Brojmenija = 1 then 
	CMPNE?BCL	_BrojMenija, 001h, L00126

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00437	            Brojmenija = 1
	MOVE?CB	001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00438	        else
	GOTO?L	L00127
	LABEL?L	L00126	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00439	            Brojmenija = Brojmenija - 1 
	SUB?BCB	_BrojMenija, 001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00440	        endif
	LABEL?L	L00127	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00441	    endif
	LABEL?L	L00124	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00442	    if levo = 1 then
	CMPNE?TCL	_levo, 001h, L00128

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00443	        Brojmenija = 1
	MOVE?CB	001h, _BrojMenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00444	        goto main 
	GOTO?L	_Main

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00445	    endif
	LABEL?L	L00128	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00446	    Select case brojmenija

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00447	    case 1   
	CMPNE?BCL	_BrojMenija, 001h, L00132

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00448	        ARRAYWRITE LCD_Buff, [$FE,$2,Strelica,"Veliki bazen       "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	_Strelica
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Bh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00449	        LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00450	        ARRAYWRITE LCD_Buff, [$FE,$C0," Mali bazen         "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	04Dh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00451	        LCD_WriteBuff
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00452	    case 2    
	GOTO?L	L00131
	LABEL?L	L00132	
	CMPNE?BCL	_BrojMenija, 002h, L00133

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00453	        ARRAYWRITE LCD_Buff, [$FE,$2," Veliki bazen       " ]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Bh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00454	        LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00455	        ARRAYWRITE LCD_Buff, [$FE,$C0,Strelica ,"Mali bazen       "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	_Strelica
	ARRAYWRITE?C	04Dh
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00456	        LCD_WriteBuff        
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00457	    case 3  
	GOTO?L	L00131
	LABEL?L	L00133	
	CMPNE?BCL	_BrojMenija, 003h, L00134

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00458	        ARRAYWRITE LCD_Buff, [$FE,$2,strelica,"Spoljni bazen       " ]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	_Strelica
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	070h
	ARRAYWRITE?C	06Fh
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	06Ah
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00459	        LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00460	        ARRAYWRITE LCD_Buff, [$FE,$C0," Svi bazeni                       "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	076h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00461	        LCD_WriteBuff     
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00462	    case 4  
	GOTO?L	L00131
	LABEL?L	L00134	
	CMPNE?BCL	_BrojMenija, 004h, L00135

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00463	        ARRAYWRITE LCD_Buff, [$FE,$2," Spoljni bazen       " ]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	070h
	ARRAYWRITE?C	06Fh
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	06Ah
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00464	        LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00465	        ARRAYWRITE LCD_Buff, [$FE,$C0,strelica,"Svi bazeni                       "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	_Strelica
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	076h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	062h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00466	        LCD_WriteBuff                        
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00467	    end select  
	LABEL?L	L00135	
	LABEL?L	L00131	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00468	    if ok = 1 then gosub servicemodeprikaz
	CMPNE?TCL	_ok, 001h, L00136
	GOSUB?L	_servicemodeprikaz
	LABEL?L	L00136	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00469	    if levo = 1 then goto main
	CMPNE?TCL	_levo, 001h, L00138
	GOTO?L	_Main
	LABEL?L	L00138	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00470	goto serviceMode
	GOTO?L	_ServiceMode

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00472	ServiceModePrikaz:

	LABEL?L	_servicemodeprikaz	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00473	    gosub OcitajTastere
	GOSUB?L	_OcitajTastere

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00474	    select case brojmenija   

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00475	    case 1
	CMPNE?BCL	_BrojMenija, 001h, L00142

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00476	        ARRAYWRITE LCD_Buff,[$FE,$2,"VB# ","1:",#levelA1,"2:",#levelA2,"3:",#levelA3,"4:",#levelA4,"                   "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	042h
	ARRAYWRITE?C	023h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	031h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA1
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	032h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA2
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	033h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA3
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	034h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA4
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00477	        LCD_WriteBuff 
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00478	        ARRAYWRITE LCD_Buff,[$FE, $C0, "Pumpa:",#pumpa,"Ventil:",#valvea, " "]          
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	050h
	ARRAYWRITE?C	075h
	ARRAYWRITE?C	06Dh
	ARRAYWRITE?C	070h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_pumpA
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_valveA
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00479	        LCD_WriteBuff  
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00480	    case 2
	GOTO?L	L00141
	LABEL?L	L00142	
	CMPNE?BCL	_BrojMenija, 002h, L00143

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00481	        ARRAYWRITE LCD_Buff,[$FE,$2,"MB# ","1:",#levelb1,"2:",#levelb2,"3:",#levelb3,"4:",#levelb4,"                   "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	04Dh
	ARRAYWRITE?C	042h
	ARRAYWRITE?C	023h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	031h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB1
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	032h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB2
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	033h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB3
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	034h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB4
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00482	        LCD_WriteBuff 
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00483	        ARRAYWRITE LCD_Buff,[$FE, $C0, "Pumpa:",#pumpb,"Ventil:",#valveb, " "]          
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	050h
	ARRAYWRITE?C	075h
	ARRAYWRITE?C	06Dh
	ARRAYWRITE?C	070h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_pumpB
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_valveB
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00484	        LCD_WriteBuff 
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00485	    case 3
	GOTO?L	L00141
	LABEL?L	L00143	
	CMPNE?BCL	_BrojMenija, 003h, L00144

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00486	        ARRAYWRITE LCD_Buff,[$FE,$2,"SB# ","1:",#levelc1,"2:",#levelc2,"3:",#levelc3,"4:",#levelc4,"                   "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	042h
	ARRAYWRITE?C	023h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	031h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC1
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	032h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC2
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	033h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC3
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	034h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC4
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00487	        LCD_WriteBuff 
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00488	        ARRAYWRITE LCD_Buff,[$FE, $C0, "Pumpa:",#pumpc,"Ventil:",#valvec, " "]          
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	050h
	ARRAYWRITE?C	075h
	ARRAYWRITE?C	06Dh
	ARRAYWRITE?C	070h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_pumpC
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	074h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	06Ch
	ARRAYWRITE?C	03Ah
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_valveC
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00489	        LCD_WriteBuff   
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00490	    case 4
	GOTO?L	L00141
	LABEL?L	L00144	
	CMPNE?BCL	_BrojMenija, 004h, L00145

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00491	        ARRAYWRITE LCD_Buff,[$FE,$2,"A",#levelA1,#levelA2,#levelA3,#levelA4,"B",#levelB1,#levelB2,#levelB3,#levelB4,"C",#levelC1,#levelC2,#levelC3,#levelC4,"   "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	041h
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA1
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA2
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA3
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelA4
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	042h
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB1
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB2
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB3
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelB4
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	043h
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC1
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC2
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC3
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_levelC4
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00492	        LCD_WriteBuff 
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00493	        ARRAYWRITE LCD_Buff, [$FE, $C0, "[PV] ","A",#pumpa,#valvea,"B",#pumpb,#valveb,"C",#pumpc,#valvec, "          "]          
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	05Bh
	ARRAYWRITE?C	050h
	ARRAYWRITE?C	056h
	ARRAYWRITE?C	05Dh
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	041h
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_pumpA
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_valveA
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	042h
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_pumpB
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_valveB
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	043h
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_pumpC
	ARRAYWRITEDEC?	
	ARRAYWRITECOUNT?C	000h
	ARRAYWRITENUM?T	_valveC
	ARRAYWRITEDEC?	
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00494	        LCD_WriteBuff  
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00495	   end select
	LABEL?L	L00145	
	LABEL?L	L00141	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00496	   if levo = 1 then return
	CMPNE?TCL	_levo, 001h, L00146
	RETURN?	
	LABEL?L	L00146	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00497	goto ServiceModePrikaz
	GOTO?L	_servicemodeprikaz

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00499	Sacuvano: 'podprogram za ispisivanje na ekranu da su izmene sacuvane 

	LABEL?L	_Sacuvano	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00500	    gosub ReadFromEeprom 'posto je menjana vrednost u nekom od menija, prebacujemo 'sveze' podatke iz eproma u ram memoriju 
	GOSUB?L	_ReadFromEeprom

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00501	    ARRAYWRITE LCD_Buff, [$FE,$2,"Sacuvane izmene!" ]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	002h
	ARRAYWRITE?C	053h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	063h
	ARRAYWRITE?C	075h
	ARRAYWRITE?C	076h
	ARRAYWRITE?C	061h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	069h
	ARRAYWRITE?C	07Ah
	ARRAYWRITE?C	06Dh
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	06Eh
	ARRAYWRITE?C	065h
	ARRAYWRITE?C	021h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00502	    LCD_WriteBuff                      
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00503	    ARRAYWRITE LCD_Buff, [$FE,$C0,"                        "]
	ARRAYWRITENAME?B	_LCD_Buff
	ARRAYWRITE?C	0FEh
	ARRAYWRITE?C	0C0h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h
	ARRAYWRITE?C	020h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00504	    LCD_WriteBuff 
	LCD_WRITEBUFF?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00505	    pause 1000
	PAUSE?C	003E8h

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00506	return 
	RETURN?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00508	ReadFromEeprom:'podprogram za prebacivanje vrednosti iz eeprom memorije u flash(ram) memoriju  

	LABEL?L	_ReadFromEeprom	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00509	    read 5,Bazen1Ukljucen 'procitaj iz eproma i ubaci u promenjivu, ovo radimo da ne citamo stalno epprom vec drzimo vrednost u promenjivoj 
	READADDRESS?C	005h
	READ?B	_Bazen1Ukljucen

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00510	    if Bazen1Ukljucen = 255 then write 5,0  'ukoliko se epprom lokacija nije jos setovana upisace 0 u nju
	CMPNE?BCL	_Bazen1Ukljucen, 0FFh, L00148
	WRITEADDRESS?C	005h
	WRITE?C	000h
	LABEL?L	L00148	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00511	    read 6,Bazen2Ukljucen 
	READADDRESS?C	006h
	READ?B	_Bazen2Ukljucen

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00512	    if Bazen2Ukljucen = 255 then write 6,0 
	CMPNE?BCL	_Bazen2Ukljucen, 0FFh, L00150
	WRITEADDRESS?C	006h
	WRITE?C	000h
	LABEL?L	L00150	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00513	    read 7,Bazen3Ukljucen 
	READADDRESS?C	007h
	READ?B	_Bazen3Ukljucen

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00514	    if Bazen3Ukljucen = 255 then write 7,0 
	CMPNE?BCL	_Bazen3Ukljucen, 0FFh, L00152
	WRITEADDRESS?C	007h
	WRITE?C	000h
	LABEL?L	L00152	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00515	return 
	RETURN?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00517	OcitajTastere:  'podprogram za proveru da li je taster pritisnut i koji je pritisnut 

	LABEL?L	_OcitajTastere	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00518	    NovoStanjeDesno         =  tRight
	MOVE?TT	_tRight, _NovoStanjeDesno

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00519	    NovoStanjeLevo          =  tLeft
	MOVE?TT	_tLeft, _NovoStanjeLevo

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00520	    NovoStanjeGore          =  tUp
	MOVE?TT	_tUp, _NovoStanjeGore

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00521	    NovoStanjeDole          =  tDown
	MOVE?TT	_tDown, _NovoStanjeDole

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00522	    NovoStanjeOk            =  tOk
	MOVE?TT	_tOk, _NovoStanjeOk

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00523	    NovoStanjeService       =  tservice
	MOVE?TT	_tService, _NovoStanjeService

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00524	    if novostanjegore < starostanjegore then 
	CMPGE?TTL	_NovoStanjeGore, _StaroStanjeGore, L00154

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00525	        gore = 1 
	MOVE?CT	001h, _gore

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00526	    else
	GOTO?L	L00155
	LABEL?L	L00154	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00527	        gore = 0 
	MOVE?CT	000h, _gore

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00528	    ENDIF   
	LABEL?L	L00155	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00529	    if novostanjedole < starostanjedole then 
	CMPGE?TTL	_NovoStanjeDole, _StaroStanjeDole, L00156

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00530	        dole = 1
	MOVE?CT	001h, _dole

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00531	    else 
	GOTO?L	L00157
	LABEL?L	L00156	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00532	        dole = 0
	MOVE?CT	000h, _dole

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00533	    ENDIF    
	LABEL?L	L00157	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00534	    if novostanjelevo < starostanjelevo then 
	CMPGE?TTL	_NovoStanjeLevo, _StaroStanjeLevo, L00158

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00535	        levo = 1
	MOVE?CT	001h, _levo

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00536	    else
	GOTO?L	L00159
	LABEL?L	L00158	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00537	        levo = 0
	MOVE?CT	000h, _levo

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00538	    ENDIF    
	LABEL?L	L00159	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00539	    if novostanjedesno < starostanjedesno then 
	CMPGE?TTL	_NovoStanjeDesno, _StaroStanjeDesno, L00160

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00540	        desno = 1
	MOVE?CT	001h, _desno

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00541	    else
	GOTO?L	L00161
	LABEL?L	L00160	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00542	        desno = 0
	MOVE?CT	000h, _desno

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00543	    ENDIF    
	LABEL?L	L00161	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00544	    if novostanjeOK < starostanjeok then 
	CMPGE?TTL	_NovoStanjeOk, _StaroStanjeOk, L00162

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00545	        ok = 1
	MOVE?CT	001h, _ok

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00546	    else
	GOTO?L	L00163
	LABEL?L	L00162	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00547	        ok = 0
	MOVE?CT	000h, _ok

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00548	    ENDIF    
	LABEL?L	L00163	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00549	    if novostanjeService < starostanjeService then 
	CMPGE?TTL	_NovoStanjeService, _StaroStanjeService, L00164

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00550	        Service = 1
	MOVE?CT	001h, _Service

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00551	    else
	GOTO?L	L00165
	LABEL?L	L00164	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00552	        Service = 0
	MOVE?CT	000h, _Service

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00553	    ENDIF    
	LABEL?L	L00165	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00554	    StaroStanjeDesno        = NovoStanjeDesno        
	MOVE?TT	_NovoStanjeDesno, _StaroStanjeDesno

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00555	    StaroStanjeLevo         = NovoStanjeLevo      
	MOVE?TT	_NovoStanjeLevo, _StaroStanjeLevo

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00556	    StaroStanjeGore         = NovoStanjeGore          
	MOVE?TT	_NovoStanjeGore, _StaroStanjeGore

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00557	    StaroStanjeDole         = NovoStanjeDole         
	MOVE?TT	_NovoStanjeDole, _StaroStanjeDole

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00558	    StaroStanjeOk           = NovoStanjeOk           
	MOVE?TT	_NovoStanjeOk, _StaroStanjeOk

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00559	    StaroStanjeService      = NovoStanjeService  
	MOVE?TT	_NovoStanjeService, _StaroStanjeService

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00560	return
	RETURN?	

; C:\USERS\DMILOSAVLJEVIC\DROPBOX\PROJEKTI\LEVEL-METER\FIRMWARE\LEVEL-METER.PBP	00562	end 'kraj :) 
	END?	

	END
