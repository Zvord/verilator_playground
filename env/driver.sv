class driver;
	virtual harness vif;
	
	task run_phase();
// ! Verilator can't compare vif with null
//		if (vif == null)
//			$fatal("No VIF set!");
// ! Verilator can't use non-blocking and delayed assignments in classes
		int cnt = 0;
		vif.val = '0;
		vif.set_val = 1'b0;
		wait(vif.rst_n == 1);
		wait(vif.clk == 1'b0);
		forever begin
//		repeat (10) begin
			bit [31:0] value;
			wait(vif.clk == 1'b1);
// ! Verilator dies upon encountering a posedge in a cycle
//			@(posedge vif.clk);
// ! Verilator can't randomize a variable like this
//			std::randomize(value);
			value = $urandom_range(100, 1);
			vif.val = value;
			wait(vif.clk == 1'b0);
			if (++cnt == 10)
				break;
		end
	endtask
endclass
