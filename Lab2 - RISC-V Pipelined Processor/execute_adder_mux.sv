module execute_adder_mux(pc_e, rd_data1_e, control_e_adder, src_to_adder);
    input logic [31:0] pc_e, rd_data1_e;
    input logic control_e_adder;
    output logic [31:0] src_to_adder;
    
    always_comb begin
        case(control_e_adder)
            0: src_to_adder = pc_e;
            1: src_to_adder = rd_data1_e;
            default: src_to_adder = pc_e;
        endcase   
    end
endmodule
