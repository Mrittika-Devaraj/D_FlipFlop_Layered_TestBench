
class monitor;

    virtual dff_if vif;
    mailbox #(transaction) mon2scb;

    function new(virtual dff_if vif,
                 mailbox #(transaction) mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        transaction tr;

        repeat (6) begin
            @(posedge vif.clk);
            #1;

            tr = new();
            tr.rst_n = vif.rst_n;
            tr.d     = vif.d;
            tr.q     = vif.q;

            $display("MONITOR: Reset=%b, D=%b, Q=%b",
                     tr.rst_n, tr.d, tr.q);

            mon2scb.put(tr);
        end
    endtask

endclass
