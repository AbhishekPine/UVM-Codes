`include "uvm_macros.svh"

module fifo_tb_top;

    import uvm_pkg::*;
    import fifo_test::*;

    logic clk;
    fifo_if fifo_if_inst(clk);

    fifo #(8, 8) dut (
        .clk(clk),
        .rst(fifo_if_inst.rst),
        .wr_en(fifo_if_inst.wr_en),
        .rd_en(fifo_if_inst.rd_en),
        .data_in(fifo_if_inst.data_in),
        .data_out(fifo_if_inst.data_out),
        .full(fifo_if_inst.full),
        .empty(fifo_if_inst.empty)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        uvm_config_db#(virtual fifo_if)::set(null, "*", "vif", fifo_if_inst);
        run_test("fifo_test");
    end

endmodule
