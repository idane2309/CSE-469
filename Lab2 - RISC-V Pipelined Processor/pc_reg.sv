module pc_reg(clk, reset, pc_f, pc_out_f, stall_f);
    input logic clk, reset;
    input logic [31:0] pc_f;
    output logic [31:0] pc_out_f;

    input logic stall_f;

    always_ff @(posedge clk) begin
        if (reset) begin
            pc_out_f <= 32'b0;
        end
        else if (stall_f == 0) begin
            pc_out_f <= pc_f;
        end
    end
endmodule
