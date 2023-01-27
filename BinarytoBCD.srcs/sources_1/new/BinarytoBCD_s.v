`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/23/2023 02:31:19 PM
// Design Name: 
// Module Name: BinarytoBCD_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Converts the binary input into 12 bit BCD 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BinarytoBCD_s(bcd0, bcd1, bcd2, inNum, clk);

    output reg [3:0] bcd0, bcd1, bcd2;                              //ones, tens, and hundreds 

    input [7:0] inNum;                                              //input binary 
    input clk; 

    reg [3:0] n, bcd0_temp, bcd1_temp, bcd2_temp = 0;
    reg [7:0] inNum_init = 0; 
    reg [19:0] shiftReg = 0;                                        //min required bits for reg; 8 for binary + 12 for bcd 

    always @(posedge clk) begin
        if (n == 0 && (inNum != inNum_init)) begin                  //second cond means you only enter this if at the start 
            shiftReg = 20'b0; 
            inNum_init = inNum; 
            shiftReg[7:0] = inNum;                                  //set first to eighth bits to input number 
            bcd0_temp = shiftReg[11:8];                             //ones
            bcd1_temp = shiftReg[15:12];                            //tens
            bcd2_temp = shiftReg[19:16];                            //hundreds
            n = n + 1;      
        end
        if (n > 0 && n < 9) begin                                   //8 shifts for 8 bits
            if(bcd0_temp >= 5) 
                bcd0_temp = bcd0_temp + 3;                          //check if any of the bcd blocks are >= 5 if so add 3
            if(bcd1_temp >= 5)
                bcd1_temp = bcd1_temp + 3; 
            if(bcd2_temp >= 5) 
                bcd2_temp = bcd2_temp + 3; 
            shiftReg[19:8] = {bcd2_temp, bcd1_temp, bcd0_temp};     // set shift reg to new values if >= 5 condition met
            shiftReg = shiftReg << 1;                               // "<<" shift operator, shifts the bits left by the value on the right side; in this case 1 bit shift to the left 
            bcd0_temp = shiftReg[11:8];                             //ones
            bcd1_temp = shiftReg[15:12];                            //tens
            bcd2_temp = shiftReg[19:16];                            //hundreds; setting our temp values to new values to be checked again
            n = n + 1;    
        end 
        else begin 
                bcd0 = bcd0_temp;                                   //set the three                   
                bcd1 = bcd1_temp; 
                bcd2 = bcd2_temp; 
                n = 0;
        end     
    end

endmodule
