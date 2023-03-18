module pc_target_adder(pc_e, imm_ext_e, pc_target);
    input logic [31:0] pc_e;
    input logic [31:0] imm_ext_e;
    output logic [31:0] pc_target;

    assign pc_target = pc_e + imm_ext_e;
    
endmodule