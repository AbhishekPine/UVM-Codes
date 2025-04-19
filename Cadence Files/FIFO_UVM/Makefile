SVFILES = fifo.sv fifo_if.sv fifo_transaction.sv fifo_sequencer.sv \
          fifo_driver.sv fifo_monitor.sv fifo_scoreboard.sv fifo_env.sv \
          fifo_test.sv fifo_tb_top.sv

TOPMODULE = fifo_tb_top

all:
	irun -uvm -sv $(SVFILES) -top $(TOPMODULE) -access +rwc

clean:
	rm -rf INCA_libs *.log *.key *.txt *.vcd
