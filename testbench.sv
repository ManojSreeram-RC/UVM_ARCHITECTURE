`include "uvm_macros.svh"
import uvm_pkg::*;
`include "my_interface.sv"
`include "my_transaction.sv"
`include "my_config.sv"
`include "my_driver.sv"
`include "my_sequencer.sv"
`include "my_agent.sv"
`include "my_sequence.sv"
 `include "my_env.sv"
 `include "my_test.sv"
//`include "my_pkg.sv"
module top;

  logic clock = 0; 
  logic reset;
  
  dut_if intf(clock, reset);
  
  dut dut1(.dif(intf));
  
  
  initial begin
    uvm_config_db#(virtual dut_if)::set(null,"*","int_key",intf);
//`uvm_fatal("top_module","interface not set properly in top module");
      end

  

  initial begin
    run_test("my_test");
  end
  
   always begin
    #5 clock = ~clock;
  end
  
  // VCD waveform dump
//   initial begin 
//     $dumpfile("dump.vcd");
//     $dumpvars();
//   end

endmodule
