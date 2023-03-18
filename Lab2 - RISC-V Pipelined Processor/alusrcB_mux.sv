module alusrcB_mux(alu_src_b, imm_ext_e, rd_data2_e, src_b_out);
    input logic [2:0] alu_src_b; 
    input logic [31:0] imm_ext_e;
    input logic [31:0] rd_data2_e;
    output logic [31:0] src_b_out;
    
    always_comb begin
        case(alu_src_b)
            3'b000: src_b_out = rd_data2_e;
            3'b010: src_b_out = imm_ext_e;
            3'b100: src_b_out = 4;
            3'b110: src_b_out = 12;
            default: src_b_out = rd_data2_e;
        endcase
    end
endmodule
