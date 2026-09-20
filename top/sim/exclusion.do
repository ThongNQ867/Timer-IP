coverage exclude -src ../rtl/count_control.v -code s -line 39 -comment {This statement is unreachable because the IP's error response prevent writitng invalid value to div_val} 
coverage exclude -src ../rtl/count_control.v -code b -line 39 -comment {this branch is unreachable due to the IP's error response} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TCR[2]} {TCR[3]} {TCR[4]} {TCR[5]} {TCR[6]} {TCR[7]} {TCR[12]} {TCR[13]} {TCR[14]} {TCR[15]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TCR[16]} {TCR[17]} {TCR[18]} {TCR[19]} {TCR[20]} {TCR[21]} {TCR[22]} {TCR[23]} {TCR[24]} {TCR[25]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TCR[26]} {TCR[27]} {TCR[28]} {TCR[29]} {TCR[30]} {TCR[31]} {THCSR[2]} {THCSR[3]} {THCSR[4]} {THCSR[5]} {THCSR[6]} {THCSR[7]} {THCSR[8]} {THCSR[9]} {THCSR[10]} {THCSR[11]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {THCSR[12]} {THCSR[13]} {THCSR[14]} {THCSR[15]} {THCSR[16]} {THCSR[17]} {THCSR[18]} {THCSR[19]} {THCSR[20]} {THCSR[21]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {THCSR[22]} {THCSR[23]} {THCSR[24]} {THCSR[25]} {THCSR[26]} {THCSR[27]} {THCSR[28]} {THCSR[29]} {THCSR[30]} {THCSR[31]}
coverage exclude -scope /test_bench/dut/register0 -togglenode {TIER[1]} {TIER[2]} {TIER[3]} {TIER[4]} {TIER[5]} {TIER[6]} {TIER[7]} {TIER[8]} {TIER[9]} {TIER[10]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TIER[11]} {TIER[12]} {TIER[13]} {TIER[14]} {TIER[15]} {TIER[16]} {TIER[17]} {TIER[18]} {TIER[19]} {TIER[20]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TIER[21]} {TIER[22]} {TIER[23]} {TIER[24]} {TIER[25]} {TIER[26]} {TIER[27]} {TIER[28]} {TIER[29]} {TIER[30]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TIER[31]} {TISR[1]} {TISR[2]} {TISR[3]} {TISR[4]} {TISR[5]} {TISR[6]} {TISR[7]} {TISR[8]} {TISR[9]} {TISR[10]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TISR[11]} {TISR[12]} {TISR[13]} {TISR[14]} {TISR[15]} {TISR[16]} {TISR[17]} {TISR[18]} {TISR[19]} {TISR[20]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TISR[21]} {TISR[22]} {TISR[23]} {TISR[24]} {TISR[25]} {TISR[26]} {TISR[27]} {TISR[28]} {TISR[29]} {TISR[30]} -comment {reserved bits} 
coverage exclude -scope /test_bench/dut/register0 -togglenode {TISR[31]} -comment {reserved bits} 
