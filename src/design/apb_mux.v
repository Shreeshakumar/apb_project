`default_nettype none

module apb_mux(input wire [8:0]PADDR,
               input wire MST_PSEL,
               output reg MST_PREADY,
               output reg [7:0]MST_PRDATA,
               
               output reg SLV_PSEL1,
               input wire SLV_PREADY1,
               input wire [7:0]SLV_PRDATA1,

               output reg SLV_PSEL2,
               input wire SLV_PREADY2,
               input wire [7:0]SLV_PRDATA2
);

  always@(*)
        begin
          if (PSEL)
            begin
                                PSEL1 = (PADDR[8])? 'd0:'d1;
                                PSEL2 = (PADDR[8])? 'd1:'d0;
                                MST_PREADY = (PADDR[8])? SLV_PREADY2:SLV_PREADY1;
                                MST_PRDATA = (PADDR[8])? SLV_PRDATA2 : SLV_PRDATA1;
            end end
endmodule
