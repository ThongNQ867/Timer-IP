# Timer IP Design

A configurable **64-bit Timer IP** implemented in Verilog based on a provided hardware specification. The timer communicates with a processor through an **APB interface** and provides programmable counting, compare-based interrupts, and debug halt functionality.

## Features

* 64-bit up-counter
* APB slave interface

  * 12-bit address
  * 32-bit read/write data
  * Wait-state support
  * Error response
  * Partial byte access
* Configurable counting speed

  * System clock rate
  * Clock division by 2, 4, 8, 16, 32, 64, 128, or 256
* Programmable compare value for interrupt generation
* Timer interrupt enable and status control
* Debug-mode halt functionality
* Active-low asynchronous reset

## Architecture


### APB Slave

The APB slave handles communication between the APB master and the timer registers. It decodes the address, generates read/write enables, handles the APB wait state, and produces error responses for invalid accesses.

### Register Bank

The timer configuration and status are stored in a set of memory-mapped registers:

| Offset | Register | Description                                   |
| ------ | -------- | --------------------------------------------- |
| `0x00` | `TCR`    | Timer control and clock-divider configuration |
| `0x04` | `TDR0`   | Lower 32 bits of timer counter                |
| `0x08` | `TDR1`   | Upper 32 bits of timer counter                |
| `0x0C` | `TCMP0`  | Lower 32 bits of compare value                |
| `0x10` | `TCMP1`  | Upper 32 bits of compare value                |
| `0x14` | `TIER`   | Timer interrupt enable                        |
| `0x18` | `TISR`   | Timer interrupt status                        |
| `0x1C` | `THCSR`  | Timer halt control and status                 |

### Count Control

The count control module determines when the 64-bit counter should increment.

When clock division is disabled, the counter increments every system clock cycle while the timer is enabled. When division is enabled, an internal counter generates a `count_en` pulse according to the configured divider value.

### 64-bit Counter

The timer counter is implemented using two 32-bit registers: TDR0 and TDR1

The counter increments when `count_en` is asserted and writes the updated value back to `TDR0` and `TDR1`.

### Interrupt Control

The timer supports programmable compare-based interrupts. The current 64-bit counter value is compared against the value stored in `TCMP0` and `TCMP1`.

When the values match, the interrupt status is set. The `TIER` register controls whether the pending interrupt is propagated to the `tim_int` output.

The interrupt status register uses **write-one-to-clear (RW1C)** behavior.

### Debug Halt

The timer supports a debug halt mechanism through `THCSR`. A halt request is accepted when `dbg_mode` is asserted. While halted, the counter-control logic stops counting while retaining its current state.

## Error Handling

The APB interface generates an error response when an invalid configuration is attempted. Examples include:

* Changing `DIV_VAL` while the timer is running
* Changing `DIV_EN` while the timer is running
* Writing a prohibited value to `DIV_VAL`

Invalid configuration values do not modify the corresponding register.

## Design Structure

The RTL is organized into separate modules to keep the design modular and easier to debug:

```text
timer_ip
├── APB Slave
├── Register
├── Read Data
├── Count Control
├── Counter
└── Interrupt Control
```

## Tools & Technologies

* **Verilog**
* **RTL Design**
* **APB Protocol**
* **Digital Design**
* **QuestaSim**
* **Waveform-based Debugging**

## Project Outcome

This project provided hands-on experience translating a hardware specification into a modular RTL design. The implementation involved designing the APB interface, defining register behavior, implementing programmable counter control, handling interrupt logic and error conditions, and integrating the individual RTL modules into a complete timer IP.
