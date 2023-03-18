module memory_register(clk, rd_data, pc_plus4_m, rd_data_w, pc_plus4_w, write_addr_m, write_addr_w, reg_write_m, result_src_m, reg_write_w, result_src_w, alu_result_m, alu_result_w);
    input logic clk;
    input logic [31:0] rd_data, pc_plus4_m;
    output logic [31:0] rd_data_w, pc_plus4_w;

    input logic [4:0] write_addr_m;
    output logic [4:0] write_addr_w;

    input logic [31:0] alu_result_m;
    output logic [31:0] alu_result_w;

    //From Control Unit
    input logic reg_write_m;
    input logic [1:0] result_src_m;
    output logic reg_write_w;
    output logic [1:0] result_src_w;

    always_ff @(posedge clk) begin
        rd_data_w <= rd_data;
        pc_plus4_w <= pc_plus4_m;
        write_addr_w <= write_addr_m;
        alu_result_w <= alu_result_m;
        //Control Unit
        result_src_w <= result_src_m;
        reg_write_w <= reg_write_m;
    end

endmodule