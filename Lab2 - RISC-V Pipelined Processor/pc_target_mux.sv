module pc_target_mux(pc, imm_ext, pc_target);
    input logic [31:0] pc;
    input logic [31:0] imm_ext;
    output logic [31:0] pc_target;

    assign pc_target = pc + imm_ext;
    
endmodule