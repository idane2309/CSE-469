module control_alu_decoder(funct3, funct7, opcode, alu_op, alu_control);
    
    parameter ADD = 4'b0000;
    parameter SUB = 4'b0010;
    parameter SLL = 4'b0100;
    parameter SLT = 4'b0110;
    parameter SRL = 4'b1000;
    parameter XOR_= 4'b1010;
    parameter OR_ = 4'b1100;
    parameter AND_= 4'b1110;
    parameter SRA = 4'b1111;
    parameter SLTU = 4'b1011;
    
    parameter BEQ = 3'b000;
    parameter BNE = 3'b001;
    parameter BLT = 3'b100;
    parameter BGE = 3'b101;
    parameter BLTU = 3'b110;
    parameter BGEU = 3'b111;

    input logic [2:0]funct3;
    input logic [6:0]funct7;
    input logic [1:0]alu_op;
    input logic [6:0]opcode;
    output logic [3:0]alu_control;
    

    always_comb begin
        case(alu_op)
            2'b00: begin    //Load and Stores
                alu_control = ADD; //ADD
            end
            2'b01: begin    //B-TYPE Branches
                case(funct3)
                    BEQ: alu_control = SUB;
                    BNE: alu_control = SUB;
                    BLT: alu_control = SLT;
                    BGE: alu_control = SLT;
                    BLTU: alu_control = SLTU;
                    BGEU: alu_control = SLTU;
                endcase
            end
            2'b10: begin    //R-TYPE Arithmetics
                case(funct3)
                    3'b000: begin
                        case(opcode[5])
                            0: begin 
                                case(funct7[5])
                                    0: alu_control = ADD; //ADD
                                    1: alu_control = ADD; //ADD
                                endcase
                            end
                            1: begin
                                case(funct7[5])
                                   0: alu_control = ADD; //ADD 
                                   1: alu_control = SUB; //SUB
                                endcase
                            end
                        endcase
                    end
                    3'b001: alu_control = SLL; //SLL
                    3'b010: alu_control = SLT; //SLT
                    3'b011: alu_control = SLTU; //SLTU
                    3'b100: alu_control = XOR_; //XOR
                    3'b101: begin
                        case(funct7[5])
                            0: alu_control = SRL; //SRL
                            1: alu_control = SRA; //SRA 
                        endcase
                    end
                    3'b110: alu_control = OR_; //OR
                    3'b111: alu_control = AND_; //AND
                endcase
            end
            2'b11: begin //LUI
                alu_control = SLL; //SLL 
            end
        endcase
    end
endmodule