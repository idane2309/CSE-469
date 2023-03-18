module pc_plus4_adder(pc_out_f, pc_plus4_f);
    input logic [31:0] pc_out_f;
    output logic [31:0] pc_plus4_f;

    assign pc_plus4_f = pc_out_f + 4;
    
endmodule