`timescale 1ns/1ps

module top(clk, reset, done);

    input logic clk, reset;
    output logic done;
    
    // Fetch //
    //pc_mux
    logic [31:0] pc_f;    //Output 
    //pc_reg
    logic [31:0] pc_out_f; //Output
    //instr_mem
    logic [31:0] instruction; //Output
    //pc_plus4_adder
    logic [31:0] pc_plus4_f; //Output
    //fetch_register
    logic [31:0] pc_d; //Output
    logic [31:0] instr_d; //Output
    logic [31:0] pc_plus4_d; //Output

    // Decode //
    //regfile
    logic [31:0] rd_data1; //Output
    logic [31:0] rd_data2; //Output  
    //imm_extend
    logic [31:0] imm_ext; //Output
    //control_unit (CHECK WHICH SIGNALS ACTUALLY USE)
    logic mem_write; //Output 
    logic [1:0]result_src; //Output
    logic [3:0]alu_control; //Output
    logic [2:0]alu_src_b; //Output
    logic [2:0]imm_src; //Output
    logic reg_write; //Output
    logic branch, jump; //Output
    logic [2:0] branch_sel; //Output
    logic control_e_adder; //Output
    //decode_register
    logic [31:0] pc_e; //Output
    logic [31:0] imm_ext_e; //Output
    logic [31:0] pc_plus4_e; //Output
    logic [31:0] rd_data1_e; //Output
    logic [31:0] rd_data2_e; //Output
    logic [4:0] write_addr_e; //Output
    logic reg_write_e, mem_write_e, branch_e, jump_e; //Output CONTROL SIGNAL
    logic [2:0] branch_sel_e; //Output CONTROL SIGNAL
    logic [1:0]result_src_e; //Output CONTROL SIGNAL
    logic [3:0]alu_control_e; //Output CONTROL SIGNAL
    logic [2:0]alu_src_b_e; //Output CONTROL SIGNAL
    logic control_e_adder_e; //Output CONTROL SIGNAL
    logic [4:0] rs1_addr_e, rs2_addr_e; //Output
    
    

    // Execute // 
    //execute_branch_decoder
    logic pc_src_e; //Output
    //forward_srcA_mux
    logic [31:0] forward_srcA_out; //Output
    //forward_srcB_mux
    logic [31:0] forward_srcB_out; //Output
    //alusrcB_mux
    logic [31:0] src_b_out; //Output
    //execute_adder_mux
    logic [31:0] src_to_adder; //Output
    //pc_target_adder
    logic [31:0] pc_target; //Output
    //ALU
    logic [31:0] alu_result; //Output
    logic zero, less_than; //Output Flags
    //execute_register
    logic [31:0] alu_result_m; //Output 
    logic [31:0] wr_data_m; //Output
    logic [31:0] pc_plus4_m; //Output
    logic [4:0] write_addr_m; //Output
    logic [1:0] result_src_m; //Output CONTROL SIGNAL
    logic reg_write_m, mem_write_m; //Output CONTROL SIGNAL

    // Memory //
    //data_mem
    logic [31:0] rd_data; //Output
    //memory_register
    logic [31:0] rd_data_w; //Output
    logic [31:0] pc_plus4_w; //Output
    logic [4:0] write_addr_w; //Output
    logic reg_write_w; //Output CONTROL SIGNAL
    logic [1:0] result_src_w; //Output CONTROL SIGNAL
    logic [31:0] alu_result_w; //Output

    // Writeback //
    //writeback_mux
    logic [31:0] wb_result_w; //Output

    // Hazard Unit //
    logic [1:0] forward_srcA_e, forward_srcB_e; //Output
    logic stall_f, stall_d, flush_e, flush_d; //Output

    //Fetch
    pc_mux pc_mux(.pc_plus4_f, .pc_target_e(pc_target), .control_mux(pc_src_e), .pc_f);
    pc_reg pc_reg(.clk, .reset, .pc_f, .pc_out_f, .stall_f);
    instr_mem instr_mem(.addr(pc_out_f), .instruction);
    pc_plus4_adder pc_plus4_adder(.pc_out_f, .pc_plus4_f);
    fetch_register fetch_register(.clk, .instruction, .pc_out_f, .pc_plus4_f, .pc_d, .instr_d, .pc_plus4_d, .stall_d, .flush_d);

    //Decode
    regfile regfile(.clk(~clk), .rs1_addr(instr_d[19:15]), .rs2_addr(instr_d[24:20]), .write_addr(write_addr_w), .write_data(wb_result_w), .rd_data1, .rd_data2, .wr_en(reg_write_w), .check(done));
    imm_extend imm_extend(.imm(instr_d), .imm_src, .imm_ext);
    decode_register decode_register(.clk, .pc_d, .pc_plus4_d, .imm_ext, .rd_data1, .rd_data2, .pc_e, .imm_ext_e, .pc_plus4_e, .rd_data1_e, .rd_data2_e, .write_addr_d(instr_d[11:7]), .write_addr_e, .reg_write, .result_src, .mem_write, .branch, .jump, .alu_control, .alu_src_b, .rs1_addr_d(instr_d[19:15]), .rs2_addr_d(instr_d[24:20]), .reg_write_e, .result_src_e, .mem_write_e, .branch_e, .jump_e, .alu_control_e, .alu_src_b_e, .rs1_addr_e, .rs2_addr_e, .flush_e, .branch_sel, .branch_sel_e, .control_e_adder, .control_e_adder_e);
    single_control_unit single_control_unit(.opcode(instr_d[6:0]), .funct3(instr_d[14:12]), .funct7(instr_d[31:25]), .result_src, .mem_write, .alu_src_b, .imm_src, .reg_write, .alu_control, .branch, .jump, .branch_sel, .control_e_adder);
    
    //Execute
    execute_branch_decoder execute_branch_decoder(.zero, .branch(branch_e), .jump(jump_e), .branch_sel(branch_sel_e), .less_than, .pc_src_e);
    forward_srcA_mux forward_srcA_mux(.rd_data1_e, .wb_result_w, .alu_result_m, .forward_srcA_e, .forward_srcA_out);
    forward_srcB_mux forward_srcB_mux(.rd_data2_e, .wb_result_w, .alu_result_m, .forward_srcB_e, .forward_srcB_out);
    alusrcB_mux alusrcB_mux(.alu_src_b(alu_src_b_e), .imm_ext_e, .rd_data2_e(forward_srcB_out), .src_b_out);
    execute_adder_mux execute_adder_mux(.pc_e, .rd_data1_e(forward_srcA_out), .control_e_adder(control_e_adder_e), .src_to_adder);
    pc_target_adder pc_target_adder(.pc_e(src_to_adder), .imm_ext_e, .pc_target);
    ALU ALU(.src_a(forward_srcA_out), .src_b(src_b_out), .alu_control(alu_control_e), .alu_result, .zero, .less_than);
    execute_register execute_register(.clk, .alu_result, .wr_data_e(forward_srcB_out), .pc_plus4_e, .alu_result_m, .wr_data_m, .pc_plus4_m, .write_addr_e, .write_addr_m, .reg_write_e, .result_src_e, .mem_write_e, .reg_write_m, .result_src_m, .mem_write_m);

    //Memory
    data_mem data_mem(.clk, .addr(alu_result_m), .wr_en(mem_write_m), .wr_data(wr_data_m), .rd_data);
    memory_register memory_register(.clk, .rd_data, .pc_plus4_m, .rd_data_w, .pc_plus4_w, .write_addr_m, .write_addr_w, .reg_write_m, .result_src_m, .reg_write_w, .result_src_w, .alu_result_m, .alu_result_w); 

    //Writeback
    writeback_mux writeback_mux(.control_wb_mux(result_src_w), .alu_result_w, .rd_data_w, .pc_plus4_w, .wb_result_w);

    // Hazard Unit //
    hazard_unit hazard_unit(.rs1_addr_e, .rs2_addr_e, .write_addr_m, .write_addr_w, .reg_write_m, .reg_write_w, .forward_srcA_e, .forward_srcB_e, .result_src_e, .rs1_addr_d(instr_d[19:15]), .rs2_addr_d(instr_d[24:20]), .write_addr_e , .stall_f, .stall_d, .flush_e, .flush_d, .pc_src_e);

endmodule


/*module top_testbench();
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
endmodule*/