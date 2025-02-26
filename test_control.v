`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 08:20:49 PM
// Design Name: 
// Module Name: test_control
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

module test_Control;
reg [31:0] code;
reg clk;
wire [1:0] ALUOp;wire ALUSrc;wire Branch;wire MemRead;
wire MemWrite;wire RegWrite;wire MemtoReg;
Control_unit test(.code(code),.clk(clk),.ALUOp(ALUOp),.ALUSrc(ALUSrc),.Branch(Branch),.MemRead(MemRead),
.MemWrite(MemWrite),.RegWrite(RegWrite),.MemtoReg(MemtoReg));
always begin
clk = ~clk;
#5;
end
initial begin
clk = 1;
code = 32'h00032533;#10; //R type
code = 32'h200106B3;#10; //I type
code = 32'h0131A023;#10; //L type
code = 32'h00B29023;#10; //S type
end
endmodule

