class simple_agent extends uvm_agent;
    `uvm_component_utils(simple_agent)

    simple_driver drv;
    simple_sequencer sqr;
    simple_monitor mon;

    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon = simple_monitor::type_id::create("m_monitor", this);
        drv = simple_driver::type_id::create("m_driver", this);
        sqr = simple_sequencer::type_id::create("m_sequencer", this);
    endfunction : build_phase

endclass : simple_agent
