`timescale 1ns/1ps

module pipelined_riscv(CLK100MHZ, btn, sw, led);

    input logic CLK100MHZ;
    input logic [3:0]btn;
    input logic [3:0]sw;
    output logic [3:0]led;
    
    logic check;
    logic reset = ~sw[0];
    
    //logic check_out;
    //assign check = 1;
    
    assign led[0] = check;
    assign led[1] = check;
    assign led[2] = check;
    assign led[3] = check;
    
    top top(.clk(CLK100MHZ), .reset, .done(check));
    //led_logic led_logic(.clk(CLK100MHZ), .done(check), .check_out);
     
endmodule
