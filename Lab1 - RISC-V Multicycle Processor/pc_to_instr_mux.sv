module pc_to_instr_mux(pc, addr_src, alu_out, addr_out);
    input logic [31:0]pc;
    input logic [31:0]alu_out;
    input logic addr_src;   //FROM CONTROL UNIT selects whether PC goes to instr mem or alu_out
    output logic [31:0]addr_out;
    
    always_comb begin
        case(addr_src)
            0: addr_out = pc;
            1: addr_out = alu_out;
        endcase
    end
endmodule
