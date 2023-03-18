onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_testbench/dut/clk
add wave -noupdate /top_testbench/dut/reset
add wave -noupdate /top_testbench/dut/regfile/check
add wave -noupdate /top_testbench/done
add wave -noupdate -radix decimal /top_testbench/dut/pc_out
add wave -noupdate /top_testbench/dut/pc_write
add wave -noupdate /top_testbench/dut/addr_out
add wave -noupdate /top_testbench/dut/addr_src
add wave -noupdate /top_testbench/dut/mem_write
add wave -noupdate /top_testbench/dut/rd_data
add wave -noupdate /top_testbench/dut/wr_data
add wave -noupdate /top_testbench/dut/data_out
add wave -noupdate /top_testbench/dut/ir_write
add wave -noupdate /top_testbench/dut/instruction
add wave -noupdate /top_testbench/dut/old_pc
add wave -noupdate -radix decimal /top_testbench/dut/rd_data1
add wave -noupdate -radix decimal /top_testbench/dut/rd_data2
add wave -noupdate /top_testbench/dut/reg_write
add wave -noupdate /top_testbench/dut/imm_src
add wave -noupdate /top_testbench/dut/imm_ext
add wave -noupdate /top_testbench/dut/A
add wave -noupdate /top_testbench/dut/B
add wave -noupdate /top_testbench/dut/oldpc_mux/old_pc
add wave -noupdate /top_testbench/dut/oldpc_mux/rd_data1
add wave -noupdate /top_testbench/dut/control_unit/control_instr_decoder/oldpc_control
add wave -noupdate /top_testbench/dut/oldpc_mux/srcA_data
add wave -noupdate -radix decimal /top_testbench/dut/alu_src_a
add wave -noupdate -radix decimal /top_testbench/dut/src_a_out
add wave -noupdate -radix decimal /top_testbench/dut/alu_src_b
add wave -noupdate -radix decimal /top_testbench/dut/src_b_out
add wave -noupdate -radix decimal /top_testbench/dut/alu_result
add wave -noupdate /top_testbench/dut/zero
add wave -noupdate /top_testbench/dut/negative
add wave -noupdate /top_testbench/dut/overflow
add wave -noupdate -radix decimal /top_testbench/dut/alu_control
add wave -noupdate -radix decimal /top_testbench/dut/alu_out
add wave -noupdate -radix decimal /top_testbench/dut/result_src
add wave -noupdate -radix decimal /top_testbench/dut/alu_mux_out
add wave -noupdate /top_testbench/dut/control_unit/branch
add wave -noupdate /top_testbench/dut/control_unit/branch_out
add wave -noupdate /top_testbench/dut/control_unit/control_fsm/currentState
add wave -noupdate -radix decimal -childformat {{{/top_testbench/dut/regfile/regfile[0]} -radix decimal} {{/top_testbench/dut/regfile/regfile[1]} -radix decimal} {{/top_testbench/dut/regfile/regfile[2]} -radix decimal} {{/top_testbench/dut/regfile/regfile[3]} -radix decimal} {{/top_testbench/dut/regfile/regfile[4]} -radix decimal} {{/top_testbench/dut/regfile/regfile[5]} -radix decimal} {{/top_testbench/dut/regfile/regfile[6]} -radix decimal} {{/top_testbench/dut/regfile/regfile[7]} -radix decimal} {{/top_testbench/dut/regfile/regfile[8]} -radix decimal} {{/top_testbench/dut/regfile/regfile[9]} -radix decimal} {{/top_testbench/dut/regfile/regfile[10]} -radix decimal} {{/top_testbench/dut/regfile/regfile[11]} -radix decimal} {{/top_testbench/dut/regfile/regfile[12]} -radix decimal} {{/top_testbench/dut/regfile/regfile[13]} -radix decimal} {{/top_testbench/dut/regfile/regfile[14]} -radix decimal} {{/top_testbench/dut/regfile/regfile[15]} -radix decimal} {{/top_testbench/dut/regfile/regfile[16]} -radix decimal} {{/top_testbench/dut/regfile/regfile[17]} -radix decimal} {{/top_testbench/dut/regfile/regfile[18]} -radix decimal} {{/top_testbench/dut/regfile/regfile[19]} -radix decimal} {{/top_testbench/dut/regfile/regfile[20]} -radix decimal} {{/top_testbench/dut/regfile/regfile[21]} -radix decimal} {{/top_testbench/dut/regfile/regfile[22]} -radix decimal} {{/top_testbench/dut/regfile/regfile[23]} -radix decimal} {{/top_testbench/dut/regfile/regfile[24]} -radix decimal} {{/top_testbench/dut/regfile/regfile[25]} -radix decimal} {{/top_testbench/dut/regfile/regfile[26]} -radix decimal} {{/top_testbench/dut/regfile/regfile[27]} -radix decimal} {{/top_testbench/dut/regfile/regfile[28]} -radix decimal} {{/top_testbench/dut/regfile/regfile[29]} -radix decimal} {{/top_testbench/dut/regfile/regfile[30]} -radix decimal} {{/top_testbench/dut/regfile/regfile[31]} -radix decimal}} -expand -subitemconfig {{/top_testbench/dut/regfile/regfile[0]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[1]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[2]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[3]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[4]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[5]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[6]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[7]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[8]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[9]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[10]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[11]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[12]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[13]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[14]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[15]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[16]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[17]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[18]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[19]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[20]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[21]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[22]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[23]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[24]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[25]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[26]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[27]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[28]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[29]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[30]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/regfile[31]} {-height 15 -radix decimal}} /top_testbench/dut/regfile/regfile
add wave -noupdate /top_testbench/dut/control_unit/alu_op
add wave -noupdate /top_testbench/dut/wordsize_store_decoder/dout
add wave -noupdate /top_testbench/dut/control_unit/less_than
add wave -noupdate -childformat {{{/top_testbench/dut/instr_data_mem/mem[68]} -radix decimal} {{/top_testbench/dut/instr_data_mem/mem[67]} -radix decimal} {{/top_testbench/dut/instr_data_mem/mem[66]} -radix decimal} {{/top_testbench/dut/instr_data_mem/mem[65]} -radix decimal} {{/top_testbench/dut/instr_data_mem/mem[64]} -radix decimal} {{/top_testbench/dut/instr_data_mem/mem[24]} -radix binary}} -expand -subitemconfig {{/top_testbench/dut/instr_data_mem/mem[68]} {-height 15 -radix decimal} {/top_testbench/dut/instr_data_mem/mem[67]} {-height 15 -radix decimal} {/top_testbench/dut/instr_data_mem/mem[66]} {-height 15 -radix decimal} {/top_testbench/dut/instr_data_mem/mem[65]} {-height 15 -radix decimal} {/top_testbench/dut/instr_data_mem/mem[64]} {-height 15 -radix decimal} {/top_testbench/dut/instr_data_mem/mem[24]} {-height 15 -radix binary}} /top_testbench/dut/instr_data_mem/mem
add wave -noupdate /top_testbench/dut/control_unit/branch
add wave -noupdate /top_testbench/dut/control_unit/control_instr_decoder/branch_sel
add wave -noupdate /top_testbench/dut/control_unit/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {284 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {512 ps}
