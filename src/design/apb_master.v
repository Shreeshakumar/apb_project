apb_master apb_master(.PCLK(PCLK),PRESETn(PRESETn),.transfer(transfer),.READ_WRITE(READ_WRITE),
                        .apb_write_paddr(apb_write_paddr),.apb_write_data(apb_write_data),
                        .apb_read_paddr(apb_read_paddr),.apb_read_data_out(apb_read_data_out),
           
                        .PENABLE(PENABLE),.PWRITE(PWRITE),.PWDATA(PWDATA),.PADDR(PADDR),
                        .PSEL(PSEL),.PREADY(PREADY),.PRDATA(PRDATA)
);

module apb_master(
                    input PCLK,PRESETn,transfer,READ_WRITE,
    input [7:0]apb_write_paddr,apb_write_data,apb_read_paddr,
    output
                  
  
);
endmodule
