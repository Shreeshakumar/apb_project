
module apb_mux(input PCLK,PRESETn,transfer,

               input [8:0]PADDR,
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

localparam IDLE = 4;
localparam SETUP = 2;
localparam ACCESS = 1;

reg [2:0]CS,NS;
    
    always@(posedge PCLK or negedge PRESETn)
    begin    CS <=(!PRESETn)?IDLE:NS;    end

  always@(*)
        begin
            case(CS)
                IDLE    :    begin  //SLV_PSEL1  SLV_PSEL2  MST_PREADY  MST_PRDATA
                                SLV_PSEL1 =  'd0;
                                SLV_PSEL2 =  'd0;
                                MST_PREADY = 'd0;
                                NS = (transfer)?SETUP:IDLE;
                            end
                SETUP   :    begin
                                PSEL1 = (PADDR[8])? 'd0:'d1;
                                PSEL2 = (PADDR[8])? 'd1:'d0;
                                MST_PREADY = 'd0;
                                NS = ACCESS;
                            end
                ACCESS  :    begin
                                MST_PREADY = 'd1;
                                NS = (transfer)? SETUP : IDLE ;
                            end 
                default :    NS = IDLE;
            endcase
        end
endmodule
