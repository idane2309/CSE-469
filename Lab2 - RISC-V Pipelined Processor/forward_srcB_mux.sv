module forward_srcB_mux(rd_data2_e, wb_result_w, alu_result_m,forward_srcB_e, forward_srcB_out);
    input logic [31:0] rd_data2_e, wb_result_w, alu_result_m;
    input logic [1:0] forward_srcB_e;
    output logic [31:0] forward_srcB_out;

    always_comb begin
        case(forward_srcB_e)
            2'b00: forward_srcB_out = rd_data2_e;
            2'b01: forward_srcB_out = wb_result_w;
            2'b10: forward_srcB_out = alu_result_m;
            default: forward_srcB_out = rd_data2_e;
        endcase
    end

endmodule