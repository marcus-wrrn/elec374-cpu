onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /div_tb/pc_out
add wave -noupdate -radix hexadecimal /div_tb/zlo_out
add wave -noupdate -radix hexadecimal /div_tb/zhi_out
add wave -noupdate -radix hexadecimal /div_tb/mdr_out
add wave -noupdate -radix hexadecimal /div_tb/mar_enable
add wave -noupdate -radix hexadecimal /div_tb/z_enable
add wave -noupdate -radix hexadecimal /div_tb/lo_enable
add wave -noupdate -radix hexadecimal /div_tb/hi_enable
add wave -noupdate -radix hexadecimal /div_tb/pc_enable
add wave -noupdate -radix hexadecimal /div_tb/mdr_enable
add wave -noupdate -radix hexadecimal /div_tb/read
add wave -noupdate -radix hexadecimal /div_tb/ir_enable
add wave -noupdate -radix hexadecimal /div_tb/y_enable
add wave -noupdate -radix hexadecimal /div_tb/pc_increment
add wave -noupdate -radix hexadecimal /div_tb/r4_enable
add wave -noupdate -radix hexadecimal /div_tb/r5_enable
add wave -noupdate -radix hexadecimal /div_tb/r4_out
add wave -noupdate -radix hexadecimal /div_tb/r5_out
add wave -noupdate -radix hexadecimal /div_tb/clk
add wave -noupdate -radix hexadecimal /div_tb/clr
add wave -noupdate -radix hexadecimal /div_tb/op_code
add wave -noupdate -radix hexadecimal /div_tb/m_data_in
add wave -noupdate -radix hexadecimal /div_tb/present_state
add wave -noupdate -radix hexadecimal /div_tb/DUT/r4/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/r5/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/y/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/zlo/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/zhi/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/lo/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/hi/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/ir/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/mar/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/mdr/q
add wave -noupdate -radix hexadecimal /div_tb/DUT/pc/pc_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {598629 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 163
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {630 ns}
