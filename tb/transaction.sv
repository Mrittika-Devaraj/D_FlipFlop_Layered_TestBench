
class transaction;

    bit rst_n;
    bit d;
    bit q;

    function void display();
        $display("Reset = %b, Data = %b, Q = %b",
                 rst_n, d, q);
    endfunction

endclass
