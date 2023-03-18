module hazard_unit(rs1_addr_e, rs2_addr_e, write_addr_m, write_addr_w, reg_write_m, reg_write_w, forward_srcA_e, forward_srcB_e, result_src_e, rs1_addr_d, rs2_addr_d, write_addr_e ,stall_f, stall_d, flush_e, flush_d, pc_src_e);
    input logic [4:0] rs1_addr_e, rs2_addr_e, write_addr_m, write_addr_w;
    input logic reg_write_m, reg_write_w;
    output logic [1:0] forward_srcA_e, forward_srcB_e;

    input logic [4:0] rs1_addr_d, rs2_addr_d, write_addr_e;
    input logic [1:0] result_src_e;
    output logic stall_f, stall_d, flush_e;

    input logic pc_src_e;
    output logic flush_d;



    // forward_srcA_e //
    always_comb begin
    //Forward from Memory Stage
        if (((rs1_addr_e == write_addr_m) && reg_write_m) && (rs1_addr_e != 0)) begin
            forward_srcA_e = 2'b10;
        end
        //Forward from WriteBack Stage
        else if (((rs1_addr_e == write_addr_w) && reg_write_w) && (rs1_addr_e != 0)) begin
            forward_srcA_e = 2'b01;
        end
        //No Forwarding (Use RF Output)
        else begin
            forward_srcA_e = 2'b00;
        end
    end

    // forward_srcB_e //
    always_comb begin
        //Forward from Memory Stage
        if (((rs2_addr_e == write_addr_m) && reg_write_m) && (rs2_addr_e != 0)) begin
            forward_srcB_e = 2'b10;
        end
        //Forward from WriteBack Stage
        else if (((rs2_addr_e == write_addr_w) && reg_write_w) && (rs2_addr_e != 0)) begin
            forward_srcB_e = 2'b01;
        end
        //No Forwarding (Use RF Output)
        else begin
            forward_srcB_e = 2'b00;
        end
    end

    // lwStall for stall_f, stall_d, flush_e, flush_d //
    //Stall when a load hazard occurs
    logic lw_stall;
    //assign lw_stall = result_src_e[0] && ((rs1_addr_d == write_addr_e) || (rs2_addr_d == write_addr_e));
    always_comb begin
        case(result_src_e[0])
            0: lw_stall = 0;
            1: begin
                if ((rs1_addr_d == write_addr_e) || (rs2_addr_d == write_addr_e)) begin
                    lw_stall = 1;
                 end
                else begin
                    lw_stall = 0;
                end
            end
            default: lw_stall = 0;
        endcase
    end
    
    assign stall_f = lw_stall;
    assign stall_d = lw_stall;
    assign flush_e = lw_stall | pc_src_e;
    assign flush_d = pc_src_e;

    
endmodule