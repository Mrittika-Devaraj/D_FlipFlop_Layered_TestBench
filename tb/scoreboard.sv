
class scoreboard;

    mailbox #(transaction) mon2scb;

    int pass_count = 0;
    int fail_count = 0;

    function new(mailbox #(transaction) mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run();
        transaction tr;
        bit expected_q;

        repeat (6) begin
            mon2scb.get(tr);

            if (tr.rst_n == 0)
                expected_q = 0;
            else
                expected_q = tr.d;

            if (tr.q == expected_q) begin
                $display("SCOREBOARD: PASS | Expected=%b Actual=%b",
                         expected_q, tr.q);
                pass_count++;
            end
            else begin
                $display("SCOREBOARD: FAIL | Expected=%b Actual=%b",
                         expected_q, tr.q);
                fail_count++;
            end
        end
    endtask

endclass
