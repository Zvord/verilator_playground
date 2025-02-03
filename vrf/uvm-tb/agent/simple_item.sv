class simple_item extends uvm_sequence_item;
    rand int value;  // Making it random for sequence generation

    // UVM automation macros
    `uvm_object_utils_begin(simple_item)
        `uvm_field_int(value, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "simple_item");  // Updated the default name
        super.new(name);
    endfunction : new

endclass
