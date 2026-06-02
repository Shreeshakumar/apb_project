module apb_master(
                    input PCLK,PRESETn,transfer,READ_WRITE,
                    input [7:0]apb_write_paddr,apb_write_data,apb_read_paddr,
                    output [7:0]apb_read_data_out,
                    output PENABLE,PWRITE,
                    output [7:0]PWDATA,PADDR,
                    output PSEL,
                    input PREADY,
                    input [7:0]PRDATA
);

    
endmodule
