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
add R1, R2, R3
```

### SUB

![SUB testbench waveforms](/phase_1/images/sub_tb.png)

```verilog
sub R1, R2, R3
```

### MUL

![MUL testbench waveforms](/phase_1/images/mul_tb.png)

```verilog
R4 = 0x11111111
R5 = 0x11111111

mul R4, R5

Result:
HI = 
LO = 
```

### DIV

![DIV testbench waveforms](/phase_1/images/div_tb.png)

```verilog
div R4, R5


```

### SHR

![SHR testbench waveforms](/phase_1/images/shr_tb.png)

```verilog
shr R1, R2, R3
```

### SHRA

![SHRA testbench waveforms](/phase_1/images/shra_tb.png)

```verilog
shra R1, R2, R3
```

### SHL

![SHL testbench waveforms](/phase_1/images/shl_tb.png)

```verilog
shl R1, R2, R3
```

### ROR

![ROR testbench waveforms](/phase_1/images/ror_tb.png)

```verilog
ror R1, R2, R3
```

### ROL

![ROL testbench waveforms](/phase_1/images/rol_tb.png)

```verilog
rol R1, R2, R3
```

### NEG

![NEG testbench waveforms](/phase_1/images/neg_tb.png)

```verilog
neg R6, R7
```

### NOT

![NOT testbench waveforms](/phase_1/images/not_tb.png)

```verilog
not R6, R7
```

## Testbench Code

```

```