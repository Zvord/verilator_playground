class simple_sequence extends uvm_sequence;
    `uvm_object_utils(simple_sequence)

    rand int n = 10;

    function new(string name = "uvm_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        super.body();
        repeat(n) begin
            simple_item item = new("item");
            start_item(item);
            item.value = $urandom_range(100, 0);
            finish_item(item);
        end
    endtask : body


endclass
