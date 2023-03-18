module instr_data_mem(clk, addr, wr_en, wr_data, rd_data);
    input logic [31:0] addr;    // 32 bit address
    input logic clk, wr_en;
    input logic [31:0] wr_data;
    
    output logic [31:0] rd_data;
    
    logic [31:0] mem[1023:0]; 
    
    initial begin
        $readmemh ("test.mem", mem);  // Loads file into mem
    end
    
    assign rd_data = mem[addr/4];             // asynchronous read
   
    //synchronous write
    always_ff @(posedge clk) begin
        if (wr_en) begin
            mem[addr/4] <= wr_data;
        end
    end

endmodule
