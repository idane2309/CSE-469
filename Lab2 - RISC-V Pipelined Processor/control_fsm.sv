module control_fsm(clk,reset, opcode, branch, pc_update, reg_write, mem_write, ir_write, result_src, alu_src_a, alu_src_b, addr_src, alu_op, oldpc_control);
    
    parameter LW = 7'b0000011;
    parameter SW = 7'b0100011;
    parameter R_type = 7'b0110011;
    parameter I_type = 7'b0010011;
    parameter JAL_ = 7'b1101111;
    parameter BEQ_ = 7'b1100011;
    parameter LUI_ = 7'b0110111;
    parameter AUIPC_ = 7'b0010111;
    parameter JALR_ = 7'b1100111;
    
    input logic clk, reset;
    input logic [6:0]opcode;
    output logic branch;
    output logic pc_update;
    output logic mem_write;
    output logic reg_write;
    output logic ir_write;
    output logic [1:0]result_src;
    output logic [2:0]alu_src_b; 
    output logic [1:0]alu_src_a;
    output logic addr_src;
    output logic [1:0] alu_op;
    output logic oldpc_control; //ADDED

    enum {Fetch, Decode, MemAdr, MemRead, MemWB, MemWrite, ExecuteR, ALUWB, ExecuteI, JAL, BEQ, LUI, AUIPC} currentState, nextState;
    
    always_ff @(posedge clk) begin
        if(reset) currentState <= Fetch;
        else      currentState <= nextState;
    end

    always_comb begin
        case(currentState)
            Fetch: nextState = Decode;
            Decode: begin
                case(opcode)
                    LW: nextState = MemAdr;
                    SW: nextState = MemAdr;
                    R_type: nextState = ExecuteR;
                    I_type: nextState = ExecuteI;
                    JAL_: nextState = JAL;
                    BEQ_: nextState = BEQ; 
                    LUI_: nextState = LUI; 
                    AUIPC_: nextState = LUI;
                    JALR_: nextState = JAL; 
                endcase
            end
            MemAdr: begin
                case(opcode)
                    LW: nextState = MemRead;
                    SW: nextState = MemWrite;
                endcase
            end
            MemRead: nextState = MemWB;
            MemWB: nextState = Fetch;
            MemWrite: nextState = Fetch;
            ExecuteR: nextState = ALUWB;
            ALUWB: nextState = Fetch;
            ExecuteI: nextState = ALUWB;
            JAL: nextState = ALUWB;
            BEQ: nextState = Fetch;   
            LUI: begin
                case(opcode)
                    LUI_: nextState = ALUWB; 
                    AUIPC_: nextState = AUIPC; 
                endcase
            end
            AUIPC: nextState = ALUWB; 
        endcase
    end

    always_comb begin         //Multiplexer signals are don't care X when not included.
        case(currentState)    //reg_write, mem_write, ir_write, pc_update, branch = 0 if not included
            Fetch: begin    //Fetch
                addr_src = 0;
                ir_write = 1;
                alu_src_a = 2'b00;
                alu_src_b = 3'b100;  
                alu_op = 2'b00;
                result_src = 2'b10;
                pc_update = 1;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                oldpc_control = 0;
            end
            Decode: begin   //Decode
                case(opcode)  //ADDED
                    JALR_: oldpc_control = 1;
                    default: oldpc_control = 0;
                endcase
                alu_src_a = 2'b01;
                alu_src_b = 3'b010;  
                alu_op = 2'b00;
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'bxx;
                addr_src = 1'bx;
            end
            MemAdr: begin //MemAdr
                oldpc_control = 0;
                alu_src_a = 2'b10;
                alu_src_b = 3'b010; 
                alu_op = 2'b00;
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'bxx;
                addr_src = 1'bx;
            end
            MemRead: begin //MemRead
                oldpc_control = 0;
                alu_src_a = 2'bxx;
                alu_src_b = 3'bxxx;
                alu_op = 2'bxx;
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'b00;
                addr_src = 1;
            end
            MemWB: begin //MemWriteBack
                oldpc_control = 0;
                alu_src_a = 2'bxx;
                alu_src_b = 3'bxxx;
                alu_op = 2'bxx;
                pc_update = 0;
                reg_write = 1;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'b01;
                addr_src = 1'bx;
            end
            MemWrite: begin //MemWrite
                oldpc_control = 0;
                alu_src_a = 2'bxx;
                alu_src_b = 3'bxxx;
                alu_op = 2'bxx;
                pc_update = 0;
                reg_write = 0;
                mem_write = 1;
                branch = 0;
                ir_write = 0;
                result_src = 2'b00;
                addr_src = 1;
            end
            ExecuteR: begin //ExecuteR
                oldpc_control = 0;
                alu_src_a = 2'b10;
                alu_src_b = 3'b000;
                alu_op = 2'b10;
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'bxx;
                addr_src = 0;
            end
            ALUWB: begin //ALU Write Back
                oldpc_control = 0;
                alu_src_a = 2'bxx;
                alu_src_b = 3'bxxx;
                alu_op = 2'bxx;
                pc_update = 0;
                reg_write = 1;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'b00;
                addr_src = 0;
            end
            ExecuteI: begin //ExecuteI
                oldpc_control = 0;
                alu_src_a = 2'b10;
                alu_src_b = 3'b010;
                alu_op = 2'b10;
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'bxx;
                addr_src = 0;
            end
            JAL: begin //JAL
                oldpc_control = 0;
                alu_src_a = 2'b01;
                alu_src_b = 3'b100;
                alu_op = 2'b00;
                pc_update = 1;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'b00;
                addr_src = 0;
            end
            BEQ: begin //BEQ
                oldpc_control = 0;
                alu_src_a = 2'b10;
                alu_src_b = 3'b000;
                alu_op = 2'b01;
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 1;
                ir_write = 0;
                result_src = 2'b00;
                addr_src = 0;
            end
            LUI: begin ///LUI
                oldpc_control = 0;
                alu_src_a = 2'b11;
                alu_src_b = 3'b110;
                alu_op = 2'b11;   //LUI
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'bxx;
                addr_src = 0;
            end
            AUIPC: begin //AUIPC
                oldpc_control = 0;
                alu_src_a = 2'b00;
                alu_src_b = 3'b111;
                alu_op = 2'b00;
                pc_update = 0;
                reg_write = 0;
                mem_write = 0;
                branch = 0;
                ir_write = 0;
                result_src = 2'b00;
                addr_src = 0;
            end
        endcase
    end
endmodule