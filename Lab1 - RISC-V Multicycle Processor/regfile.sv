module regfile(reset, clk, rs1_addr, rs2_addr, write_addr, write_data, rd_data1, rd_data2, wr_en, check);
    
    input logic reset, clk;
    input logic [4:0] rs1_addr, rs2_addr, write_addr;
    input logic wr_en; //WE3
    input logic [31:0]write_data; //WD3
    output logic [31:0]rd_data1, rd_data2;
    
    logic [31:0] regfile[0:31];
    
    //HW4: HARDWARE DEMO: String number inputted as ASCII and atoi converted
    //Integer value returned to a0 which is x10 in register file. We put in -245
    //so expect -245 to be stored in x10.
    output logic check;
    /*always_comb begin
        if (regfile[10] == -245) begin
            check = 1;
        end
        else begin
            check = 0;
        end
    end*/
    assign check = (regfile[10] == -245)? 1:0;
   
    //2 read ports, asynchronous
    assign rd_data1 = (rs1_addr == 0)? 0: regfile[rs1_addr];   // Included rs1_addr == 0 for case in controller where rs1 = 0. We dont want to access reg[0]
    assign rd_data2 = (rs2_addr == 0)? 0: regfile[rs2_addr];
     
    always_ff @(posedge clk) begin
        //single write port synchronous
        if (wr_en) begin
            regfile[write_addr] <= write_data;
        end
    end
    
endmodule
