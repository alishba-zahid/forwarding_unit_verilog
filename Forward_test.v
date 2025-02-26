`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 10:41:57 PM
// Design Name: 
// Module Name: Forward_test
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


module Forward_test;
    reg [6:0] rs1_d, rs2_d, rd_EX, rd_MEM, rd_WB;
    reg clk;
    wire [1:0] ID_EX, MEM_EX;
    
    Forwarding fwd(.rs1_d(rs1_d),.rs2_d(rs2_d),.rd_EX(rd_EX),.rd_MEM(rd_MEM),.rd_WB(rd_WB),.clk(clk),.ID_EX(ID_EX),.MEM_EX(MEM_EX));
    
always begin
   clk = 1;
   #5;
end
    
    // Test case 1: No forwarding
initial begin
     rs1_d = 7'b00000;
     rs2_d = 7'b00000;
     rd_EX = 7'b00000;
     rd_MEM = 7'b00000;
     rd_WB = 7'b00000;
     #10;
    //  Forwarding from Execution to Decode
     rs1_d = 7'b00010;
     rs2_d = 7'b00011;
     rd_EX = 7'b00011;
     rd_MEM = 7'b00000;
     rd_WB = 7'b00000;
     #10;
    //  Forwarding from Memory to Execution
     rs1_d = 7'b00010;
     rs2_d = 7'b00011;
     rd_EX = 7'b00000;
     rd_MEM = 7'b00011;
     rd_WB = 7'b00000;
     #10;
       
    end
endmodule

