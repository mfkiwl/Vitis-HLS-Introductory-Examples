// ==============================================================
// RTL generated by Scout HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.0
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="array_mem_perform_array_mem_perform,hls_ip_2019_2_0,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu9p-flga2104-2-i,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.586000,HLS_SYN_LAT=130,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=39,HLS_SYN_LUT=137,HLS_VERSION=2019_2_0}" *)

module array_mem_perform_array_mem_perform (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mem_Addr_A,
        mem_EN_A,
        mem_WEN_A,
        mem_Din_A,
        mem_Dout_A,
        mem_Clk_A,
        mem_Rst_A,
        mem_Addr_B,
        mem_EN_B,
        mem_WEN_B,
        mem_Din_B,
        mem_Dout_B,
        mem_Clk_B,
        mem_Rst_B,
        ap_return
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state5 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] mem_Addr_A;
output   mem_EN_A;
output  [0:0] mem_WEN_A;
output  [7:0] mem_Din_A;
input  [7:0] mem_Dout_A;
output   mem_Clk_A;
output   mem_Rst_A;
output  [31:0] mem_Addr_B;
output   mem_EN_B;
output  [0:0] mem_WEN_B;
output  [7:0] mem_Din_B;
input  [7:0] mem_Dout_B;
output   mem_Clk_B;
output   mem_Rst_B;
output  [9:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg mem_EN_A;
reg mem_EN_B;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] i_reg_81;
reg   [9:0] sum_reg_92;
reg   [6:0] empty_reg_104;
reg  signed [6:0] empty_7_reg_113;
wire   [31:0] mem_addr_1_gep_fu_60_p3;
wire   [6:0] trunc_ln135_fu_124_p1;
wire    ap_CS_fsm_state2;
wire   [6:0] trunc_ln135_1_fu_128_p1;
wire   [0:0] icmp_ln102_fu_132_p2;
reg   [0:0] icmp_ln102_reg_211;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [7:0] add_ln102_fu_143_p2;
reg    ap_enable_reg_pp0_iter0;
wire  signed [6:0] trunc_ln135_2_fu_149_p1;
reg    ap_enable_reg_pp0_iter1;
wire   [9:0] add_ln654_fu_185_p2;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
wire   [63:0] zext_ln98_fu_138_p1;
wire    ap_block_pp0_stage0;
reg   [31:0] mem_Addr_A_orig;
wire  signed [7:0] sext_ln169_fu_153_p1;
wire  signed [7:0] sext_ln169_1_fu_157_p1;
wire   [7:0] add_ln1307_fu_161_p2;
wire  signed [8:0] sext_ln169_2_fu_167_p1;
wire  signed [8:0] sext_ln169_3_fu_171_p1;
wire   [8:0] add_ln1307_1_fu_175_p2;
wire  signed [9:0] sext_ln654_fu_181_p1;
wire    ap_CS_fsm_state5;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        empty_7_reg_113 <= trunc_ln135_1_fu_128_p1;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln102_reg_211 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_7_reg_113 <= trunc_ln135_2_fu_149_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        empty_reg_104 <= trunc_ln135_fu_124_p1;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln102_reg_211 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_reg_104 <= empty_7_reg_113;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_reg_81 <= 8'd2;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln102_fu_132_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_81 <= add_ln102_fu_143_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        sum_reg_92 <= 10'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln102_reg_211 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sum_reg_92 <= add_ln654_fu_185_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln102_reg_211 <= icmp_ln102_fu_132_p2;
    end
end

always @ (*) begin
    if (((icmp_ln102_fu_132_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        mem_Addr_A_orig = zext_ln98_fu_138_p1;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        mem_Addr_A_orig = 64'd0;
    end else begin
        mem_Addr_A_orig = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        mem_EN_A = 1'b1;
    end else begin
        mem_EN_A = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        mem_EN_B = 1'b1;
    end else begin
        mem_EN_B = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln102_fu_143_p2 = (8'd1 + i_reg_81);

assign add_ln1307_1_fu_175_p2 = ($signed(sext_ln169_2_fu_167_p1) + $signed(sext_ln169_3_fu_171_p1));

assign add_ln1307_fu_161_p2 = ($signed(sext_ln169_fu_153_p1) + $signed(sext_ln169_1_fu_157_p1));

assign add_ln654_fu_185_p2 = ($signed(sext_ln654_fu_181_p1) + $signed(sum_reg_92));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_return = sum_reg_92;

assign icmp_ln102_fu_132_p2 = ((i_reg_81 == 8'd128) ? 1'b1 : 1'b0);

assign mem_Addr_A = mem_Addr_A_orig << 32'd0;

assign mem_Addr_B = mem_addr_1_gep_fu_60_p3 << 32'd0;

assign mem_Clk_A = ap_clk;

assign mem_Clk_B = ap_clk;

assign mem_Din_A = 8'd0;

assign mem_Din_B = 8'd0;

assign mem_Rst_A = ap_rst;

assign mem_Rst_B = ap_rst;

assign mem_WEN_A = 1'd0;

assign mem_WEN_B = 1'd0;

assign mem_addr_1_gep_fu_60_p3 = 64'd1;

assign sext_ln169_1_fu_157_p1 = empty_7_reg_113;

assign sext_ln169_2_fu_167_p1 = $signed(add_ln1307_fu_161_p2);

assign sext_ln169_3_fu_171_p1 = $signed(empty_reg_104);

assign sext_ln169_fu_153_p1 = trunc_ln135_2_fu_149_p1;

assign sext_ln654_fu_181_p1 = $signed(add_ln1307_1_fu_175_p2);

assign trunc_ln135_1_fu_128_p1 = mem_Dout_B[6:0];

assign trunc_ln135_2_fu_149_p1 = mem_Dout_A[6:0];

assign trunc_ln135_fu_124_p1 = mem_Dout_A[6:0];

assign zext_ln98_fu_138_p1 = i_reg_81;

endmodule //array_mem_perform_array_mem_perform
