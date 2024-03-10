module synchronizer(
  input logic clk_fast,
  input logic rd_en,
  input logic rstn,
  output reg rd_en_s2f);
  
  reg rd_en_s2f1, rd_en_s2f2, rd_en_s2f3;
  
  always @(posedge clk_fast or negedge rstn) begin
    if(!rstn) begin
      {rd_en_s2f1, rd_en_s2f2, rd_en_s2f3} <= 3'b000;
    end
    else begin
      {rd_en_s2f3, rd_en_s2f2, rd_en_s2f1} <= {rd_en_s2f2, rd_en_s2f1, rd_en};
    end 
  end
  
  always @(rd_en_s2f3, rd_en_s2f2) begin
    case({rd_en_s2f3, rd_en_s2f2})
      2'b01:rd_en_s2f <= 1'b1;
      default:rd_en_s2f <= 1'b0;
    endcase
  end
  
endmodule:synchronizer
