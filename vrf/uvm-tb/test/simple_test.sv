class simple_test extends base_test;
    `uvm_component_utils(simple_test)

    function new(string name="simple_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual task main_phase(uvm_phase phase);
        simple_sequence seq;

        phase.raise_objection(this);
        seq = simple_sequence::type_id::create("seq");
        seq.start(env.agent.sqr);
        phase.drop_objection(this);
    endtask
endclass
