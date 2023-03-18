module execute_branch_decoder(zero, branch, jump, branch_sel, less_than, pc_src_e);

    parameter BEQ = 3'b000;
    parameter BNE = 3'b001;
    parameter BLT = 3'b010;
    parameter BGE = 3'b011;
    parameter BLTU = 3'b100;
    parameter BGEU = 3'b101;

    input logic zero;
    input logic branch;
    input logic [2:0]branch_sel;
    input logic less_than;
    input logic jump;
    output logic pc_src_e;

    logic branch_out;

    always_comb begin
        case(branch_sel)
            BEQ: begin //BEQ: branch_out = (branch & zero)
                case(branch)
                    0: branch_out = 0;
                    1: begin
                        case(zero)
                            0: branch_out = 0;
                            1: branch_out = 1;
                        endcase
                    end
                endcase
            end
            BNE: begin //BNE: branch_out = ~(branch & zero)
                case(branch)
                    0: branch_out = 0;
                    1: begin
                        case(zero)
                            0: branch_out = 1;
                            1: branch_out = 0;
                        endcase
                    end
                endcase
            end 
            BLT: begin //BLT: branch_out = branch & less_than
                case(branch)
                    0: branch_out = 0;
                    1: begin
                        case(less_than)
                            0: branch_out = 0;
                            1: branch_out = 1;
                        endcase
                    end
                endcase
            end 
            BGE: begin  //BGE: branch_out = ~(branch & less_than)
                case(branch)
                    0: branch_out = 0;
                    1: begin
                        case(less_than)
                            0: branch_out = 1;
                            1: branch_out = 0;
                        endcase
                    end
                endcase
            end 
            BLTU: begin //BLTU: branch_out = (branch & less_than (unsigned))
                case(branch)
                    0: branch_out = 0;
                    1: begin
                        case(less_than)
                            0: branch_out = 0;
                            1: branch_out = 1;
                        endcase
                    end
                endcase
            end 
            BGEU: begin  //BGEU: branch_out = ~(less_than (unsigned) & branch)
                case(branch)
                    0: branch_out = 0;
                    1: begin
                        case(less_than)
                            0: branch_out = 1;
                            1: branch_out = 0;
                        endcase
                    end
                endcase
            end 
            default: branch_out = 0;  //No Branch
        endcase
    end

    always_comb begin
        case(branch_out)
            0: begin
                case(jump)
                    0: pc_src_e = 0;
                    1: pc_src_e = 1;
                endcase
            end
            1: pc_src_e = 1;
            default: pc_src_e = 0;
        endcase
    end
    
endmodule