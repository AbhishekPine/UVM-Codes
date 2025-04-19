class fifo_test extends uvm_test;
    `uvm_component_utils(fifo_test)

    fifo_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = fifo_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        fifo_transaction tx;
        repeat (5) begin
            tx = fifo_transaction::type_id::create("tx");
            assert(tx.randomize() with { wr_en == 1; rd_en == 0; });
            env.seqr.start_item(tx);
            env.seqr.finish_item(tx);
        end

        repeat (5) begin
            tx = fifo_transaction::type_id::create("tx");
            tx.wr_en = 0;
            tx.rd_en = 1;
            env.seqr.start_item(tx);
            env.seqr.finish_item(tx);
        end

        phase.drop_objection(this);
    endtask
endclass
