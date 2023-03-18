module single_control_unit(opcode, funct3, funct7, result_src, mem_write, alu_src_b, imm_src, reg_write, alu_control, branch, jump, branch_sel, control_e_adder);
    input logic [6:0] opcode;
    input logic [2:0] funct3;
    input logic [6:0] funct7;
    output logic mem_write, reg_write, branch, jump;
    output logic [2:0] alu_src_b;
    output logic [1:0] result_src;
    output logic [3:0] alu_control;
    output logic [2:0] branch_sel;
    output logic [2:0]imm_src;
    output logic control_e_adder;

    logic [1:0] alu_op;
    single_control_instr_decoder single_control_instr_decoder(.opcode, .funct3, .mem_write, .reg_write, .branch, .jump, .alu_src_b, .result_src, .alu_op, .branch_sel, .imm_src, .control_e_adder);
    single_control_alu_decoder single_control_alu_decoder(.funct3, .funct7, .opcode, .alu_op, .alu_control);
    
endmodule