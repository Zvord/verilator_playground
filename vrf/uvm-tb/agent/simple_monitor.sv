class simple_monitor extends uvm_monitor;
    `uvm_component_utils(simple_monitor)

    virtual simple_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
// ! Verilator can't compare vif with null
		// if (vif == null) begin
			if (0 == uvm_config_db#(virtual simple_if)::get(this, "", "vif", vif)) begin
				`uvm_error("NOVIF", {"Interface is not set for ", get_full_name()})
			end
		// end
    endfunction : build_phase

    task run_phase(uvm_phase phase);
        wait(vif.rst_n == 1);
        forever begin
            @(posedge vif.clk);
            $display("time: %0d, value = %0d, accum = %0d", $time, vif.val, vif.acc);
        end
    endtask
endclass
