module alusrcA_mux(alu_src_a, A, pc, old_pc, src_a_out, imm_ext);
    input logic [1:0] alu_src_a;
    input logic [31:0] A;
    input logic [31:0] pc;
    input logic [31:0] old_pc;
    input logic [31:0] imm_ext;
    output logic [31:0] src_a_out;

    
    always_comb begin
        case(alu_src_a)
            2'b00: src_a_out = pc;
            2'b01: src_a_out = old_pc;
            2'b10: src_a_out = A;
            2'b11: src_a_out = imm_ext;
        endcase
    end
endmodule
