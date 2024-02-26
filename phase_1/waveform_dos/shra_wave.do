onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /shra_tb/pc_out
add wave -noupdate -radix hexadecimal /shra_tb/zlo_out
add wave -noupdate -radix hexadecimal /shra_tb/zhi_out
add wave -noupdate -radix hexadecimal /shra_tb/mdr_out
add wave -noupdate -radix hexadecimal /shra_tb/mar_enable
add wave -noupdate -radix hexadecimal /shra_tb/z_enable
add wave -noupdate -radix hexadecimal /shra_tb/pc_enable
add wave -noupdate -radix hexadecimal /shra_tb/mdr_enable
add wave -noupdate -radix hexadecimal /shra_tb/read
add wave -noupdate -radix hexadecimal /shra_tb/ir_enable
add wave -noupdate -radix hexadecimal /shra_tb/y_enable
add wave -noupdate -radix hexadecimal /shra_tb/pc_increment
add wave -noupdate -radix hexadecimal /shra_tb/r1_enable
add wave -noupdate -radix hexadecimal /shra_tb/r2_enable
add wave -noupdate -radix hexadecimal /shra_tb/r3_enable
add wave -noupdate -radix hexadecimal /shra_tb/r2_out
add wave -noupdate -radix hexadecimal /shra_tb/r3_out
add wave -noupdate -radix hexadecimal /shra_tb/clk
add wave -noupdate -radix hexadecimal /shra_tb/clr
add wave -noupdate -radix hexadecimal /shra_tb/op_code
add wave -noupdate -radix hexadecimal /shra_tb/m_data_in
add wave -noupdate -radix hexadecimal /shra_tb/zlo_data
add wave -noupdate -radix hexadecimal /shra_tb/present_state
add wave -noupdate -radix hexadecimal /shra_tb/toggle
add wave -noupdate -radix hexadecimal /shra_tb/DUT/r1/q
add wave -noupdate -radix hexadecimal /shra_tb/DUT/r2/q
add wave -noupdate -radix hexadecimal /shra_tb/DUT/r3/q
add wave -noupdate -radix hexadecimal /shra_tb/DUT/y/q
add wave -noupdate -radix hexadecimal /shra_tb/DUT/ir/q
add wave -noupdate -radix hexadecimal /shra_tb/DUT/mar/q
add wave -noupdate -radix hexadecimal /shra_tb/DUT/mdr/q
add wave -noupdate -radix hexadecimal /shra_tb/DUT/pc/pc_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {582130 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 166
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {722196 ps}
