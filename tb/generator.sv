
class generator;

    mailbox #(transaction) gen2drv;

    function new(mailbox #(transaction) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        transaction tr;

        // Apply reset
        tr = new();
        tr.rst_n = 0;
        tr.d = 0;
        gen2drv.put(tr);

        // Normal operation
        tr = new();
        tr.rst_n = 1;
        tr.d = 0;
        gen2drv.put(tr);

        tr = new();
        tr.rst_n = 1;
        tr.d = 1;
        gen2drv.put(tr);

        tr = new();
        tr.rst_n = 1;
        tr.d = 0;
        gen2drv.put(tr);

        // Reset again
        tr = new();
        tr.rst_n = 0;
        tr.d = 1;
        gen2drv.put(tr);

        // Resume operation
        tr = new();
        tr.rst_n = 1;
        tr.d = 1;
        gen2drv.put(tr);

    endtask

endclass
