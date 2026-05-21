# Level Meter - PIC18F4550 Embedded Controller

A water level monitoring and pump control system built on the PIC18F4550 microcontroller.  
Designed and deployed for public swimming pool management at a sports center - running flawlessly for **5+ years without a single failure**.

> Built entirely from scratch - firmware, PCB design, and probe hardware.

---

## Overview

The system monitors water levels in compensation tanks and automatically controls pumps and solenoid valves based on measured levels. It was built specifically to manage three pools at a sports facility:

| Pool | Type |
|---|---|
| A - Veliki bazen | Olympic indoor pool |
| B - Mali bazen | Olympic outdoor pool |
| C - Spoljni bazen | Auxiliary pool |

---

## Hardware

| Component | Details |
|---|---|
| **Microcontroller** | Microchip PIC18F4550 |
| **Firmware language** | PicBasic Pro 3.0 |
| **PCB design** | Sprint Layout 5.0 |
| **Display** | I²C 2×16 LCD (PCF8574A) |
| **Clock** | 4 MHz internal oscillator |
| **Communication** | RS-232 serial debug output |

---

## I/O Mapping

### Inputs - Level sensors (12 total, 4 per tank)

| Pin | Signal | Description |
|---|---|---|
| PORTA.0–3 | levelA1–A4 | Tank A level probes |
| PORTA.4–5, PORTE.0–1 | levelB1–B4 | Tank B level probes |
| PORTE.2, PORTC.0–2 | levelC1–C4 | Tank C level probes |
| PORTB.0–5 | tService, tUp, tDown, tRight, tOk, tLeft | Navigation buttons |

### Outputs - Relays (6 total, 2 per tank)

| Pin | Signal | Description |
|---|---|---|
| PORTC.6 | valveA | Solenoid valve - Tank A |
| PORTC.7 | pumpA | Pump relay - Tank A |
| PORTD.1 | valveB | Solenoid valve - Tank B |
| PORTD.0 | pumpB | Pump relay - Tank B |
| PORTD.2 | valveC | Solenoid valve - Tank C |
| PORTD.3 | pumpC | Pump relay - Tank C |

---

## Control Logic

The core logic runs as a **hardware timer interrupt (TMR1) every ~1 second** in the background, independent of the UI loop. Each tank follows the same state machine:

```
Level probes (bottom to top):
  L1 - Alarm / minimum level (pump protection)
  L2 - High level  → open valve (discharge water back to pool)
  L3 - Low level   → start pump (fill tank from pool)
  L4 - Reserved / alarm
```

### Per-tank logic (same for A, B and C):

**Valve control (discharge):**
- If `L2 = HIGH` for 15 consecutive seconds → open valve (send water back to pool)
- If `L1 = LOW` for 15 consecutive seconds → close valve (protect minimum level)

**Pump control (fill):**
- If `L2 = LOW AND L3 = LOW` for 15 consecutive seconds → start pump (tank is low, fill it)
- If `L2 = HIGH AND L3 = HIGH` for 15 consecutive seconds → stop pump (tank is full)

**Safety rule:**  
A minimum water level is always maintained in the tank to prevent the pump from running dry.  
If a tank is disabled via the menu, both pump and valve are immediately forced off.

**Debounce / confirmation:**  
All state changes require a signal to be stable for **15 consecutive timer ticks** before any relay fires. This prevents false triggers from wave movement or electrical noise on the probes.

---

## Water Level Probes

The probes work by passing a small **AC current (~30–50 mA)** through the water via **brass electrodes**.

When the circuit closes through the water:
1. Signal passes through a **bridge rectifier**
2. Then through an **optocoupler**
3. The optocoupler output drives the microcontroller input pin

**Why AC and optocouplers?**
- AC current ensures the electrodes wear **evenly** on both sides
- Low current (~30–50 mA) prevents **electrode corrosion**
- Optocouplers provide **full galvanic isolation** between the water circuit and the microcontroller, protecting against surges and noise

---

## Firmware Structure

| Subroutine | Description |
|---|---|
| `Splash` | Startup screen, firmware version display, EEPROM init |
| `Main` | Main loop - refreshes LCD status, polls buttons, handles serial debug output |
| `Logika` | TMR1 interrupt handler - runs all pump/valve control logic every ~1 sec |
| `Menu` | Navigation menu - enable/disable each pool's automation |
| `MenuAutomatika` | Submenu - toggle automation ON/OFF per pool, saves to EEPROM |
| `ServiceMode` | Service menu - manual inspection of all probe and relay states |
| `ServiceModePrikaz` | Live display of probe levels and relay states per pool |
| `ReadFromEeprom` | Load pool on/off settings from EEPROM into RAM on startup |
| `OcitajTastere` | Button edge detection - fires only on falling edge (press), not hold |
| `Sacuvano` | "Settings saved" confirmation screen |

### EEPROM layout

| Address | Variable | Description |
|---|---|---|
| 5 | Bazen1Ukljucen | Pool A automation enabled (0/1) |
| 6 | Bazen2Ukljucen | Pool B automation enabled (0/1) |
| 7 | Bazen3Ukljucen | Pool C automation enabled (0/1) |

Settings survive power cycles. On first boot, uninitialized locations (0xFF) are automatically set to 0.

### Serial debug output (RS-232)

On every main loop cycle the controller streams live state over RS-232:

```
A: 1010 B: 0110 C: 1100
[PV] A: 01 B: 00 C: 10
```

Where each digit represents a probe or relay state (1 = active, 0 = inactive).

---

## Notes

- Each pool can be independently enabled or disabled from the menu without affecting the others.
- Button input uses **falling-edge detection** - holding a button does not repeat, preventing accidental changes.
- The firmware is written in **PicBasic Pro 3.0** using interrupt-driven architecture (DT_INTS-18 library) to keep the control logic fully decoupled from the UI.

---

## License

MIT
