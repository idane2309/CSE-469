module forward_srcA_mux(rd_data1_e, wb_result_w, alu_result_m, forward_srcA_e, forward_srcA_out);
    input logic [31:0] rd_data1_e, wb_result_w, alu_result_m;
    input logic [1:0] forward_srcA_e;
    output logic [31:0] forward_srcA_out;

    always_comb begin
        case(forward_srcA_e)
            2'b00: forward_srcA_out = rd_data1_e;
            2'b01: forward_srcA_out = wb_result_w;
            2'b10: forward_srcA_out = alu_result_m;
            default: forward_srcA_out = rd_data1_e;
        endcase
    end

endmodule