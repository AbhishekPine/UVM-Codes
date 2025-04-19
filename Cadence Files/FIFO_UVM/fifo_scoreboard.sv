class fifo_scoreboard extends uvm_component;
    `uvm_component_utils(fifo_scoreboard)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        // Implement checking logic here if needed
        `uvm_info("SCOREBOARD", "Scoreboard running", UVM_LOW)
    endtask
endclass
