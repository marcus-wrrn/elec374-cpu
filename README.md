# elec374-cpu

The purpose of this project is to design, simulate, implement, and verify a simple RISC computer.
The design consists of a simple RISC processor, memory, and I/O. Intel Quartus Prime Design Software
and ModelSim-Intel are used for this purpose. The design is to be implemented on the Cyclone V chip
(5CEBA4F23C7) of the DE0-CV development board.

Read more about this project in the [CPU Specifications](/documents/cpu_specification.pdf).

## Phase 1

The objective of this phase is to build some of the datapath, registers, and ALU.

- [Phase 1 Instructions](/documents/phase_1/phase_1.pdf)

- [Phase 1 Rubric](/documents/phase_1/phase_1_rubric.pdf)

### To implement

- [x] registers.v
  - [x] reg_32_bit
  - [x] pc_reg
- [ ] datapath.v
  - [ ] bus
  - [ ] registers
    - [ ] mdr
    - [ ] mar
    - [ ] ir
    - [ ] hi/lo
    - [ ] pc
    - [ ] y
    - [ ] z
  - [x] bus_mux_32_to_1.v
  - [x] encoder_32_to_5.v
- [ ] mul.v
- [ ] div.v
- [ ] add.v
- [ ] sub.v
- [x] logical_ops.v
  - [x] logical_and
  - [x] logical_or
  - [x] logical_neg
  - [x] logical_not
- [x] shift_ops.v
  - [x] shr
  - [x] shra
  - [x] shl
- [x] rotate_ops.v
  - [x] ror
  - [x] rol
