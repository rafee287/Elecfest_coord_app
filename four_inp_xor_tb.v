`timescale 1ns/1ps

module four_inp_xor_tb;

  reg a, b, c, d;
  wire y;
  
  // Reference (expected output)
  wire y_ref;
  
  // Mismatch signal
  wire mismatch;
  
  // Instantiate DUT (Device Under Test)
  four_inp_xor uut 
    (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );
    
    // Hardcoded reference logic (same AND behavior)
  assign y_ref = a ^ b ^ c ^ d;
  
  // Mismatch = 1 if output is wrong
  assign mismatch = (y !== y_ref);
  
  initial begin
      $dumpfile("four_inp_xor.vcd");  // waveform file
      $dumpvars(0, four_inp_xor_tb);
  
      // Test all cases
      a = 0; b = 0; c = 0; d = 0; #10;
      a = 0; b = 0; c = 0; d = 1; #10;
      a = 0; b = 0; c = 1; d = 0; #10;
      a = 0; b = 0; c = 1; d = 1; #10;
      a = 0; b = 1; c = 0; d = 0; #10;
      a = 0; b = 1; c = 0; d = 1; #10;
      a = 0; b = 1; c = 1; d = 0; #10;
      a = 0; b = 1; c = 1; d = 1; #10;
      a = 1; b = 0; c = 0; d = 0; #10;
      a = 1; b = 0; c = 0; d = 1; #10;
      a = 1; b = 0; c = 1; d = 0; #10;
      a = 1; b = 0; c = 1; d = 1; #10;
      a = 1; b = 1; c = 0; d = 0; #10;
      a = 1; b = 1; c = 0; d = 1; #10;
      a = 1; b = 1; c = 1; d = 0; #10;
      a = 1; b = 1; c = 1; d = 1; #10;
  
      $finish;
  end

endmodule