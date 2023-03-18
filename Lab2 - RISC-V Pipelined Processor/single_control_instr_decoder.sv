module single_control_instr_decoder(opcode, funct3, mem_write, reg_write, branch, jump, alu_src_b, result_src, alu_op, branch_sel, imm_src, control_e_adder);
    input logic [6:0]opcode;
    input logic [2:0]funct3;
    output logic [2:0]imm_src;
    output logic mem_write, reg_write, branch, jump;
    output logic [2:0] alu_src_b;
    output logic [1:0] result_src;
    output logic [1:0]alu_op;
    output logic[2:0]branch_sel;
    output logic control_e_adder;  
    
    parameter LW = 7'b0000011;
    parameter SW = 7'b0100011;
    parameter R_type = 7'b0110011;
    parameter I_type = 7'b0010011;
    parameter JAL_ = 7'b1101111;
    parameter BEQ_ = 7'b1100011;
    parameter LUI_ = 7'b0110111;
    parameter AUIPC_ = 7'b0010111;
    parameter JALR_ = 7'b1100111;

    
    
    parameter BEQ = 3'b000;
    parameter BNE = 3'b001;
    parameter BLT = 3'b100;
    parameter BGE = 3'b101;
    parameter BLTU = 3'b110;
    parameter BGEU = 3'b111;

    always_comb begin
        case(opcode)
            R_type: begin //R-Type 
                mem_write = 0;
                reg_write = 1;
                branch = 0;
                jump = 0;
                alu_src_b = 3'b000;
                result_src = 2'b00;
                alu_op = 2'b10;
                imm_src = 3'bx;
                branch_sel = 3'bx;
                control_e_adder = 0;
            end
            LW: begin //12 bit load
                imm_src = 3'b000;
                mem_write = 0;
                reg_write = 1;
                branch = 0;
                jump = 0;
                alu_src_b = 3'b010;
                result_src = 2'b01;
                alu_op = 2'b00;
                branch_sel = 3'bx;
                control_e_adder = 0;
            end
            I_type: begin //12 bit immediate and SHAMT instructions (I-type)
                mem_write = 0;
                reg_write = 1;
                branch = 0;
                jump = 0;
                alu_src_b = 3'b010;
                result_src = 2'b00;
                alu_op = 2'b10;
                branch_sel = 3'bx;
                control_e_adder = 0;
                case(funct3)
                    3'b101: begin //SRLI and SRAI SHAMT instructions
                        imm_src = 3'b011;
                    end
                    3'b001: begin //SLLI SHAMT instruction
                        imm_src = 3'b011;
                    end
                    default: begin //Rest of the immediate nstructions 
                        imm_src = 3'b000;
                    end
                endcase
            end
            JALR_: begin //JALR instruction
                imm_src = 3'b000;
                mem_write = 0;
                reg_write = 1;
                branch = 0;
                jump = 1;
                alu_src_b = 3'bx;  //ADD IMMEDIATE TO RS1
                result_src = 2'b10;
                alu_op = 2'bx; //WE WANT TO ADD RS1+ IMM
                branch_sel = 3'bx;
                control_e_adder = 1;
            end
            JAL_: begin //JAL instruction
                imm_src = 3'b101;
                mem_write = 0;
                reg_write = 1;
                branch = 0;
                jump = 1;     // pc -> pc + imm
                alu_src_b = 3'bx;  // rd -> pc + 4
                result_src = 2'b10;
                alu_op = 2'bx;
                branch_sel = 3'bx;
                control_e_adder = 0;
            end
            BEQ_: begin //Branch Instructions
                imm_src = 3'b001;
                mem_write = 0;
                reg_write = 0;
                branch = 1;
                jump = 0;
                alu_src_b = 3'b000;
                result_src = 2'b00;
                alu_op = 2'b01;
                control_e_adder = 0;
                case(funct3)         
                    BEQ: begin
                        branch_sel = 3'b000;                        
                    end
                    BNE: begin
                        branch_sel = 3'b001;
                    end
                    BLT: begin
                        branch_sel = 3'b010;
                    end
                    BGE: begin
                        branch_sel = 3'b011;
                    end
                    BLTU: begin
                        branch_sel = 3'b100;
                    end
                    BGEU: begin
                        branch_sel = 3'b101;
                    end
                    default: begin
                        branch_sel = 3'bx;
                    end
                endcase
            end
            SW: begin //SW Instructions
                imm_src = 3'b010;
                mem_write = 1;
                reg_write = 0;
                branch = 0;
                jump = 0;
                alu_src_b = 3'b010;
                result_src = 2'bx; //Check
                alu_op = 2'b00;
                branch_sel = 3'bx;
                control_e_adder = 0;
            end
            LUI_: begin //LUI Instruction
                imm_src = 3'b100;
                mem_write = 0;
                reg_write = 1;
                branch = 0;
                jump = 0;
                alu_src_b = 3'b110;
                result_src = 2'b00;
                alu_op = 2'b10;
                branch_sel = 3'bx;
                control_e_adder = 0;
            end
            AUIPC_: begin //AUIPC Instruction
                imm_src = 3'b100;
                mem_write = 0;
                reg_write = 1;
                branch = 0;
                jump = 0;
                alu_src_b = 3'b110;
                result_src = 2'b00;
                alu_op = 2'b11;
                branch_sel = 3'bx;
                control_e_adder = 0;
            end
            default: begin
                imm_src = 3'bx;
                mem_write = 0;
                reg_write = 0;
                branch = 0;
                jump = 0;
                alu_src_b = 3'bx;
                result_src = 2'bx;
                alu_op = 2'bx;
                branch_sel = 3'bx;
                control_e_adder = 0;
            end
        endcase
    end
endmodule