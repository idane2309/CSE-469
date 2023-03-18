module pc_mux(pc_plus4_f, pc_target_e, control_mux, pc_f);
    input logic [31:0] pc_plus4_f, pc_target_e;
    input logic control_mux;
    output logic [31:0] pc_f;

    always_comb begin
        case(control_mux)
            0: pc_f = pc_plus4_f;
            1: pc_f = pc_target_e;
        endcase
    end
endmodule