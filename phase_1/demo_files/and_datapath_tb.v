`timescale 1ns/10ps
module and_datapath_tb; 	
	reg PCout, Zlowout, MDRout, R2out, R3out;
	reg MARin, PCin, MDRin, IRin, Yin;
	reg IncPC, Read;
	reg [4:0] op_code; 
	reg R1in, R2in, R3in;
	reg HIin, LOin, ZHighIn, Cin, ZLowIn;
	reg Clock, Clear;
	reg [31:0] Mdatain;
	wire [31:0] zlo_contents;

parameter	Default = 4'b0000, Reg_load1a= 4'b0001, Reg_load1b= 4'b0010,
					Reg_load2a= 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101,
					Reg_load3b = 4'b0110, T0= 4'b0111, T1= 4'b1000,T2= 4'b1001, T3= 4'b1010, T4= 4'b1011, T5= 4'b1100,
					AND = 5'b01010, OR = 5'b01011;

reg	[3:0] Present_state= Default;

initial Clear = 0;

and_datapath DUT(PCout, Zlowout, MDRout, MARin, ZLowIn, PCin, MDRin, Read, IRin, Yin, IncPC,
						 op_code,
						 Mdatain,
						 R1in,
						 R2in,
						 R3in,
						 R2out,
						 R3out,
						 Clear, Clock,
						 zlo_contents);

initial 
	begin
		Clock = 0;
		forever #10 Clock = ~ Clock;
end

always @(posedge Clock)//finite state machine; if clock rising-edge
begin
	case (Present_state)
		Default			:	Present_state = Reg_load1a;
		Reg_load1a		:	Present_state = Reg_load1b;
		Reg_load1b		:	Present_state = Reg_load2a;
		Reg_load2a		:	Present_state = Reg_load2b;
		Reg_load2b		:	Present_state = Reg_load3a;
		Reg_load3a		:	Present_state = Reg_load3b;
		Reg_load3b		:	Present_state = T0;
		T0				:	Present_state = T1;
		T1				:	Present_state = T2;
		T2				:	Present_state = T3;
		T3				:	Present_state = T4;
		T4				:	Present_state = T5;
		endcase
	end

always @(Present_state)// do the required job ineach state
begin
	case (Present_state)              //assert the required signals in each clock cycle
		Default: begin//0
			PCout <= 0; Zlowout <= 0;  MDRout<= 0;
			R2out <= 0;   R3out <= 0;   MARin <= 0;   ZLowIn <= 0;  
			PCin <=0;   MDRin <= 0;   IRin  <= 0;   Yin <= 0;  
			IncPC <= 0;   Read <= 0;   op_code <= 0;
			HIin <= 0; LOin <= 0; ZHighIn <= 0; Cin <= 0; ZLowIn <= 0;
			R1in <= 0; R2in <= 0; R3in <= 0; Mdatain <= 32'h00000000;
		end
		
		Reg_load1a: begin //1
			Mdatain<= 32'h000000FF;
			Read = 0; MDRin = 0;
			Read <= 1; MDRin <= 1;
		end

		Reg_load1b: begin //2
			Read <= 0; MDRin <= 0;
			MDRout<= 1; R2in <= 1;
		end

		Reg_load2a: begin //3
			MDRout<= 0; R2in <= 0;  
			Mdatain <= 32'h0000000F;
			Read <= 1; MDRin <= 1;
		end
		
		Reg_load2b: begin //4
			Read <= 0; MDRin <= 0;
			MDRout<= 1; R3in <= 1;
		end
		
		Reg_load3a: begin //5
			MDRout<= 0; R3in <= 0;
			Mdatain <= 32'hFFFFFFFF;
			Read <= 1; MDRin <= 1;  
			
		end
		
		Reg_load3b: begin //6
			Read <= 0; MDRin <= 0;
			MDRout<= 1; R1in <= 1;  
		end
	
		T0: begin //7
			MDRout<= 0; R1in <= 0;
			PCout<= 1; MARin <= 1; IncPC <= 1; ZLowIn <= 1; //<-- Dont think this should be here!
			
		end
		T1: begin //8
			PCin <= 0; MDRout <=0; PCout<= 0; MARin <= 0; IncPC <= 0; ZLowIn <= 0;
			Mdatain <= 32'h28918000; Read <= 1; MDRin <= 1; PCin <= 1; Zlowout<= 1; //<-- Dont think this should be here!
			
				
		end
		T2: begin //9
			Read <= 0; MDRin <= 0; Zlowout<= 0; PCin <= 0; 
			MDRout<= 1; IRin <= 1; 
			
		end
		T3: begin //a
			MDRout<= 0; IRin <= 0; 
			R2out<= 1; Yin <= 1;  
			
		end
		T4: begin //b FIXME
			R2out<= 0; Yin <= 0;
			R3out<= 1; op_code <= AND; ZLowIn <= 1; 
			
		end
		T5: begin //c FIXME
			R3out<= 0; ZLowIn <= 0;
			Zlowout<= 1; R1in <= 1; 
			// Zlowout<= 0; R1in <= 0;
		end
	endcase
end
endmodule