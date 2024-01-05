### RTL
$(RTL)/accum.sv

### TB
-f $(TB)/list/uvm.f

+incdir+$(TB)/agent
$(TB)/agent/simple_if.sv
$(TB)/agent/simple_agent_pkg.sv

+incdir+$(TB)/env
$(TB)/env/simple_env_pkg.sv

+incdir+$(TB)/test
$(TB)/test/test_pkg.sv

$(TB)/tb/tb_top.sv