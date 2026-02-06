# Classes, Objects, & Handles

```systemverilog
class Packet1;
int addr;   // data member: address
int data;   // data member: data value
endclass

module tb_packet;
Packet1 p;  // handle declaration
  
initial begin
  p = new();        // object creation
  p.addr = 10;      // assign address
  p.data = 20;      // assign data
$finish;
  
end
endmodule
```
