# Phase 1 Documentation

## Testbench Waveforms

### AND

![AND testbench waveforms](/phase_1/waveforms/and_tb.png)

```verilog
R1 = 0xFFFFFFFF
R2 = 0xF0F0F0F0
R3 = 0xFFFFFFFF

and R1, R2, R3

Result:
R1 = 0xF0F0F0F0
```

### OR

```verilog
or R1, R2, R3
```

### ADD

```verilog
add R1, R2, R3
```

### SUB

```verilog
sub R1, R2, R3
```

### MUL

```verilog
R4 = 11111111
R5 = 11111111

mul R4, R5

Result:
HI = 
LO = 
```

### DIV

```verilog
div R4, R5


```

### SHR

```verilog
shr R1, R2, R3
```

### SHRA

```verilog
shra R1, R2, R3
```

### SHL

```verilog
shl R1, R2, R3
```

### ROR

```verilog
ror R1, R2, R3
```

### ROL

```verilog
rol R1, R2, R3
```

### NEG

```verilog
neg R6, R7
```

### NOT

```verilog
not R6, R7
```