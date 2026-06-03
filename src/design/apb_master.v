`default_nettype none

module apb_master( 
                    input wire PCLK,PRESETn,transfer,READ_WRITE,
                    input wire [8:0]apb_write_paddr,
                    input wire [7:0]apb_write_data,
                    input wire [8:0]apb_read_paddr,
                    output reg [7:0]apb_read_data_out,
                    output reg PENABLE,PWRITE,
                    output reg [7:0]PWDATA,
                    output reg [8:0]PADDR,
                    output reg PSEL,
                    input wire PREADY,
                    input wire [7:0]PRDATA
);

localparam IDLE = 4;
localparam SETUP = 2;
localparam ACCESS = 1;

reg [2:0]CS,NS;
    
always@(posedge PCLK or negedge PRESETN)
    begin    CS <=(!PRESETn)?IDLE:NS;    end

  always@(*)
        begin
            case(CS)
                IDLE    :    begin
                                PSEL = 'd0;
                                PENABLE = 'd0;
                                NS = (transfer)?SETUP:IDLE;
                            end
                SETUP   :    begin
                                PSEL = 'd1;
                                PWRITE = (READ_WRITE)? 'd1 : 'd0;
                                PADDR = (READ_WRITE)?apb_read_paddr:apb_write_paddr;
                                if (READ_WRITE) PWDATA = apb_write_data;
                                NS = ACCESS;
                            end
                ACCESS  :    begin
                                PENABLE = 'd1;
                                if (!READ_WRITE) apb_read_data_out = PRDATA;
                                NS = (PREADY)? (transfer)? SETUP : IDLE : ACCESS ;
                            end 
                default :    NS = IDLE;
            endcase
        end
endmodule
