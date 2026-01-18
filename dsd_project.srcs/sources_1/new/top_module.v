module UART_System_Top(
    input clk,              
    input reset_btn,       
    input transmit_btn,     
    input [7:0] SW,        
    input RxD,              
    output TxD,             
    output [7:0] LED       
    );

    wire transmit_pulse;    
   
    debounce_signals DB_inst (
        .clk(clk),
        .button(transmit_btn), 
        .trans_d(transmit_pulse) 
    );

    
   transmitter TX_inst (
        .clk(clk),
        .data(SW),
        .transmit(transmit_pulse), 
        .reset(reset_btn),   
        .TxD(TxD)     
    );

    
    receiver RX_inst (
        .clk(clk),
        .reset(reset_btn),     
        .RxD(RxD),       
        .rx_data(LED) 
    );

endmodule