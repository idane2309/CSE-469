module decode_register(clk, pc_d, pc_plus4_d, imm_ext, rd_data1, rd_data2, pc_e, imm_ext_e, pc_plus4_e, rd_data1_e, rd_data2_e, write_addr_d, write_addr_e, reg_write, result_src, mem_write, branch, jump, alu_control, alu_src_b, rs1_addr_d, rs2_addr_d, reg_write_e, result_src_e, mem_write_e, branch_e, jump_e, alu_control_e, alu_src_b_e, rs1_addr_e, rs2_addr_e, flush_e, branch_sel, branch_sel_e, control_e_adder, control_e_adder_e);
    input logic clk;
    input logic [31:0] pc_d, pc_plus4_d, imm_ext, rd_data1, rd_data2;
    output logic [31:0] pc_e, pc_plus4_e, imm_ext_e, rd_data1_e, rd_data2_e;

    input logic [4:0] write_addr_d;
    output logic [4:0] write_addr_e;

    input logic [4:0] rs1_addr_d, rs2_addr_d;
    output logic [4:0] rs1_addr_e, rs2_addr_e;

    //From Control Unit
    input logic reg_write, mem_write, branch, jump;
    input logic [1:0]result_src;
    input logic [3:0]alu_control;
    input logic [2:0]alu_src_b;
    input logic [2:0] branch_sel;  
    input logic control_e_adder;

    output logic reg_write_e, mem_write_e, branch_e, jump_e;
    output logic [1:0]result_src_e;
    output logic [3:0]alu_control_e;
    output logic [2:0]alu_src_b_e;  
    output logic [2:0] branch_sel_e;
    output logic control_e_adder_e;

    //From Hazard Unit
    input logic flush_e;

    always_ff @(posedge clk) begin
        if (flush_e) begin
            pc_e <= 0;
            pc_plus4_e <= 0;
            imm_ext_e <= 0;
            rd_data1_e <= 0;
            rd_data2_e <= 0;
            write_addr_e <= 0;
            rs1_addr_e <= 0;
            rs2_addr_e <= 0;

            //From Control Unit
            reg_write_e <= 0;
            mem_write_e <= 0;
            branch_e <= 0;
            jump_e <= 0;
            control_e_adder_e <= 0;
            result_src_e <= 2'bx; //Or should be 0?
            alu_control_e <= 4'bx;
            alu_src_b_e <= 3'bx;
            branch_sel_e <= 3'bx;
        end
        else begin
            pc_e <= pc_d;
            pc_plus4_e <= pc_plus4_d;
            imm_ext_e <= imm_ext;
            rd_data1_e <= rd_data1;
            rd_data2_e <= rd_data2;
            write_addr_e <= write_addr_d;
            rs1_addr_e <= rs1_addr_d;
            rs2_addr_e <= rs2_addr_d;

            //From Control Unit
            reg_write_e <= reg_write;
            mem_write_e <= mem_write;
            branch_e <= branch;
            jump_e <= jump;
            result_src_e <= result_src;
            alu_control_e <= alu_control;
            alu_src_b_e <= alu_src_b;
            branch_sel_e <= branch_sel;
            control_e_adder_e <= control_e_adder;
        end
    end


endmodule