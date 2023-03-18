module writeback_mux(control_wb_mux, alu_result_w, rd_data_w, pc_plus4_w, wb_result_w);
    input logic [31:0] alu_result_w, rd_data_w, pc_plus4_w;
    input logic [1:0] control_wb_mux;
    output logic [31:0] wb_result_w;

    always_comb begin
        case(control_wb_mux)
            2'b00: wb_result_w = alu_result_w;
            2'b01: wb_result_w = rd_data_w;
            2'b10: wb_result_w = pc_plus4_w;
            default: wb_result_w = alu_result_w;
        endcase
    end
endmodule