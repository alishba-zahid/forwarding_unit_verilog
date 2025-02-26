`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 10:40:35 PM
// Design Name: 
// Module Name: Forwarding
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


module Forwarding(
    input [6:0] rs1_d,    
    input [6:0] rs2_d,    
    input [6:0] rd_EX,     
    input [6:0] rd_MEM,    
    input [6:0] rd_WB,  
    input clk,  
    output reg [1:0] ID_EX,  
    output reg [1:0] MEM_EX  
);


always @(posedge clk) begin
    // Determine forwarding select for data from execution to decode stage
    if (rs1_d != 7'b00000 && rs1_d == rd_EX) begin
        ID_EX[0] = 1; // Forward data from execution destination register to rs1 in decode stage
    end
    else begin
        ID_EX[0] = 0; // No forwarding for rs1
    end
    
    if (rs2_d != 7'b00000 && rs2_d == rd_EX) begin
        ID_EX[1] = 1; // Forward data execution to rs2 in decode stage
    end
    else begin
        ID_EX[1] = 0; // No forwarding for rs2
    end

    // Determine forwarding select for data from memory to execution stage
    if (rs1_d != 7'b00000 && rs1_d == rd_MEM) begin
        MEM_EX[0] = 1; // Forward data from memory destination register to rs1 in execution stage
    end
    else begin
       MEM_EX[0] = 0; // No forwarding for rs1
    end
    
    if (rs2_d != 7'b00000 && rs2_d == rd_MEM) begin
        MEM_EX[1] = 1; // Forward data from memory register to rs2 in execution  stage
    end
    else begin
        MEM_EX[1] = 0; // No forwarding for rs2
    end
end

endmodule
   
