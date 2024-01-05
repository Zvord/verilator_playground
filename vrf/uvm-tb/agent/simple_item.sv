class simple_item extends uvm_sequence_item;
   int value;

    function new(string name = "uvm_sequence_item");
        super.new(name);
    endfunction : new

endclass