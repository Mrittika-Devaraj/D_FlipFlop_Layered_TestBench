
class transaction;

    bit rst_n;
    bit d;

    function void display();
        $display("Reset = %b, Data = %b", rst_n, d);
    endfunction

endclass
