module addRoundKey(clk, rst, data, out, key);
input clk;
input rst;
input [127:0] data;
input [127:0] key;
output [127:0] out;

// always @(posedge clk) begin
//     if(rst) begin
//         out <= 128'b0;
//     end
//     else begin
//         out <= key ^ data;
//     end
// end




// original
assign out = key ^ data;

endmodule