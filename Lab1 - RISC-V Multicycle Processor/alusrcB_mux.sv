module alusrcB_mux(alu_src_b, imm_ext, B, alu_output, src_b_out);
    input logic [2:0] alu_src_b; 
    input logic [31:0] imm_ext;
    input logic [31:0] B;
    input logic [31:0] alu_output; 
    output logic [31:0] src_b_out;
    
    always_comb begin
        case(alu_src_b)
            3'b000: src_b_out = B;
            3'b010: src_b_out = imm_ext;
            3'b100: src_b_out = 4;
            3'b110: src_b_out = 12;
            3'b111: src_b_out = alu_output; 
        endcase
    end
endmodule
