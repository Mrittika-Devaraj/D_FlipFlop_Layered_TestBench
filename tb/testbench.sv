
`include "design.sv"
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module testbench;

    bit clk = 0;

    always #5 clk = ~clk;

    dff_if intf(clk);

    d_flipflop dut (
        .clk(clk),
        .rst_n(intf.rst_n),
        .d(intf.d),
        .q(intf.q)
    );

    environment env;

    initial begin
        env = new(intf);
        env.run();
        $finish;
    end

endmodule
