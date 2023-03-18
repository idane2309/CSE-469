module wordsize_store_decoder(load_or_store, funct3, din, dout);
    input logic load_or_store;
    input logic [2:0] funct3;
    input logic [31:0] din;
    output logic [31:0] dout;

    parameter word = 3'b010;
    parameter half_word = 3'b001;
    parameter byte_ = 3'b000;

    always_comb begin
        case(load_or_store)
            1: begin
                case(funct3)
                    word: dout = din;
                    half_word: dout = {{16{din[15]}}, din[15:0]};
                    byte_: dout = {{24{din[7]}}, din[7:0]};
                endcase
            end
            0: dout = din;
        endcase
    end

endmodule