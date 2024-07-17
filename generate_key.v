module GENERATE_KEY( 
    input clk,
    input rst,
    input [3:0] ROUND_KEY,      // Round Number
    input [127:0] IN_KEY,   // Input Key
    output [127:0] OUT_KEY,  // Output Key
    output  [127:0] OUT_KEY_R
);

    wire [31:0] KEY0, KEY1, KEY2, KEY3;
    wire [31:0] C;

    assign KEY3 = IN_KEY[127:96];
    assign KEY2 = IN_KEY[95:64];
    assign KEY1 = IN_KEY[63:32];
    assign KEY0 = IN_KEY[31:0];

    assign OUT_KEY[127:96] = KEY3 ^ C ^ RCON(ROUND_KEY);
    assign OUT_KEY[95:64] = KEY3 ^ C ^ RCON(ROUND_KEY) ^ KEY2;
    assign OUT_KEY[63:32] = KEY3 ^ C ^ RCON(ROUND_KEY) ^ KEY2 ^ KEY1;
    assign OUT_KEY[31:0] = KEY3 ^ C ^ RCON(ROUND_KEY) ^ KEY2 ^ KEY1 ^ KEY0;

    FORWARD_SUBSTITUTION_BOX INST0(.clk(clk),.rst(rst),.A(KEY0[23:16]), .C(C[31:24]));
    FORWARD_SUBSTITUTION_BOX INST1(.clk(clk),.rst(rst),.A(KEY0[15:8]), .C(C[23:16]));
    FORWARD_SUBSTITUTION_BOX INST2(.clk(clk),.rst(rst),.A(KEY0[7:0]), .C(C[15:8]));
    FORWARD_SUBSTITUTION_BOX INST3(.clk(clk),.rst(rst),.A(KEY0[31:24]), .C(C[7:0]));
    
    // always @ (posedge clk) begin
    //     if (rst) begin
    //         OUT_KEY_R <= 128'b0;
    //     end
    //     else begin
    //         OUT_KEY_R <= OUT_KEY;
    //     end
    // end


    // original
    assign OUT_KEY_R = OUT_KEY;
  
    function [31:0] RCON;
        input [3:0] ROUND_KEY;
        case (ROUND_KEY)
            4'h1: RCON = 32'h01000000;
            4'h2: RCON = 32'h02000000;
            4'h3: RCON = 32'h04000000;
            4'h4: RCON = 32'h08000000;
            4'h5: RCON = 32'h10000000;
            4'h6: RCON = 32'h20000000;
            4'h7: RCON = 32'h40000000;
            4'h8: RCON = 32'h80000000;
            4'h9: RCON = 32'h1b000000;
            4'ha: RCON = 32'h36000000;
            default: RCON = 32'h00000000;
        endcase
    endfunction
endmodule
    