
module apb_slave1(input PCLK,PRESETn,transfer,
                  
                  input PENABLE,PWRITE,
                  input [7:0]PWDATA,PADDR,
                  input SLV_PSEL1,
                  output reg SLV_PREADY1,
                  output reg [7:00]SLV_PRDATA1
);

    reg [7:0]mem[0:50];
reg [2:0]CS,NS;

    always@(PCLK)
        begin
            if(PENABLE && PWRITE && SLV_PSEL1 )
                begin SLV_PREADY1 = 0; mem[PADDR] = PWDATA; end
            else if (PENABLE && !PWRITE && SLV_PSEL1 )
                begin SLV_PREADY1 = 0; SLV_PRDATA1 = mem[PADDR]; end
            else
                SLV_PREADY1 = 0;
        end
        
endmodule
