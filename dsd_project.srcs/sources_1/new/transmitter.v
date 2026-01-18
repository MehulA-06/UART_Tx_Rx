module transmitter(
    input clk,
    input [7:0] data,
    input transmit,
    input reset,
    output reg TxD
    );

    reg [3:0] bit_counter;    
    reg [13:0] baudrate_counter; 
    reg [9:0] right_shift_register; 
    reg state, next_state;    
    reg shift;               
    reg load;                 
    reg clear;               

    parameter IDLE = 0;
    parameter TRANSMITTING = 1;

    // Sequential Logic (Counters and State Transitions)
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            bit_counter <= 0;
            baudrate_counter <= 0;
        end
        else begin
            baudrate_counter <= baudrate_counter + 1;
          
            if (baudrate_counter == 10415) begin
                state <= next_state; 
                baudrate_counter <= 0;
                
                if (load) begin
                   
                    right_shift_register <= {1'b1, data, 1'b0}; 
                end
                
                if (clear) begin
                    bit_counter <= 0;
                end
                
                if (shift) begin
                  
                    right_shift_register <= {1'b1, right_shift_register[9:1]};
                    bit_counter <= bit_counter + 1;
                end
            end
        end
    end

    // Combinational Logic (State Machine & Output)
    always @(posedge clk) begin
       
        load = 0;
        shift = 0;
        clear = 0;
        TxD = 1;
        
        case (state)
            IDLE: begin
                TxD = 1;
                if (transmit) begin
                    next_state = TRANSMITTING;
                    load = 1;
                    shift = 0;
                    clear = 0;
                end
                else begin
                    next_state = IDLE;
                    TxD = 1;
                end
            end

            TRANSMITTING: begin
                TxD = right_shift_register[0];
                if (bit_counter == 10) begin
                    next_state = IDLE;
                    clear = 1;
                end
                else begin
                    next_state = TRANSMITTING;
                    shift = 1;
                end
            end
            
            default: next_state = IDLE;
        endcase
    end

endmodule
