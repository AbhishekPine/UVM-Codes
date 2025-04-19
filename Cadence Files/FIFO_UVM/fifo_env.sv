class fifo_env extends uvm_env;
    `uvm_component_utils(fifo_env)

    fifo_sequencer seqr;
    fifo_driver drv;
    fifo_monitor mon;
    fifo_scoreboard sb;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        seqr = fifo_sequencer::type_id::create("seqr", this);
        drv  = fifo_driver::type_id::create("drv", this);
        mon  = fifo_monitor::type_id::create("mon", this);
        sb   = fifo_scoreboard::type_id::create("sb", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass
