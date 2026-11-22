
class driver;

    virtual dff_if vif;
    mailbox #(transaction) gen2drv;

    function new(virtual dff_if vif,
                 mailbox #(transaction) gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        transaction tr;

        forever begin
            gen2drv.get(tr);

            @(negedge vif.clk);

            vif.rst_n = tr.rst_n;
            vif.d     = tr.d;

            $display("DRIVER: Reset=%b, D=%b",
                     tr.rst_n, tr.d);
        end
    endtask

endclass
