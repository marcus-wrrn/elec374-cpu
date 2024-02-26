# Phase 1 Documentation

## Testbench Waveforms

### AND

![AND testbench waveforms](/phase_1/images/and_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0xF0F0F0F0
R3 = 0xFFFFFFFF

and R1, R2, R3

Result:
R1 = 0xF0F0F0F0
```

### OR

![OR testbench waveforms](/phase_1/images/or_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0xA0A0A0A0
R3 = 0x01010101

or R1, R2, R3

Result:
R1 = 0xA1A1A1A1
```

### ADD

![ADD testbench waveforms](/phase_1/images/add_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0x0FFFFFFF
R3 = 0x00000001

add R1, R2, R3

Result:
R1 = 0x10000000
```

### SUB

![SUB testbench waveforms](/phase_1/images/sub_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0x0FFFFFFF
R3 = 0x00000001

sub R1, R2, R3

Result:
R1 = 0x0FFFFFFE
```

### MUL

![MUL testbench waveforms](/phase_1/images/mul_tb.png)

```verilog
R4 = 0x11111111
R5 = 0xFFFFFFFF

mul R4, R5

Result:
HI = 01234567
LO = 87654321
```

### DIV

![DIV testbench waveforms](/phase_1/images/div_tb.png)

```verilog
R4 = 0x00000007
R5 = 0x00000002

div R4, R5

Result:
HI = 0x00000001
LO = 0x00000003
```

### SHR

![SHR testbench waveforms](/phase_1/images/shr_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0xF0000000
R3 = 0x00000004

shr R1, R2, R3

Result:
R1 = 0x0F000000
```

### SHRA

![SHRA testbench waveforms](/phase_1/images/shra_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0xFFFFFFF8
R3 = 0x00000001

shra R1, R2, R3

Result:
R1 = 0xFFFFFFFC
```

### SHL

![SHL testbench waveforms](/phase_1/images/shl_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0x00000001
R3 = 0x00000001

shl R1, R2, R3

Result:
R1 = 0x00000002
```

### ROR

![ROR testbench waveforms](/phase_1/images/ror_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0x00000001
R3 = 0x00000001

ror R1, R2, R3

Result:
R1 = 0x80000000
```

### ROL

![ROL testbench waveforms](/phase_1/images/rol_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0x00000001
R3 = 0x00000001

rol R1, R2, R3

Result:
R1 = 0x00000002
```

### NEG

![NEG testbench waveforms](/phase_1/images/neg_tb.png)

```verilog
R6 = 0x00000005
R7 = 0x00000005

neg R6, R7

Result:
R6 = 0xFFFFFFFB
```

### NOT

![NOT testbench waveforms](/phase_1/images/not_tb.png)

```verilog
R6 = 0x0000FFFF
R7 = 0x0000FFFF

not R6, R7

Result:
R6 = 0xFFFF0000
```

## Testbench Code