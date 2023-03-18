module reg_instr(rd_data, clk, instruction, ir_write, pc, old_pc);
    input logic [31:0]rd_data;
    input logic ir_write;  //FROM CONTROL UNIT
    input logic clk;
    input logic [31:0]pc;
    output logic [31:0]instruction;
    output logic [31:0]old_pc;
       
    always_ff @(posedge clk) begin  
        if (ir_write) begin
            instruction <= rd_data;
            old_pc <= pc;
        end
    end
endmodule
