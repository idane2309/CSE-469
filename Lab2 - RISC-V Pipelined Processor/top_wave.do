onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_testbench/dut/clk
add wave -noupdate /top_testbench/dut/reset
add wave -noupdate /top_testbench/dut/done
add wave -noupdate /top_testbench/dut/hazard_unit/lw_stall
add wave -noupdate /top_testbench/dut/hazard_unit/stall_f
add wave -noupdate /top_testbench/dut/hazard_unit/stall_d
add wave -noupdate /top_testbench/dut/hazard_unit/flush_e
add wave -noupdate /top_testbench/dut/hazard_unit/flush_d
add wave -noupdate /top_testbench/dut/pc_f
add wave -noupdate -radix decimal /top_testbench/dut/pc_out_f
add wave -noupdate -radix hexadecimal /top_testbench/dut/instruction
add wave -noupdate /top_testbench/dut/pc_plus4_f
add wave -noupdate /top_testbench/dut/pc_d
add wave -noupdate -radix hexadecimal /top_testbench/dut/instr_d
add wave -noupdate /top_testbench/dut/pc_plus4_d
add wave -noupdate /top_testbench/dut/rd_data1
add wave -noupdate /top_testbench/dut/rd_data2
add wave -noupdate -radix decimal /top_testbench/dut/regfile/rs1_addr
add wave -noupdate -radix decimal /top_testbench/dut/regfile/rs2_addr
add wave -noupdate /top_testbench/dut/regfile/write_addr
add wave -noupdate /top_testbench/dut/regfile/wr_en
add wave -noupdate /top_testbench/dut/regfile/write_data
add wave -noupdate -childformat {{{/top_testbench/dut/regfile/registers[0]} -radix decimal} {{/top_testbench/dut/regfile/registers[1]} -radix decimal} {{/top_testbench/dut/regfile/registers[2]} -radix decimal} {{/top_testbench/dut/regfile/registers[3]} -radix decimal} {{/top_testbench/dut/regfile/registers[4]} -radix decimal} {{/top_testbench/dut/regfile/registers[5]} -radix decimal} {{/top_testbench/dut/regfile/registers[6]} -radix decimal} {{/top_testbench/dut/regfile/registers[7]} -radix decimal} {{/top_testbench/dut/regfile/registers[8]} -radix decimal} {{/top_testbench/dut/regfile/registers[9]} -radix decimal} {{/top_testbench/dut/regfile/registers[10]} -radix decimal} {{/top_testbench/dut/regfile/registers[11]} -radix decimal} {{/top_testbench/dut/regfile/registers[12]} -radix decimal} {{/top_testbench/dut/regfile/registers[13]} -radix decimal} {{/top_testbench/dut/regfile/registers[14]} -radix decimal} {{/top_testbench/dut/regfile/registers[15]} -radix decimal} {{/top_testbench/dut/regfile/registers[16]} -radix decimal} {{/top_testbench/dut/regfile/registers[17]} -radix decimal} {{/top_testbench/dut/regfile/registers[18]} -radix decimal} {{/top_testbench/dut/regfile/registers[19]} -radix decimal} {{/top_testbench/dut/regfile/registers[20]} -radix decimal} {{/top_testbench/dut/regfile/registers[21]} -radix decimal} {{/top_testbench/dut/regfile/registers[22]} -radix decimal} {{/top_testbench/dut/regfile/registers[23]} -radix decimal} {{/top_testbench/dut/regfile/registers[24]} -radix decimal} {{/top_testbench/dut/regfile/registers[25]} -radix decimal} {{/top_testbench/dut/regfile/registers[26]} -radix decimal} {{/top_testbench/dut/regfile/registers[27]} -radix decimal} {{/top_testbench/dut/regfile/registers[28]} -radix decimal} {{/top_testbench/dut/regfile/registers[29]} -radix decimal} {{/top_testbench/dut/regfile/registers[30]} -radix decimal} {{/top_testbench/dut/regfile/registers[31]} -radix decimal}} -expand -subitemconfig {{/top_testbench/dut/regfile/registers[0]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[1]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[2]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[3]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[4]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[5]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[6]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[7]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[8]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[9]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[10]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[11]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[12]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[13]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[14]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[15]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[16]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[17]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[18]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[19]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[20]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[21]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[22]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[23]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[24]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[25]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[26]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[27]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[28]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[29]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[30]} {-height 15 -radix decimal} {/top_testbench/dut/regfile/registers[31]} {-height 15 -radix decimal}} /top_testbench/dut/regfile/registers
add wave -noupdate /top_testbench/dut/imm_ext
add wave -noupdate /top_testbench/dut/mem_write
add wave -noupdate /top_testbench/dut/result_src
add wave -noupdate /top_testbench/dut/alu_control
add wave -noupdate /top_testbench/dut/alu_src_b
add wave -noupdate /top_testbench/dut/imm_src
add wave -noupdate /top_testbench/dut/reg_write
add wave -noupdate /top_testbench/dut/branch
add wave -noupdate /top_testbench/dut/jump
add wave -noupdate /top_testbench/dut/branch_sel
add wave -noupdate /top_testbench/dut/pc_e
add wave -noupdate /top_testbench/dut/imm_ext_e
add wave -noupdate /top_testbench/dut/pc_plus4_e
add wave -noupdate /top_testbench/dut/rd_data1_e
add wave -noupdate /top_testbench/dut/rd_data2_e
add wave -noupdate /top_testbench/dut/hazard_unit/rs2_addr_d
add wave -noupdate /top_testbench/dut/hazard_unit/rs1_addr_d
add wave -noupdate /top_testbench/dut/write_addr_e
add wave -noupdate /top_testbench/dut/reg_write_e
add wave -noupdate /top_testbench/dut/mem_write_e
add wave -noupdate /top_testbench/dut/branch_e
add wave -noupdate /top_testbench/dut/jump_e
add wave -noupdate /top_testbench/dut/execute_adder_mux/pc_e
add wave -noupdate /top_testbench/dut/execute_adder_mux/rd_data1_e
add wave -noupdate /top_testbench/dut/execute_adder_mux/control_e_adder
add wave -noupdate /top_testbench/dut/execute_adder_mux/src_to_adder
add wave -noupdate /top_testbench/dut/branch_sel_e
add wave -noupdate /top_testbench/dut/result_src_e
add wave -noupdate /top_testbench/dut/alu_control_e
add wave -noupdate /top_testbench/dut/alu_src_b_e
add wave -noupdate -radix decimal /top_testbench/dut/rs1_addr_e
add wave -noupdate -radix decimal /top_testbench/dut/rs2_addr_e
add wave -noupdate /top_testbench/dut/pc_src_e
add wave -noupdate /top_testbench/dut/forward_srcA_out
add wave -noupdate /top_testbench/dut/forward_srcB_out
add wave -noupdate /top_testbench/dut/src_b_out
add wave -noupdate /top_testbench/dut/pc_target
add wave -noupdate -radix decimal /top_testbench/dut/ALU/src_a
add wave -noupdate -radix decimal /top_testbench/dut/ALU/src_b
add wave -noupdate -radix decimal /top_testbench/dut/alu_result
add wave -noupdate /top_testbench/dut/zero
add wave -noupdate /top_testbench/dut/less_than
add wave -noupdate -radix decimal /top_testbench/dut/alu_result_m
add wave -noupdate -radix decimal /top_testbench/dut/writeback_mux/alu_result_w
add wave -noupdate /top_testbench/dut/wr_data_m
add wave -noupdate /top_testbench/dut/pc_plus4_m
add wave -noupdate /top_testbench/dut/write_addr_m
add wave -noupdate /top_testbench/dut/result_src_m
add wave -noupdate /top_testbench/dut/reg_write_m
add wave -noupdate /top_testbench/dut/mem_write_m
add wave -noupdate /top_testbench/dut/rd_data
add wave -noupdate /top_testbench/dut/rd_data_w
add wave -noupdate /top_testbench/dut/pc_plus4_w
add wave -noupdate /top_testbench/dut/write_addr_w
add wave -noupdate /top_testbench/dut/reg_write_w
add wave -noupdate /top_testbench/dut/result_src_w
add wave -noupdate -radix decimal /top_testbench/dut/wb_result_w
add wave -noupdate /top_testbench/dut/forward_srcA_e
add wave -noupdate /top_testbench/dut/forward_srcB_e
add wave -noupdate /top_testbench/dut/stall_f
add wave -noupdate /top_testbench/dut/stall_d
add wave -noupdate /top_testbench/dut/flush_e
add wave -noupdate /top_testbench/dut/flush_d
add wave -noupdate -childformat {{{/top_testbench/dut/data_mem/mem[68]} -radix decimal} {{/top_testbench/dut/data_mem/mem[67]} -radix decimal} {{/top_testbench/dut/data_mem/mem[66]} -radix decimal} {{/top_testbench/dut/data_mem/mem[65]} -radix decimal}} -expand -subitemconfig {{/top_testbench/dut/data_mem/mem[68]} {-height 15 -radix decimal} {/top_testbench/dut/data_mem/mem[67]} {-height 15 -radix decimal} {/top_testbench/dut/data_mem/mem[66]} {-height 15 -radix decimal} {/top_testbench/dut/data_mem/mem[65]} {-height 15 -radix decimal}} /top_testbench/dut/data_mem/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {415900 ps} 0}
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
WaveRestoreZoom {0 ps} {733184 ps}
