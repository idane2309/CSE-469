module led_logic(clk, done, check_out);
   input logic done, clk;
   output logic check_out;
    
   always_ff @(posedge clk) begin
        check_out <= done;
   end
   
endmodule
