module control_instr_decoder(opcode, funct3, imm_src, branch_sel, load_or_store);
    input logic [6:0]opcode;
    input logic [2:0]funct3;
    output logic [2:0]imm_src;
    
    output logic[2:0]branch_sel;  
    output logic load_or_store;
    
    
    
    parameter BEQ = 3'b000;
    parameter BNE = 3'b001;
    parameter BLT = 3'b100;
    parameter BGE = 3'b101;
    parameter BLTU = 3'b110;
    parameter BGEU = 3'b111;

    always_comb begin
        case(opcode)
            7'b0000011: begin //12 bit load
                imm_src = 3'b000;
                load_or_store = 1;
            end
            7'b0010011: begin //12 bit immediate and SHAMT instructions (I-type)
                case(funct3)
                    3'b101: begin //SRLI and SRAI SHAMT instructions
                        imm_src = 3'b011;
                        load_or_store = 0;
                    end
                    3'b001: begin //SLLI SHAMT instruction
                        imm_src = 3'b011;
                        load_or_store = 0;
                    end
                    default: begin //Rest of the immediate nstructions 
                        imm_src = 3'b000;
                        load_or_store = 0;
                    end
                endcase
            end
            7'b1100111: begin //JALR instruction
                imm_src = 3'b000;
                load_or_store = 0;
            end
            7'b1101111: begin //JAL instruction
                imm_src = 3'b101;
                load_or_store = 0;
            end
            7'b1100011: begin //Branch Instructions
                load_or_store = 0;
                case(funct3)         
                    BEQ: begin
                        branch_sel = 3'b000;
                        imm_src = 3'b001;
                    end
                    BNE: begin
                        branch_sel = 3'b001;
                        imm_src = 3'b001;
                    end
                    BLT: begin
                        branch_sel = 3'b010;
                        imm_src = 3'b001;
                    end
                    BGE: begin
                        branch_sel = 3'b011;
                        imm_src = 3'b001;
                    end
                    BLTU: begin
                        branch_sel = 3'b100;
                        imm_src = 3'b001;
                    end
                    BGEU: begin
                        branch_sel = 3'b101;
                        imm_src = 3'b001;
                    end
                    default: begin
                        branch_sel = 3'bx;
                        imm_src = 3'b001;
                    end
                endcase
            end
            7'b0100011: begin //SW Instructions
                imm_src = 3'b010;
                load_or_store = 1;
            end
            7'b0110111: begin //LUI Instruction
                imm_src = 3'b100;
                load_or_store = 0;
            end
            7'b0010111: begin //AUIPC Instruction
                imm_src = 3'b100;
                load_or_store = 0;
            end
        endcase
    end
endmodule