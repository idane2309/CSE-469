onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_testbench/A
add wave -noupdate /alu_testbench/B
add wave -noupdate /alu_testbench/result
add wave -noupdate /alu_testbench/opcode
add wave -noupdate /alu_testbench/funct3
add wave -noupdate /alu_testbench/funct7
add wave -noupdate /alu_testbench/zero
add wave -noupdate /alu_testbench/overflow
add wave -noupdate /alu_testbench/negative
add wave -noupdate /alu_testbench/clk
add wave -noupdate /alu_testbench/signed_A
add wave -noupdate /alu_testbench/signed_B
add wave -noupdate /alu_testbench/branch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2773 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 109
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {9477 ps}
