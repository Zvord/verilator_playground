class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    simple_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = simple_env::type_id::create("env", this);
    endfunction : build_phase

    virtual task main_phase(uvm_phase phase);
        super.main_phase(phase);
    endtask : main_phase


endclass
