class simple_sequencer extends uvm_sequencer #(simple_item, simple_item); // !Verilator at the moment requires to specify even optional parameters
    `uvm_component_utils(simple_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

endclass : simple_sequencer
