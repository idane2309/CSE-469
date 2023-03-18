module aluout_reg(alu_result, clk, alu_out);
    input logic [31:0]alu_result;
    input logic clk;
    output logic [31:0]alu_out;
    
    always_ff @(posedge clk) begin
        alu_out <= alu_result;
    end
endmodule
