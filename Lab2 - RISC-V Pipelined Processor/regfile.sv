module regfile(clk, rs1_addr, rs2_addr, write_addr, write_data, rd_data1, rd_data2, wr_en, check);
    
    input logic clk;
    input logic [4:0] rs1_addr, rs2_addr, write_addr;
    input logic wr_en; //WE3
    input logic [31:0]write_data; //WD3
    output logic [31:0]rd_data1, rd_data2;
    
    output logic check; //For demo
    
    logic [31:0] registers[0:31];
    
    assign check = (registers[10] == -245)? 1:0;
    
    //2 read ports, asynchronous
    assign rd_data1 = (rs1_addr == 0)? 0: registers[rs1_addr];   // Included rs1_addr == 0 for case in controller where rs1 = 0. We dont want to access reg[0]
    assign rd_data2 = (rs2_addr == 0)? 0: registers[rs2_addr];
     
    
     
    always_ff @(posedge clk) begin
        //single write port synchronous
        if (wr_en) begin
            registers[write_addr] <= write_data;
        end
    end
    
endmodule
