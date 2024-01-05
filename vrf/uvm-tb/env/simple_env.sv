class simple_env extends uvm_env;
    `uvm_component_utils(simple_env)

    simple_agent agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = simple_agent::type_id::create("agent", this);
    endfunction : build_phase

endclass : simple_env
