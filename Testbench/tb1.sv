module tb1();

  logic clk, reset;
  logic [31:0] writedata, dataadr;
  logic memwrite;

  top dut(.clk(clk), .reset(reset), .writedata(writedata), .dataadr(dataadr), .memwrite(memwrite));

  initial begin
    reset = 1;
    #22;
    reset = 0;
  end

  always begin
    #5 clk = ~clk;
  end

  always_ff @(negedge clk) begin
    if (memwrite) begin
      if (dataadr == 80 && writedata == 17) begin
        $display("Simulation successful");
        $stop;
      end else begin
        $display("Simulation failed");
        $stop;
      end
    end
  end

endmodule
