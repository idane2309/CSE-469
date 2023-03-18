`timescale 1ns/1ps

module top(clk, reset, done);

    input logic clk, reset;
    output logic done;
    
    // Program Counter
    logic [31:0]pc_out;   //Output
    logic pc_write; //Input from Control unit
    
    // Program counter to Instruction Memory MUX
    logic [31:0]addr_out;  //Output
    logic addr_src;  //Input
    
    // Instruction/ Data Memory
    logic mem_write;    //Input from control unit
    logic [31:0]rd_data; //Output
    logic [31:0]wr_data;  //Input
    
    // Instruction/Data memory to data register
    logic [31:0]data_out; //Output    //ALSO USED FOR WORDSIZES
    
    // Instruction/Data memory to Register File reg 
    logic ir_write; //Input from Control Unit
    logic [31:0]instruction; //Output
    logic [31:0]old_pc;
    
    // Register File
    logic [31:0]rd_data1; //Output
    logic [31:0]rd_data2; //Output
    logic reg_write; //Input from Control Unit
    logic check; //ADDED
    
    // Immediate Extend Unit
    logic [2:0]imm_src; //Input from control unit
    logic [31:0]imm_ext; //Output
    
    //REG between Register file to ALU
    logic [31:0]A;
    logic [31:0]B;
    
    //PreSrcA 2'b01 MUX for JALR (OldPC or rd_data1 choice)
    logic oldpc_control; //Input from Control Unit
    logic [31:0]srcA_data; // Output to 2'b01 SrcA_Mux
    
    //SrcA MUX
    logic [1:0]alu_src_a; //Input from Control Unit
    logic [31:0]src_a_out; //Output
    
    //SrcB MUX
    logic [2:0]alu_src_b; //Input from Control Unit 
    logic [31:0]src_b_out; //Ouput 
    
    // ALU
    logic [31:0]alu_result;
    logic zero;     //Output flag
    logic negative; //Output flag
    logic less_than; //Output flag
    logic overflow; //Output flag
    logic [3:0]alu_control; //Input from Control Unit
    
    // ALU to ALUout Reg
    logic [31:0]alu_out;  //Output
    
    // ALU Out MUX
    logic [1:0]result_src; //Input from Control Unit.
    logic [31:0]alu_mux_out; //Output 
    
    // WordSize Decoder
    logic load_or_store; //Input from Control Unit 
    logic [31:0]loadsize_out; //Output 
    logic [31:0]storesize_out;
    
    // Program Counter
    //logic pc_out;   //Output
    //logic pc_write; //Input from Control unit
    pc pc(.clk, .reset, .pc_next(alu_mux_out), .pc(pc_out), .pc_write);
    
    // Program counter to Instruction Memory MUX
    //logic addr_out;  //Output
    //logic addr_src;  //Input
    pc_to_instr_mux pc_to_instr_mux(.pc(pc_out), .addr_src, .alu_out, .addr_out);
    
    // Instruction Memory
    //logic mem_write;    //Input from control unit
    //logic rd_data; //Output
    //logic wr_data;  //Input
    instr_data_mem instr_data_mem(.clk, .addr(addr_out),.wr_en(mem_write), .wr_data(storesize_out), .rd_data); 
    
    // Instruction/Data memory to data register
    //logic data_out; //Output
    data_reg data_reg(.rd_data, .clk, .data(data_out));
    
    // Data register to WordSize Decoder for load sizes
    wordsize_decoder wordsize_decoder(.load_or_store, .funct3(instruction[14:12]), .din(data_out), .dout(loadsize_out));
    
    
    // Instruction/Data memory to Register File reg
    //logic ir_write; //Input from Control Unit
    //logic [31:0] instruction; //Output
    //logic [31:0] old_pc;
    reg_instr reg_instr(.rd_data, .clk, .instruction, .ir_write, .pc(pc_out), .old_pc);
    
    // Register File
    //logic rd_data1; //Output
    //logic rd_data2; //Output
    //logic reg_write; //Input from Control Unit
    regfile regfile(.reset, .clk, .rs1_addr(instruction[19:15]), .rs2_addr(instruction[24:20]), .write_addr(instruction[11:7]), .write_data(alu_mux_out), .rd_data1, .rd_data2, .wr_en(reg_write), .check);
    
    // Immediate Extend Unit
    //logic imm_src; //Input from control unit
    //logic imm_ext; //Output
    imm_extend imm_extend(.imm(instruction),.imm_src, .imm_ext);
    
    //REG between Register file to ALU
    //logic A;
    //logic B;   
    reg_to_alu reg_to_alu(.clk, .rd_data1, .rd_data2, .A,.B);
    
    //REG to Wordsize decoder to Instr/Data Mem for stores
    wordsize_store_decoder wordsize_store_decoder(.load_or_store, .funct3(instruction[14:12]), .din(B), .dout(storesize_out));
    
    //MUX Before SrcA MUX for 2'b01 to decide OldPC or rd_data1 from REGFILE. (JALR INSTRUCTION)
    oldpc_mux oldpc_mux(.old_pc(old_pc), .rd_data1(rd_data1), .oldpc_control(oldpc_control), .srcA_data(srcA_data));
    
    //SrcA MUX
    //logic alu_src_a; //Input from Control Unit
    //logic src_a_out; //Output
    //logic imm_ext; //Input added
    //ADDED MUX BEFORE FOR '01' WITH OLDPC_MUX -> OUTPUT SRCA_DATA
    alusrcA_mux alusrcA_mux(.alu_src_a, .A, .pc(pc_out), .old_pc(srcA_data), .src_a_out, .imm_ext);
    
    //SrcB MUX
    //logic alu_src_b; //Input from Control Unit
    //logic src_b_out; //Ouput 
    //logic alu_output; //Input from ALU ADDED FOR AUIPC 
    alusrcB_mux alusrcB_mux(.alu_src_b, .imm_ext, .B, .alu_output(alu_mux_out), .src_b_out );
    
    // ALU
    //logic alu_result;
    //logic zero;     //Output flag
    //logic negative; //Output flag
    //logic overflow; //Output flag
    //logic less_than; //Output flag
    //logic alu_control; //Input from Control Unit
    ALU ALU(.clk, .src_a(src_a_out), .src_b(src_b_out), .alu_control, .alu_result, .zero, .overflow, .negative, .less_than);
    
    // ALU to ALUout Reg
    //logic alu_out;  //Output
    aluout_reg aluout_reg(.alu_result, .clk, .alu_out);
    
    // ALU Out MUX
    //logic result_src; //Input from Control Unit.
    //logic [31:0]alu_mux_out; //Output 
    aluout_mux aluout_mux(.result_src, .data_reg_out(loadsize_out), .alu_result, .alu_out, .alu_mux_out);
    
    //Control unit
    control_unit control_unit(.clk, .reset, .opcode(instruction[6:0]), .funct3(instruction[14:12]), .funct7(instruction[31:25]), .zero, .negative, .pc_write, .addr_src, .mem_write, .ir_write, .result_src, .alu_control, .alu_src_a, .alu_src_b, .imm_src, .reg_write, .load_or_store, .less_than, .oldpc_control);
      
    assign done = (instruction[6:0] == 7'b1100111)? 1:0; //ADDED
    //assign done = check; // ADDED
endmodule


module top_testbench();
    logic clk;
    logic reset;
    logic done;

    //Instantiate
    top dut(clk, reset, done);

    //Generate Clock
    parameter CLOCK_PERIOD=100;
    initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; @(posedge clk);
        reset <= 0; @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
                    @(posedge clk);
       repeat(1000) @(posedge clk);
        
       $stop;
    end 
endmodule