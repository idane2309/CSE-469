module fetch_register(clk, instruction, pc_out_f, pc_plus4_f, pc_d, instr_d, pc_plus4_d, stall_d, flush_d);
    input logic clk;
    input logic [31:0] instruction, pc_out_f, pc_plus4_f;
    output logic [31:0] pc_d, instr_d, pc_plus4_d;

    //From Hazard Unit
    input logic stall_d;
    input logic flush_d;

    always_ff @(posedge clk) begin
        if (stall_d == 0) begin
            instr_d <= instruction;
            pc_d <= pc_out_f;
            pc_plus4_d <= pc_plus4_f;
        end
        if (flush_d) begin
            instr_d <= 0;
            pc_d <= 0;
            pc_plus4_d <= 0;
        end
    end

endmodule