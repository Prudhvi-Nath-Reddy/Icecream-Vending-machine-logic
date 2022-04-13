/**
 * This is an autogenerated netlist code from CircuitVerse. Verilog Code can be
 * tested on https://www.edaplayground.com/ using Icarus Verilog 0.9.7. This is an
 * experimental module and some manual changes make need to be done in order for
 * this to work.
 *
 * If you have any ideas/suggestions or bug fixes, raise an issue
 * on https://github.com/CircuitVerse/CircuitVerse/issues/new/choose
 */

/*
  Element Usage Report
    Input - 16 times
    DflipFlop - 4 times
    Output - 11 times
    AndGate - 9 times
    OrGate - 3 times
    NotGate - 3 times
    SubCircuit - 3 times
    DigitalLed - 2 times
*/

/*
  Usage Instructions and Tips
    Labels - Ensure unique label names and avoid using verilog keywords
    Warnings - Connect all optional inputs to remove warnings
*/

// Sample Testbench Code - Uncomment to use

/*
module TestBench();

  reg INPUT, clk, reset, inp_0, inp_1;

  wire Return, Dispen, out_0, out_1;

  MAIN DUT0(Return, Dispen, INPUT, clk, reset);

  \Untitled-Circuit  DUT1(out_0, out_1, inp_0, inp_1);

  initial begin
    INPUT = 0;
    clk = 0;
    reset = 0;
    inp_0 = 0;
    inp_1 = 0;

    #15
    $display("Return = %b", Return);
    $display("Dispen = %b", Dispen);
    $display("out_0 = %b", out_0);
    $display("out_1 = %b", out_1);

    #10
    $display("Return = %b", Return);
    $display("Dispen = %b", Dispen);
    $display("out_0 = %b", out_0);
    $display("out_1 = %b", out_1);

    $finish;

  end
endmodule

*/

module Register(\Q2* , \Q1* , \Q0* , reset, clk, Q2, Q1, Q0);
  output \Q2* ,  \Q1* ,  \Q0* ;
  input reset, clk, Q2, Q1, Q0;
  wire DflipFlop_2_Q, DflipFlop_1_Q, DflipFlop_0_Q;
  DflipFlop DflipFlop_2(DflipFlop_2_Q, , clk, Q0, reset, , );
  assign \Q0*  = DflipFlop_2_Q;
  DflipFlop DflipFlop_1(DflipFlop_1_Q, , clk, Q1, reset, , );
  assign \Q1*  = DflipFlop_1_Q;
  DflipFlop DflipFlop_0(DflipFlop_0_Q, , clk, Q2, reset, , );
  assign \Q2*  = DflipFlop_0_Q;
endmodule

module NEXT_logic(\Q2* , \Q1* , \Q0* , Q1, Q0, I);
  output \Q2* ,  \Q1* ,  \Q0* ;
  input Q1, Q0, I;
  wire and_6_out, or_1_out, and_4_out, or_0_out, and_1_out, and_0_out, not_2_out, and_7_out, and_5_out, and_3_out, and_2_out, not_1_out, not_0_out;
  assign and_6_out = not_0_out & Q0 & I;
  assign or_1_out = and_5_out | and_6_out | and_7_out;
  assign \Q0*  = or_1_out;
  assign and_4_out = Q0 & I;
  assign or_0_out = and_1_out | and_2_out | and_3_out | and_4_out;
  assign \Q1*  = or_0_out;
  assign and_1_out = not_0_out & I;
  assign and_0_out = Q1 & not_1_out & I;
  assign \Q2*  = and_0_out;
  assign not_2_out = ~I;
  assign and_7_out = Q1 & not_2_out;
  assign and_5_out = not_1_out & not_2_out;
  assign and_3_out = Q1 & not_1_out & not_2_out;
  assign and_2_out = not_0_out & Q0;
  assign not_1_out = ~Q0;
  assign not_0_out = ~Q1;
endmodule

module OUTPUT_logic(out_0, inp_0, inp_1, inp_2);
  output out_0;
  input inp_0, inp_1, inp_2;
  wire and_0_out, or_0_out;
  assign and_0_out = inp_1 & inp_2;
  assign or_0_out = and_0_out | inp_0;
  assign out_0 = or_0_out;
endmodule




module MAIN(Return, Dispen, INPUT, clk, reset);
  output Return,  Dispen;
  input INPUT, clk, reset;
  wire Register_1_out_0, Register_1_out_1, Register_1_out_2, OUTPUT_logic_2_out, NEXT_logic_0_out_0, NEXT_logic_0_out_1, NEXT_logic_0_out_2;
  Register Register_1(Register_1_out_0, Register_1_out_1, Register_1_out_2, reset, clk, NEXT_logic_0_out_0, NEXT_logic_0_out_1, NEXT_logic_0_out_2);
  OUTPUT_logic OUTPUT_logic_2(OUTPUT_logic_2_out, Register_1_out_0, Register_1_out_1, Register_1_out_2);
  assign Dispen = OUTPUT_logic_2_out;
  
      always @ (*)
        $display("DigitalLed:OUTPUT_logic_2_out=%d", OUTPUT_logic_2_out);
  NEXT_logic NEXT_logic_0(NEXT_logic_0_out_0, NEXT_logic_0_out_1, NEXT_logic_0_out_2, Register_1_out_1, Register_1_out_2, INPUT);
  assign Return = Register_1_out_0;
  
      always @ (*)
        $display("DigitalLed:Register_1_out_0=%d", Register_1_out_0);
endmodule

module \Untitled-Circuit (out_0, out_1, inp_0, inp_1);
  output out_0,  out_1;
  input inp_0, inp_1;
  wire DflipFlop_0_Q, DflipFlop_0_Q_inv;
  DflipFlop DflipFlop_0(DflipFlop_0_Q, DflipFlop_0_Q_inv, inp_1, inp_0, , , );
  assign out_1 = DflipFlop_0_Q_inv;
  assign out_0 = DflipFlop_0_Q;
endmodule

module DflipFlop(q, q_inv, clk, d, a_rst, pre, en);
    parameter WIDTH = 1;
    output reg [WIDTH-1:0] q, q_inv;
    input clk, a_rst, pre, en;
    input [WIDTH-1:0] d;

    always @ (posedge clk or posedge a_rst)
    if (a_rst) begin
        q <= 'b0;
        q_inv <= 'b1;
    end else if (en == 0) ;
    else begin
        q <= d;
        q_inv <= ~d;
    end
endmodule
    