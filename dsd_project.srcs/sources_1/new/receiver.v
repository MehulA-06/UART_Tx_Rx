module receiver(
    input clk,            
    input reset,        
    input RxD,           
    output [7:0] rx_data 
    );


    reg shift;           
    reg state, next_state; 
    reg [3:0] bit_counter; 
    reg [1:0] sample_counter; 
    reg [13:0] baud_counter; 
    reg [9:0] rx_shift_reg; 
    reg clear_bit_counter, clear_sample_counter, inc_bit_counter, inc_sample_counter;

  
    parameter clk_freq = 100000000; 
    parameter baud_rate = 9600;
    parameter div_sample = 4;       
    parameter div_counter = clk_freq / (baud_rate * div_sample); 
    parameter mid_sample = 1;       

    assign rx_data = rx_shift_reg[8:1]; 

    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
            bit_counter <= 0;
            baud_counter <= 0;
            sample_counter <= 0;
            rx_shift_reg <= 0;
        end else begin
            baud_counter <= baud_counter + 1;
            
            if (baud_counter >= div_counter - 1) begin
                baud_counter <= 0;
                state <= next_state;
                
                if (shift) begin
                
                    rx_shift_reg <= {RxD, rx_shift_reg[9:1]};
                end
                
                if (clear_sample_counter) sample_counter <= 0;
                else if (inc_sample_counter) sample_counter <= sample_counter + 1;
                
                if (clear_bit_counter) bit_counter <= 0;
                else if (inc_bit_counter) bit_counter <= bit_counter + 1;
            end
        end
    end

    always @(*) begin
      
        shift = 0;
        clear_sample_counter = 0;
        inc_sample_counter = 0;
        clear_bit_counter = 0;
        inc_bit_counter = 0;
        next_state = 0; 

        case (state)
            0: begin 
                if (RxD == 0) begin 
                    next_state = 1; 
                    clear_bit_counter = 1; 
                    clear_sample_counter = 1;
                end else begin
                    next_state = 0;
                end
            end

            1: begin
                next_state = 1; 
                
                
                if (sample_counter == mid_sample) begin
                    shift = 1; 
                end
                
                if (sample_counter == 3) begin 
                    if (bit_counter == 9) begin 
                        next_state = 0; 
                    end else begin
                        inc_bit_counter = 1; 
                        clear_sample_counter = 1; 
                    end
                end else begin
                    inc_sample_counter = 1; 
                end
            end
            default: next_state = 0;
        endcase
    end
endmodule