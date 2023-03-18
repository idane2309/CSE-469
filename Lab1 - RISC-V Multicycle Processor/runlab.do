# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./top.sv"
vlog "./pc.sv"
vlog "./pc_to_instr_mux.sv"
vlog "./instr_data_mem.sv"
vlog "./data_reg.sv"
vlog "./reg_instr.sv"
vlog "./regfile.sv"
vlog "./imm_extend.sv"
vlog "./reg_to_alu.sv"
vlog "./alusrcA_mux.sv"
vlog "./alusrcB_mux.sv"
vlog "./ALU.sv"
vlog "./aluout_reg.sv"
vlog "./aluout_mux.sv"
vlog "./control_unit.sv"
vlog "./control_fsm.sv"
vlog "./control_alu_decoder.sv"
vlog "./control_instr_decoder.sv"
vlog "./control_branch_decoder.sv"
vlog "./wordsize_decoder.sv"
vlog "./wordsize_store_decoder.sv"
vlog "./oldpc_mux.sv"




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
