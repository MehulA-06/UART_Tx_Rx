module debounce_signals(
    input clk,
    input button,
    output reg trans_d 
    );

    reg FF1, FF2; 
    reg [20:0] count; 
    reg debounced_state;

    parameter DB_LIMIT = 1000000; 

    always @(posedge clk) begin
        FF1 <= button;
        FF2 <= FF1;
    end

    always @(posedge clk) begin
        if (FF2 == 1) begin 
            if (count < DB_LIMIT)
                count <= count + 1;
        end
        else begin 
            if (count > 0)
                count <= count - 1;
        end
       
        if (count > DB_LIMIT - 100)
            trans_d <= 1;
        else
            trans_d <= 0;
    end

endmodule