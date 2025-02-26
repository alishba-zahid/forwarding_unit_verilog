`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 10:14:15 PM
// Design Name: 
// Module Name: Hazard
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

module Hazard (
    input clk,
    input [1:0] pipeline_state,  
    input [6:0] fetch,        
    input [6:0] decode,        
    input [6:0] exec,        
    input [6:0] mem,       
    output reg stall               
);

always @(posedge clk) begin
    
    case(pipeline_state)
        2'b00: stall = 0; // No hazard in fetch stage
        2'b01: begin // Hazard detection in decode stage
            if (exec == 7'b0000011 && decode != 7'b0000000) begin
                stall = 1; // Stall if load instruction in execute and dependent instruction in decode
            end
            else begin
                stall = 0; // No hazard
            end
        end
        2'b10: begin // Hazard detection in execution stage
            if ((exec == 7'b0000011 && (mem != 7'b0000000 || decode != 7'b0000000)) ||  // Hazard between load in EX and dependent instruction in MEM or ID
                ((exec == 7'b1100011 || exec == 7'b0000011) && decode != 7'b0000000)) begin // Hazard between branch/load in EX and dependent instruction in ID
                stall = 1; // Stall if hazard detected
            end
            else begin
                stall = 0; // No hazard
            end
        end
        2'b11: begin // Hazard detection in memory stage
            if ((mem == 7'b0000011 && decode != 7'b0000000) || // Hazard between load in memory and dependent instruction in decode
                (mem == 7'b1100011 && decode != 7'b0000000)) begin // Hazard between branch in memory and dependent instruction in decode
                stall = 1; // Stall if hazard detected
            end
            else begin
                stall = 0; // No hazard
            end
        end
        default: stall = 0; 
    endcase
end

endmodule

   
