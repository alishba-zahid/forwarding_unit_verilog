`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 10:24:27 PM
// Design Name: 
// Module Name: Hazrad_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Hazrad_test;
    reg clk;reg [1:0] pipeline_state;reg [6:0] fetch, decode, exec, mem;wire stall;

    Hazard haz(.clk(clk),.pipeline_state(pipeline_state),.fetch(fetch),.decode(decode),.exec(exec),.mem(mem),.stall(stall));    
   
always begin
   clk = 1;
   #5;
end
    
initial begin
     // No hazard in fetch stage
     pipeline_state = 2'b00;
     fetch = 7'b0000000;
     decode = 7'b0000000;
     exec = 7'b0000000;
     mem = 7'b0000000;
     #10;
            
     //Hazard detection in decode stage (load instruction in execute)
     pipeline_state = 2'b01;
     fetch = 7'b0000000;
     decode = 7'b1000000;
     exec = 7'b0000011;
     mem = 7'b0000000;
     #10;
            
     //Hazard detection in execution stage (load instruction in execution, dependent instruction in memory)
     pipeline_state = 2'b10;
     fetch = 7'b0000000;
     decode = 7'b1000000;
     exec = 7'b0000011;
     mem = 7'b1000000;
     #10;
            
     //Hazard detection in memory stage (load instruction in memory)
     pipeline_state = 2'b11;
     fetch = 7'b0000000;
     decode = 7'b1000000;
     exec = 7'b0000000;
     mem = 7'b0000011;
     #10;
            
     //No hazard
     pipeline_state = 2'b00;
     fetch = 7'b0000000;
     decode = 7'b1000000;
     exec = 7'b0000000;
     mem = 7'b0000000;
     #10;
            
     end
endmodule


  