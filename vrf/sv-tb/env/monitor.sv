class monitor;
	virtual harness vif;

	task run_phase();
// ! Verilator can't compare vif with null
//		if (vif == null)
//			$fatal("No VIF set!");
		wait(vif.rst_n == 1);
		forever begin
			@(posedge vif.clk);
			$display("time: %0d, value = %0d, accum = %0d", $time, vif.val, vif.acc);
		end
	endtask
endclass
