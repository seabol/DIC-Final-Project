// 
// Designer: <student ID> 
//
module AES(
    input clk,
    input rst,
    input [127:0] P,
    input [127:0] K,
    output reg [127:0] C,
    output reg valid
    );

// write your design here //
reg [127:0] tem_p;
reg [5:0] counter;
reg [127:0] KEY;
wire [127:0] OUT_KEYW1, OUT_KEYW2, OUT_KEYW3, OUT_KEYW4, OUT_KEYW5, OUT_KEYW6, OUT_KEYW7, OUT_KEYW8, OUT_KEYW9, OUT_KEYW10;
wire [127:0] OUT_KEYR0, OUT_KEYR1, OUT_KEYR2, OUT_KEYR3, OUT_KEYR4, OUT_KEYR5, OUT_KEYR6, OUT_KEYR7, OUT_KEYR8, OUT_KEYR9;
wire [127:0] SB_DATA, SB_DATA_1, SB_DATA_2, SB_DATA_3, SB_DATA_4, SB_DATA_5, SB_DATA_6, SB_DATA_7 , SB_DATA_8, SB_DATA_9;
wire [127:0] SHIFT_DATA, SHIFT_DATA_1, SHIFT_DATA_2, SHIFT_DATA_3, SHIFT_DATA_4, SHIFT_DATA_5, SHIFT_DATA_6, SHIFT_DATA_7, SHIFT_DATA_8, SHIFT_DATA_9;
wire [127:0] MIXED_DATA, MIXED_DATA_1, MIXED_DATA_2, MIXED_DATA_3, MIXED_DATA_4, MIXED_DATA_5, MIXED_DATA_6, MIXED_DATA_7, MIXED_DATA_8, MIXED_DATA_9;
wire [127:0] IN_DATA, IN_DATA_1, IN_DATA_2, IN_DATA_3, IN_DATA_4, IN_DATA_5, IN_DATA_6, IN_DATA_7, IN_DATA_8, IN_DATA_9, IN_DATA_10;

// temp
reg [127:0] temp_1, temp_2, temp_3, temp_4, temp_5, temp_6, temp_7, temp_8, temp_9, answer;
reg [127:0] temp_key_1, temp_key_2, temp_key_3, temp_key_4, temp_key_5, temp_key_6, temp_key_7, temp_key_8, temp_key_9;
// initial round



addRoundKey a0(.clk(clk), .rst(rst), .data(tem_p), .out(IN_DATA), .key(KEY));

