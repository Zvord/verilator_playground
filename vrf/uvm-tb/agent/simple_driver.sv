class simple_driver extends uvm_driver#(simple_item);
	`uvm_component_utils(simple_driver)

	virtual simple_if vif;

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
// ! Verilator can't compare vif with null
		// if (vif == null) begin
			if (!uvm_config_db#(virtual simple_if)::get(this, "", "vif", vif)) begin
				`uvm_error("NOVIF", {"Interface is not set for ", get_full_name()})
			end
		// end
	endfunction : build_phase

	task run_phase(uvm_phase phase);
		vif.val <= '0;
		vif.set_val <= 1'b0;
		wait(vif.rst_n == 1);
		wait(vif.clk == 1'b0);
		forever begin
			seq_item_port.get_next_item(req);
			@(posedge vif.clk);
			vif.val <= req.value;
		end
	endtask
endclass
