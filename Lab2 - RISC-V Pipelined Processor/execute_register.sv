module execute_register(clk, alu_result, wr_data_e, pc_plus4_e, alu_result_m, wr_data_m, pc_plus4_m, write_addr_e, write_addr_m, reg_write_e, result_src_e, mem_write_e, reg_write_m, result_src_m, mem_write_m);
    input logic clk;
    input logic [31:0] alu_result, wr_data_e, pc_plus4_e;
    output logic [31:0] alu_result_m, wr_data_m, pc_plus4_m;

    input logic [4:0] write_addr_e;
    output logic [4:0] write_addr_m;

    //From Control Unit
    input logic [1:0] result_src_e;
    input logic reg_write_e, mem_write_e;
    output logic [1:0] result_src_m;
    output logic reg_write_m, mem_write_m;

    always_ff @(posedge clk) begin
        alu_result_m <= alu_result;
        wr_data_m <= wr_data_e;
        pc_plus4_m <= pc_plus4_e;
        write_addr_m <= write_addr_e;

        //Control Unit
        reg_write_m <= reg_write_e;
        mem_write_m <= mem_write_e;
        result_src_m <= result_src_e;
    end

endmodule