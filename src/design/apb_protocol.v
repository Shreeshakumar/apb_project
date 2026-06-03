`default_nettype none

module apb_protocol(
    input wire PCLK,PRESETn,transfer,READ_WRITE,
    input wire [7:0]apb_write_paddr,apb_write_data,apb_read_paddr,
    output reg [7:0]apb_read_data_out
);

// wires of apb_master
wire PENABLE,PWRITE;
wire [7:0]PWDATA,PADDR;
wire PSEL;
wire [7:0]PREADY,PRDATA;

// wires of apb_mux    
wire MST_PSEL,MST_PREADY;
wire [7:0]MST_PRDATA;
wire SLV_PSEL1,SLV_PREADY1;
wire [7:0]SLV_PRDATA1;
wire SLV_PSEL2,SLV_PREADY2;
wire [7:0]SLV_PRDATA2;
    
apb_master apb_master(.PCLK(PCLK),PRESETn(PRESETn),.transfer(transfer),.READ_WRITE(READ_WRITE),
                        .apb_write_paddr(apb_write_paddr),.apb_write_data(apb_write_data),
                        .apb_read_paddr(apb_read_paddr),.apb_read_data_out(apb_read_data_out),
           
                        .PENABLE(PENABLE),.PWRITE(PWRITE),.PWDATA(PWDATA),.PADDR(PADDR),
                        .PSEL(PSEL),.PREADY(PREADY),.PRDATA(PRDATA)
);

apb_mux apb_mux(.PADDR(PADDR),.MST_PSEL(MST_PSEL),.MST_PREADY(MST_PREADY),.MST_PRDATA(MST_PRDATA),
                        .SLV_PSEL1(SLV_PSEL1),.SLV_PREADY1(SLV_PREADY1),.SLV_PRDATA1(SLV_PRDATA1),
                        .SLV_PSEL2(SLV_PSEL2),.SLV_PREADY2(SLV_PREADY2),.SLV_PRDATA2(SLV_PRDATA2)
);

apb_slave1 apb_slave1(.PENABLE(PENABLE),.PWRITE(PWRITE),.PWDATA(PWDATA),.PADDR(PADDR),
                        .SLV_PSEL1(SLV_PSEL1),.SLV_PREADY1(SLV_PREADY1),.SLV_PRDATA1(SLV_PRDATA1)
);
    
apb_slave2 apb_slave2(.PENABLE(PENABLE),.PWRITE(PWRITE),.PWDATA(PWDATA),.PADDR(PADDR),
                        .SLV_PSEL2(SLV_PSEL2),.SLV_PREADY2(SLV_PREADY2),.SLV_PRDATA2(SLV_PRDATA2)
);
    
endmodule
