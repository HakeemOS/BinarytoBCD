`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2023 09:48:15 PM
// Design Name: 
// Module Name: BtoBCD_tb
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


module BtoBCD_tb();

    reg [7:0] INNUM; 
    reg CLK; 

    wire [3:0] BCD0, BCD1, BCD2; 

    BinarytoBCD_s U0 (BCD0, BCD1, BCD2, INNUM, CLK); 

    always #5 CLK = ~CLK; 

    initial begin

        CLK = 0; 
        INNUM = 12;

        #120
        INNUM = 18;

        #120
        INNUM = 169;

        #120
        INNUM = 255; 


    end


endmodule
