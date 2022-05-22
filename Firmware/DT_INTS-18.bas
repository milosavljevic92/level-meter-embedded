'****************************************************************
'*  Name    : DT_INTS-18.bas                                    *
'*  Author  : Darrel Taylor                                     *
'*  Notice  : Copyright (c) 2003                                *
'*  Version : 3.3    MAR 24, 2008                               *
'*  Date    : JUL 11, 2006                                      *
'****************************************************************
'*  Versions:                                                   *
'*   3.3  : MAR 24, 2008                                        *
'*           Corrects an initialization problem affecting the   *
'*           first pass if CLEAR is not used                    *
'*   3.2  : Aug 26, 2007                                        *
'*           Update for PBP 2.50 using LONG's with PBPL         *
'*           Added many new INT sources                         *
'*   3.1  : JUL 18, 2006                                        *
'*           Modified to handle smaller BANKA in the newer chips*
'****************************************************************
DISABLE DEBUG

DEFINE  INTHAND       INT_ENTRY_H  ' Context saving for High Priority Ints
DEFINE  INTLHAND      INT_ENTRY_L  ' Context saving for Low Priority Ints

wsave       var byte  BANKA  SYSTEM   ' location for WREG
ssave       var byte  BANK0  SYSTEM   ' location for STATUS register
bsave       var byte  BANK0  SYSTEM   ' location for BSR register
psaveUH     VAR BYTE  BANK0  SYSTEM   ' PCLATU Hi Pri.
psaveUL     VAR BYTE  BANK0  SYSTEM   '        Lo Pri.
psaveH      VAR BYTE  BANK0  SYSTEM   ' PCLATH Hi Pri.
psaveL      VAR BYTE  BANK0  SYSTEM   '        Lo Pri.
fsave0H     var WORD  BANK0  SYSTEM   ' locations for FSR registers
fsave1H     var WORD  BANK0  SYSTEM
fsave2H     var WORD  BANK0  SYSTEM
fsave0L     var WORD  BANK0  SYSTEM   ' low priority FSR locations
fsave1L     var WORD  BANK0  SYSTEM
fsave2L     var WORD  BANK0  SYSTEM
RetAddrH    VAR BYTE[3]  BANKA  SYSTEM  ' 21-bit return address Hi Pri.
RetAddrL    VAR BYTE[3]  BANKA  SYSTEM  '                       Lo Pri.
INT_Flags   VAR BYTE  BANKA  SYSTEM
  Serviced_H  VAR INT_Flags.0
  Serviced_L  VAR INT_Flags.1
  InHPint     VAR INT_Flags.2
  NoPriority  VAR INT_Flags.3

INT_Flags = 0 

goto  OVER_DT_INTS_18

ASM
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
ENDASM

asm
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
endasm


asm
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
endasm

asm
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
endasm

asm  ; -- USB sources --
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
endasm

asm  ; -- Ethernet sources --
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
endasm

asm  ; -- CAN Module --
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
ENDASM

;____[ if not using Low Priority INTS, create a dummy handler ]_______________
ASM
    ifndef  USE_LOWPRIORITY
INT_ENTRY_L
        retfie
    else
        if (USE_LOWPRIORITY != 1)
INT_ENTRY_L
            retfie
        endif
    endif        
ENDASM        

;_____________________________________________________________________________
Asm
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
ENDASM

;_____________________________________________________________________________
Asm
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
ENDASM

;---[Stay compatible with the 14-bit version]---------------------------------
Asm
INT_FINISH_H   macro
  endm
EndAsm

;---[Create the High Priority Interrupt Processor]----------------------------
ASM
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
ENDASM

;---[Create the Low Priority Interrupt Processor]-----------------------------
ASM
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
ENDASM

ASM
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
ENDASM

ASM

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
ENDASM

asm
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

ENDASM

; ---[See if we need to save TBLPTR]------------------------------------------
ASM
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
endasm

OVER_DT_INTS_18:

ENABLE DEBUG
