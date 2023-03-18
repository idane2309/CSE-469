module control_unit(clk, reset, opcode, funct3, funct7, zero, negative, pc_write, addr_src, mem_write, ir_write, result_src, alu_control, alu_src_a, alu_src_b, imm_src, reg_write, load_or_store, less_than, oldpc_control, branch_out, pc_update);
    
    input logic clk, reset;
    input logic [6:0]opcode;
    input logic [2:0]funct3;
    input logic [6:0]funct7;
    input logic zero, negative, less_than; 
    output logic pc_write;
    output logic addr_src;
    output logic mem_write;
    output logic ir_write;
    output logic [1:0]result_src;
    output logic [3:0]alu_control;
    output logic [1:0]alu_src_a;
    output logic [2:0]alu_src_b; 
    output logic [2:0]imm_src;
    output logic reg_write;
    output logic load_or_store; 
    output logic oldpc_control; //FOR JALR INSTRUCTION
    output logic branch_out;
    output logic pc_update;

    logic [2:0]branch_sel; 
    logic branch;
    logic [1:0]alu_op;
    
    //Control FSM
    control_fsm control_fsm(.clk, .reset, .opcode, .branch, .pc_update, .reg_write, .mem_write, .ir_write, .result_src, .alu_src_a, .alu_src_b(alu_src_b), .addr_src, .alu_op, .oldpc_control);
   
    //ADDED Control Branch Decoder
    control_branch_decoder control_branch_decoder(.negative, .zero, .branch, .branch_sel, .branch_out, .less_than);
    
    //PCWrite Circuit DONT NEED HERE?
    //assign pc_write = branch_out | pc_update;
    
    //Control ALU Decoder
    control_alu_decoder control_alu_decoder(.funct3, .funct7, .opcode, .alu_op, .alu_control);
    
    //Control Instruction Decoder
    control_instr_decoder control_instr_decoder(.opcode, .funct3, .imm_src, .branch_sel, .load_or_store);

endmodule