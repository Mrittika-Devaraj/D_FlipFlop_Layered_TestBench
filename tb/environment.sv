
class environment;

    mailbox #(transaction) gen2drv;
    mailbox #(transaction) mon2scb;

    generator gen;
    driver drv;
    monitor mon;
    scoreboard scb;

    function new(virtual dff_if vif);

        gen2drv = new();
        mon2scb = new();

        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);

    endfunction

    task run();

        fork
            gen.run();
            drv.run();
            mon.run();
            scb.run();
        join

        $display("--------------------------------");
        $display("TEST COMPLETED");
        $display("PASS COUNT = %0d", scb.pass_count);
        $display("FAIL COUNT = %0d", scb.fail_count);
        $display("--------------------------------");

    endtask

endclass
