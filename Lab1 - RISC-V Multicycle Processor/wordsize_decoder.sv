module wordsize_decoder(load_or_store, funct3, din, dout);
    input logic load_or_store;
    input logic [2:0] funct3;
    input logic [31:0] din;
    output logic [31:0] dout;

    parameter LHU = 3'b101;
    parameter LBU = 3'b100;
    parameter LW = 3'b010;
    parameter LH = 3'b001;
    parameter LB = 3'b000;

    always_comb begin
        case(load_or_store)
            1: begin
                case(funct3)
                    LW: dout = din;
                    LH: dout = {{16{din[15]}}, din[15:0]};  //Sign extend for signed (normal)
                    LB: dout = {{24{din[7]}}, din[7:0]};
                    LHU: dout = {{16{1'b0}}, din[15:0]}; //Zero extend for unsigned
                    LBU: dout = {{24{1'b0}}, din[7:0]};
                endcase
            end
            0: dout = din;
        endcase
    end

endmodule