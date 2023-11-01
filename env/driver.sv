class driver;
	virtual harness vif;

	task run_phase();
// ! Verilator can't compare vif with null
		// if (vif == null)
		// 	$fatal("No VIF set!");
		vif.val <= '0;
		vif.set_val <= 1'b0;
		wait(vif.rst_n == 1);
		wait(vif.clk == 1'b0);
		repeat (10) begin
			bit [31:0] value;
			@(posedge vif.clk);
// ! Verilator can't randomize a variable like this
//			std::randomize(value);
			value = $urandom_range(100, 1);
			vif.val <= value;
		end
	endtask
endclass
