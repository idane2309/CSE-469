module data_mem(clk, addr, wr_en, wr_data, rd_data);
    input logic [31:0] addr;   // A
    input logic clk, wr_en;     // WE, CLK
    input logic [31:0] wr_data; // WD
    
    output logic [31:0] rd_data; // RD
    
    logic [31:0] mem[1023:0]; 
    
    assign rd_data = mem[addr/4];             // asynchronous read
   
    //synchronous write
    always_ff @(posedge clk) begin
        if (wr_en) begin
            mem[addr/4] <= wr_data;
        end
    end

endmodule
