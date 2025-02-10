class my_test extends uvm_test;
`uvm_component_utils(my_test)
  
my_env my_env_h;
  
my_sequence seq;
  
my_sequencer sqr;
  
function new(string name, uvm_component parent);
super.new(name, parent);
endfunction: new
  
function void build_phase(uvm_phase phase);
my_env_h = my_env::type_id::create("my_env_h", this);
sqr = my_sequencer::type_id::create("sqr", this);
seq= my_sequence::type_id::create("seq");


  
endfunction: build_phase
  
  task run_phase(uvm_phase phase);
  	super.run_phase(phase);
	  phase.raise_objection(this);
	  
	 
		 
    seq.start(my_env_h.agt.m_sqr);
	  
	  phase.drop_objection(this);
	 `uvm_info("apb_test","RUN_PHASE OFF",UVM_LOW)
	  
  endtask 

  
endclass

