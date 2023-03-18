
//Program Counter Module
module pc(clk,reset, pc_next, pc, pc_write);
    input clk;
    input reset;
    input logic pc_write;
    input logic [31:0] pc_next;     // Next location for program counter
    output logic [31:0] pc;  
    
    logic temp;
    always_ff @(posedge clk) begin
        if (reset) begin
            pc <= 32'b0;
        end
        else begin
            if (pc_write) begin
                pc <= pc_next;
            end
        end
    end             
endmodule
