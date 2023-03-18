module aluout_mux(result_src, data_reg_out, alu_result, alu_out, alu_mux_out);
    input logic [1:0] result_src;
    input logic [31:0] alu_out;
    input logic [31:0] alu_result;
    input logic [31:0]data_reg_out;
    output logic [31:0]alu_mux_out;
    
    always_comb begin
        case(result_src)
            2'b00: alu_mux_out = alu_out;
            2'b01: alu_mux_out = data_reg_out;
            2'b10: alu_mux_out = alu_result; 
        endcase
    end
endmodule
