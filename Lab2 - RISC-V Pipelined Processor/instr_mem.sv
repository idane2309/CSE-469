module instr_mem(addr, instruction);
    input logic [31:0] addr;    // A input
    output logic [31:0] instruction; //RD OUT
    
    logic [31:0] mem[255:0]; 
    
    initial begin
        $readmemh ("hw4.mem", mem);  // Loads file into mem
    end
    
    assign instruction = mem[addr/4];             // asynchronous read

endmodule
