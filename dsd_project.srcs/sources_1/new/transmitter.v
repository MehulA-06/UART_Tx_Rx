`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 02:40:38 PM
// Design Name: 
// Module Name: transmitter
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


module transmitter(
input clk,
input [7:0] data,
input transmit,
input reset,
output TxD
    );
   reg [3:0] bit_counter; 
   reg [13:0] baudrate_counter; // counter= clock/ baudrate
   reg [9:0] shiftright_register; //10 bits which will be transmitted using UART protocol to zedboard
   reg state, next_state; // where state is idle mode and next_state is transmitting mode
   reg shift; // conversion of parallel data to serial stream and vice versa
   reg load; //loads the data bus into the shift register
   reg clear; //reset the counter
   
   //transmission
   always @(posedge clk)
   begin
   if(reset)
   begin
   state<=0;
   bit_counter<=0;
   baudrate_counter<=0;
   end
   else begin
   baudrate_counter<=baudrate_counter+1;
   if (baudrate_conter==10415)
   begin
   state<=next_state;
   baudrate_counter<=0;
   if(load)
   shiftright_register<={1'b1,data,1'b0};
   if(clear)
   bit_counter<=0;
   if (shift)
   shiftright_register<=shiftright_register>>1; // start shifg=ting of data,>> represents shifting
   bit_counter<=bit_counter+1;
   end
   end
   end
   
   //Mealy FSM
   always @(posedge clk)
   begin
   load<=0;
   shift<=0;
   clear<=0;
   TxD<=1; // 1 means no transmission in progress
   
   case(state)
   0: begin
   if (transmit)
   next_state<=1;
   load<=1;
   
   
endmodule
