`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 07:31:23 PM
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    input clk,
    input [31:0] code,
    output reg RegWrite,
    output reg MemtoReg,
    output reg ALUSrc,            
    output reg [1:0] ALUOp,       
    output reg MemRead,           
    output reg MemWrite,          
    output reg Branch,            
    output reg Jump
);
always @(posedge clk) begin
    case(code[6:0])
        // R-type instructions
        7'b0110011: begin   // ADD
            RegWrite = 1;
            MemtoReg = 0;
            ALUSrc = 0;
            ALUOp = 2'b00;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
        end
        // I-type instructions
        7'b0010011: begin   // ADDI
            RegWrite = 1;
            MemtoReg = 0;
            ALUSrc = 1;
            ALUOp = 2'b00;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
        end
        7'b0000011: begin   // L-type instructions
            RegWrite = 1;
            MemtoReg = 1;
            ALUSrc = 1;
            ALUOp = 2'b00;
            MemRead = 1;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
        end
        7'b0100011: begin   // S-type instructions
            RegWrite = 0;
            MemtoReg = 0;
            ALUSrc = 1;
            ALUOp = 2'b00;
            MemRead = 0;
            MemWrite = 1;
            Branch = 0;
            Jump = 0;
        end
       
        default: begin
            // Handle unsupported instructions
            RegWrite = 0;
            MemtoReg = 0;
            ALUSrc = 0;
            ALUOp = 2'b00;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
        end
    endcase
end

endmodule
