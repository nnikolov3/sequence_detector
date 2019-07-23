//Testbench for Sequence Detector

module sdmoore_tb;

	logic din;
 	logic clk;
 	logic reset;
	logic dout;
	logic [7:0] databits [4:0];
	integer i, k;
	logic [7:0] temp;

//-----------------------------------------------
// Instantiate the Sequence Detector using Moore FSM
//--------------------------------------------------
 sdmoore uut (
  .din(din),
  .clk(clk),
  .reset(reset),
  .dout(dout)
 );
  
// generate stimulus
 initial begin
     clk = 0;
 	 forever #5 clk=~clk;
end 

initial begin
    reset = 1;
    #5 reset = 0;
    databits = {8'b01111000,8'b01101001,8'b01101000,8'b11010010,8'b01101001};

	for (k = 4; k>= 0;k--)begin
		temp = databits[k];
			for (i =  7; i >= 0; i--)begin
			 #10 din = temp[i];
		end
	end 
   
 #300 $finish;
 end 


endmodule
