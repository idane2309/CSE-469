module reg_to_alu(clk, rd_data1, rd_data2,  A, B);
    input logic [31:0]rd_data1;
    input logic [31:0]rd_data2;
    input logic clk;
    output logic [31:0]A;
    output logic [31:0]B;
    
    always_ff @(posedge clk) begin
        A <= rd_data1;
        B <= rd_data2;
    end
    
endmodule
