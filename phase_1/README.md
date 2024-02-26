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
R1 = 
R2 = 
R3 = 

add R1, R2, R3

Result:
R1 = 
```

### SUB

![SUB testbench waveforms](/phase_1/images/sub_tb.png)

```verilog
R1 = 
R2 = 
R3 = 

sub R1, R2, R3

Result:
R1 = 
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
R4 = 
R5 = 

div R4, R5

Result:
HI = 
LO = 
```

### SHR

![SHR testbench waveforms](/phase_1/images/shr_tb.png)

```verilog
R1 = 
R2 = 
R3 = 

shr R1, R2, R3

Result:
R1 = 
```

### SHRA

![SHRA testbench waveforms](/phase_1/images/shra_tb.png)

```verilog
R1 = 
R2 = 
R3 = 

shra R1, R2, R3

Result:
R1 = 
```

### SHL

![SHL testbench waveforms](/phase_1/images/shl_tb.png)

```verilog
R1 = 
R2 = 
R3 = 

shl R1, R2, R3

Result:
R1 = 
```

### ROR

![ROR testbench waveforms](/phase_1/images/ror_tb.png)

```verilog
R1 = 
R2 = 
R3 = 

ror R1, R2, R3

Result:
R1 = 
```

### ROL

![ROL testbench waveforms](/phase_1/images/rol_tb.png)

```verilog
R1 = 
R2 = 
R3 = 

rol R1, R2, R3

Result:
R1 = 
```

### NEG

![NEG testbench waveforms](/phase_1/images/neg_tb.png)

```verilog
R6 = 
R7 = 

neg R6, R7

Result:
R6 = 
```

### NOT

![NOT testbench waveforms](/phase_1/images/not_tb.png)

```verilog
R6 = 
R7 = 

not R6, R7

Result:
R6 = 
```