
module apb_mux(input [8:0]PADDR,
               input MST_PSEL,
               output MST_PREADY,
               output [7:0]MST_PRDATA,
               
               output SLV_PSEL1,
               input SLV_PREADY1,
               input [7:0]SLV_PRDATA1,

               output SLV_PSEL2,
               input SLV_PREADY2,
               input [7:0]SLV_PRDATA2
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
