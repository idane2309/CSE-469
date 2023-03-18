module oldpc_mux(old_pc, rd_data1, oldpc_control, srcA_data);
    input logic [31:0]old_pc;
    input logic [31:0]rd_data1;
    input logic oldpc_control;
    output logic [31:0]srcA_data;

    always_comb begin
        case(oldpc_control)
            0: srcA_data = old_pc;
            1: srcA_data = rd_data1;
        endcase
    end
endmodule