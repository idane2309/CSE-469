module ALU(src_a, src_b, alu_control, alu_result, zero, less_than);
    
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
    
    input logic [31:0] src_a;
    input logic [31:0] src_b;    
    input logic [3:0]alu_control;
    output logic [31:0] alu_result;
    
    output logic zero;
    output logic less_than; // Less Than flag
    
    logic unsigned [31:0] unsigned_src_a, unsigned_src_b;
    
    always_comb begin
        unsigned_src_a = src_a;
        unsigned_src_b = src_b;
    end
    
    
    always_comb begin
        case(alu_control)
                ADD: alu_result = src_a + src_b;
                SUB: alu_result = src_a - src_b;
                SLL: alu_result = src_a << src_b;
                SLT: alu_result = {{31{1'b0}}, signed'(src_a) < signed'(src_b)};
                SRL: alu_result = src_a >> src_b;
                XOR_: alu_result = src_a^src_b;
                OR_: alu_result = src_a | src_b;
                AND_: alu_result = src_a & src_b;
                SRA: alu_result = src_a >>> src_b;
                SLTU: alu_result = {{31{1'b0}}, unsigned_src_a < unsigned_src_b};
                default: alu_result = src_a + src_b;
        endcase
    end
    
    assign zero = (alu_result == 32'b0)? 1: 0;    // Set zero flag to true (=1) if all 32 bits are 0, else set it to false(=0) 
    
   
    always_comb begin
        case(alu_control)
            SLTU: begin
                case(alu_result)
                    1: less_than = 1;
                    0: less_than = 0;
                endcase
            end
            SLT: begin 
                case(alu_result)
                    1: less_than = 1;
                    0: less_than = 0;
                endcase
            end
            default: less_than = 1'bx;
        endcase
    end
    
endmodule