# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./top.sv"
vlog "./pc_mux.sv"
vlog "./pc_reg.sv"
vlog "./instr_mem.sv"
vlog "./pc_plus4_adder.sv"
vlog "./fetch_register.sv"
vlog "./regfile.sv"
vlog "./imm_extend.sv"
vlog "./decode_register.sv"
vlog "./execute_branch_decoder.sv"
vlog "./forward_srcA_mux.sv"
vlog "./forward_srcB_mux.sv"
vlog "./alusrcB_mux.sv"
vlog "./pc_target_adder.sv"
vlog "./ALU.sv"
vlog "./execute_register.sv"
vlog "./data_mem.sv"
vlog "./single_control_unit.sv"
vlog "./control_fsm.sv"
vlog "./single_control_alu_decoder.sv"
vlog "./single_control_instr_decoder.sv"
vlog "./memory_register.sv"
vlog "./writeback_mux.sv"
vlog "./hazard_unit.sv"
vlog "./execute_adder_mux.sv"




# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work top_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do top_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
