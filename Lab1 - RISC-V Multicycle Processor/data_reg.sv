module data_reg(rd_data, clk, data);
    input logic [31:0]rd_data;
    input logic clk;
    output logic [31:0]data;
    
    always_ff @(posedge clk) begin
        data <= rd_data;
    end
endmodule