GENERATE_KEY K1 (.clk(clk), .rst(rst), .ROUND_KEY(4'd1), .IN_KEY(KEY),.OUT_KEY(OUT_KEYW1), .OUT_KEY_R(OUT_KEYR0));
SUB_BYTES SB1(.clk(clk), .rst(rst), .IN_DATA(IN_DATA), .SB_DATA(SB_DATA));
SHIFT_ROWS SR1(.clk(clk), .rst(rst), .IN_DATA(SB_DATA), .SHIFT_DATA(SHIFT_DATA));
MIX_COLUMNS MC1(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA), .MIXED_DATA(MIXED_DATA));
addRoundKey a1(.clk(clk), .rst(rst), .data(MIXED_DATA), .out(IN_DATA_1), .key(OUT_KEYR0));

// pipellened one (temp_1, temp_key_1)


// second round
GENERATE_KEY K2 (.clk(clk), .rst(rst), .ROUND_KEY(4'd2), .IN_KEY(temp_key_1),.OUT_KEY(OUT_KEYW2), .OUT_KEY_R(OUT_KEYR1));
SUB_BYTES SB2(.clk(clk), .rst(rst), .IN_DATA(temp_1), .SB_DATA(SB_DATA_1));
SHIFT_ROWS SR2(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_1), .SHIFT_DATA(SHIFT_DATA_1));
MIX_COLUMNS MC2(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_1), .MIXED_DATA(MIXED_DATA_1));
addRoundKey a2(.clk(clk), .rst(rst), .data(MIXED_DATA_1), .out(IN_DATA_2), .key(OUT_KEYR1));

// pipelined two (temp_2, temp_key_2)


// third round
GENERATE_KEY K3 (.clk(clk), .rst(rst), .ROUND_KEY(4'd3), .IN_KEY(temp_key_2),.OUT_KEY(OUT_KEYW3), .OUT_KEY_R(OUT_KEYR2));
SUB_BYTES SB3(.clk(clk), .rst(rst), .IN_DATA(temp_2), .SB_DATA(SB_DATA_2));
SHIFT_ROWS SR3(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_2), .SHIFT_DATA(SHIFT_DATA_2));
MIX_COLUMNS MC3(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_2), .MIXED_DATA(MIXED_DATA_2));
addRoundKey a3(.clk(clk), .rst(rst), .data(MIXED_DATA_2), .out(IN_DATA_3), .key(OUT_KEYR2));

// pipelined three (temp_3, temp_key_3)



// fourth round
GENERATE_KEY K4 (.clk(clk), .rst(rst), .ROUND_KEY(4'd4), .IN_KEY(temp_key_3),.OUT_KEY(OUT_KEYW4), .OUT_KEY_R(OUT_KEYR3));
SUB_BYTES SB4(.clk(clk), .rst(rst), .IN_DATA(temp_3), .SB_DATA(SB_DATA_3));
SHIFT_ROWS SR4(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_3), .SHIFT_DATA(SHIFT_DATA_3));
MIX_COLUMNS MC4(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_3), .MIXED_DATA(MIXED_DATA_3));
addRoundKey a4(.clk(clk), .rst(rst), .data(MIXED_DATA_3), .out(IN_DATA_4), .key(OUT_KEYR3));

// pipelined four (temp_4, temp_key_4)
//fifth round
GENERATE_KEY K5 (.clk(clk), .rst(rst), .ROUND_KEY(4'd5), .IN_KEY(temp_key_4),.OUT_KEY(OUT_KEYW5), .OUT_KEY_R(OUT_KEYR4));
SUB_BYTES SB5(.clk(clk), .rst(rst), .IN_DATA(temp_4), .SB_DATA(SB_DATA_4));
SHIFT_ROWS SR5(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_4), .SHIFT_DATA(SHIFT_DATA_4));
MIX_COLUMNS MC5(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_4), .MIXED_DATA(MIXED_DATA_4));
addRoundKey a5(.clk(clk), .rst(rst), .data(MIXED_DATA_4), .out(IN_DATA_5), .key(OUT_KEYR4));


// pipelined five (temp_5, temp_key_5)
//sixth round
GENERATE_KEY K6 (.clk(clk), .rst(rst),  .ROUND_KEY(4'd6), .IN_KEY(temp_key_5),.OUT_KEY(OUT_KEYW6), .OUT_KEY_R(OUT_KEYR5));
SUB_BYTES SB6(.clk(clk), .rst(rst), .IN_DATA(temp_5), .SB_DATA(SB_DATA_5));
SHIFT_ROWS SR6(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_5), .SHIFT_DATA(SHIFT_DATA_5));
MIX_COLUMNS MC6(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_5), .MIXED_DATA(MIXED_DATA_5));
addRoundKey a6(.clk(clk), .rst(rst), .data(MIXED_DATA_5), .out(IN_DATA_6), .key(OUT_KEYR5));

// pipelined six (temp_6, temp_key_6)
//seventh round
GENERATE_KEY K7 (.clk(clk), .rst(rst), .ROUND_KEY(4'd7), .IN_KEY(temp_key_6),.OUT_KEY(OUT_KEYW7), .OUT_KEY_R(OUT_KEYR6));
SUB_BYTES SB7(.clk(clk), .rst(rst), .IN_DATA(temp_6), .SB_DATA(SB_DATA_6));
SHIFT_ROWS SR7(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_6), .SHIFT_DATA(SHIFT_DATA_6));
MIX_COLUMNS MC7(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_6), .MIXED_DATA(MIXED_DATA_6));
addRoundKey a7(.clk(clk), .rst(rst), .data(MIXED_DATA_6), .out(IN_DATA_7), .key(OUT_KEYR6));

// pipelined seven (temp_7, temp_key_7)
// eighth round
GENERATE_KEY K8 (.clk(clk), .rst(rst), .ROUND_KEY(4'd8), .IN_KEY(temp_key_7),.OUT_KEY(OUT_KEYW8), .OUT_KEY_R(OUT_KEYR7));
SUB_BYTES SB8(.clk(clk), .rst(rst), .IN_DATA(temp_7), .SB_DATA(SB_DATA_7));
SHIFT_ROWS SR8(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_7), .SHIFT_DATA(SHIFT_DATA_7));
MIX_COLUMNS MC8(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_7), .MIXED_DATA(MIXED_DATA_7));
addRoundKey a8(.clk(clk), .rst(rst), .data(MIXED_DATA_7), .out(IN_DATA_8), .key(OUT_KEYR7));

// pipelined eight (temp_8, temp_key_8)
// nineth round 
GENERATE_KEY K9 (.clk(clk), .rst(rst), .ROUND_KEY(4'd9), .IN_KEY(temp_key_8),.OUT_KEY(OUT_KEYW9), .OUT_KEY_R(OUT_KEYR8));
SUB_BYTES SB9(.clk(clk), .rst(rst), .IN_DATA(temp_8), .SB_DATA(SB_DATA_8));
SHIFT_ROWS SR9(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_8), .SHIFT_DATA(SHIFT_DATA_8));
MIX_COLUMNS MC9(.clk(clk), .rst(rst), .IN_DATA(SHIFT_DATA_8), .MIXED_DATA(MIXED_DATA_8));
addRoundKey a9(.clk(clk), .rst(rst), .data(MIXED_DATA_8), .out(IN_DATA_9), .key(OUT_KEYR8));

// pipelined nine (temp_9, temp_key_9)
// tenth round
GENERATE_KEY K10 (.clk(clk), .rst(rst), .ROUND_KEY(4'd10), .IN_KEY(temp_key_9),.OUT_KEY(OUT_KEYW10), .OUT_KEY_R(OUT_KEYR9));
SUB_BYTES SB10(.clk(clk), .rst(rst), .IN_DATA(temp_9), .SB_DATA(SB_DATA_9));
SHIFT_ROWS SR10(.clk(clk), .rst(rst), .IN_DATA(SB_DATA_9), .SHIFT_DATA(SHIFT_DATA_9));
addRoundKey a10(.clk(clk), .rst(rst), .data(SHIFT_DATA_9), .out(IN_DATA_10), .key(OUT_KEYR9));



always @(posedge clk) begin
    if (rst) begin
        counter <= 6'b0;
        valid <= 1'b0;
        C <= 128'b0;
        temp_1 <= 128'b0;
        temp_key_1 <= 128'b0;
        temp_key_2 <= 128'b0;
        temp_2 <= 128'b0;
        temp_3 <= 128'b0;
        temp_key_3 <= 128'b0;
        temp_4 <= 128'b0;
        temp_5 <= 128'b0;
        temp_key_4 <= 128'b0;
        temp_key_5 <= 128'b0;
        temp_6 <= 128'b0;
        temp_key_6 <= 128'b0;
        temp_7 <= 128'b0;
        temp_key_7 <= 128'b0;
        temp_8 <= 128'b0;
        temp_key_8 <= 128'b0;
        temp_9 <= 128'b0;
        temp_key_9 <= 128'b0;
        answer <= 128'b0;
    end
    else if (counter >= 6'd12) begin
        C <= answer;
        valid <= 1'b1;
        tem_p <= P;
        KEY <= K;
        temp_1 <= IN_DATA_1;
        temp_key_1 <= OUT_KEYW1;
        temp_key_2 <= OUT_KEYW2;
        temp_2 <= IN_DATA_2;
        temp_3 <= IN_DATA_3;
        temp_key_3 <= OUT_KEYW3;
        temp_4 <= IN_DATA_4;
        temp_key_4 <= OUT_KEYW4;
        temp_key_5 <= OUT_KEYW5;
        temp_5 <= IN_DATA_5;
        temp_6 <= IN_DATA_6;
        temp_7 <= IN_DATA_7;
        temp_8 <= IN_DATA_8;
        temp_9 <= IN_DATA_9;
        temp_key_6 <= OUT_KEYW6;
        temp_key_7 <= OUT_KEYW7;
        temp_key_8 <= OUT_KEYW8;
        temp_key_9 <= OUT_KEYW9;
        answer <= IN_DATA_10;
    end
    else begin
        valid <= 1'b0;
        tem_p <= P;
        KEY <= K;
        C <= answer;
        counter <= counter + 1;
        temp_1 <= IN_DATA_1;
        temp_key_1 <= OUT_KEYW1;
        temp_key_2 <= OUT_KEYW2;
        temp_2 <= IN_DATA_2;
        temp_3 <= IN_DATA_3;
        temp_key_3 <= OUT_KEYW3;
        temp_4 <= IN_DATA_4;
        temp_key_4 <= OUT_KEYW4;
        temp_key_5 <= OUT_KEYW5;
        temp_5 <= IN_DATA_5;
        temp_key_6 <= OUT_KEYW6;
        temp_6 <= IN_DATA_6;
        temp_7 <= IN_DATA_7;
        temp_key_7 <= OUT_KEYW7;
        temp_8 <= IN_DATA_8;
        temp_key_8 <= OUT_KEYW8;
        temp_9 <= IN_DATA_9;
        temp_key_9 <= OUT_KEYW9;
        answer <= IN_DATA_10;
    end
end



endmodule