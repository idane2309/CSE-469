module imm_extend(imm,imm_src, imm_ext);
    input logic [31:0]imm;
    input logic [2:0]imm_src; //FROM CONTROL UNIT to pick 12, 20 or 21 bit immediate
    output logic [31:0] imm_ext;
  
    logic [31:0]temp;
    
    always_comb begin
        case(imm_src)
            3'b000: begin //12 bit for Load and Immediate Instructions
                imm_ext = {{20{imm[31]}}, imm[31:20]};
            end
            3'b001: begin //12 bit for Branch Instructions
                imm_ext = {{20{imm[31]}}, imm[7], imm[30:25], imm[11:8], 1'b0};
            end
            3'b010: begin //12 bit for Store Instructions
                imm_ext = {{20{imm[31]}}, imm[31:25],imm[11:7]};
            end
            3'b011: begin //5 bit for SHAMT I-type Instructions
                 imm_ext = {{27{imm[24]}}, imm[24:20]};
            end
            3'b100: begin //20 bit for LUI and AUIPC U-TYPE Instructions
                 imm_ext = {{12{imm[31]}}, imm[31:12]};
            end
            3'b101: begin //20 bit for JAL instruction
                imm_ext = {{12{imm[31]}},imm[19:12], imm[20], imm[30:21], 1'b0};
            end
            default: imm_ext = 32'bx;
        endcase
    end
    
endmodule
