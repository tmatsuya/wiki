package ip_pkg;
	import ethernet_pkg::*;

	parameter IP_HDR_DEFLEN = 20;
	parameter IP4_PROTO_UDP = 8'h11;

	/* from Linux/include/uapi/linux/ip.h */
	parameter IPVERSION = 4'd4;
	parameter IPDEFTTL = 8'd64;

	/* IP header */
	typedef struct packed {
		bit [3:0] version;
		bit [3:0] ihl;
		bit [7:0] tos;
		bit [15:0] tot_len;
		bit [15:0] id;
		bit [15:0] frag_off;
		bit [7:0] ttl;
		bit [7:0] protocol;
		bit [15:0] check;
		bit [3:0][7:0] saddr;
		bit [3:0][7:0] daddr;
		/* The options start here */
	} iphdr;

	/* ip_checksum0 */
	function [23:0] ip_checksum0 (
		input iphdr ip0
	);
		ip_checksum0 = {8'h0, ip0.version, ip0.ihl, ip0.tos}
		             + {8'h0, ip0.tot_len}
		             + {8'h0, ip0.id}
		             + {8'h0, ip0.frag_off}
		             + {8'h0, ip0.ttl, ip0.protocol}
		             + {8'h0, ip0.check}
		             + {8'h0, ip0.saddr[3], ip0.saddr[2]}
		             + {8'h0, ip0.saddr[1], ip0.saddr[0]}
		             + {8'h0, ip0.daddr[3], ip0.daddr[2]}
		             + {8'h0, ip0.daddr[1], ip0.daddr[0]};
	endfunction :ip_checksum0

	/* ip_checksum1 */
	function [15:0] ip_checksum1 (
		input [23:0] sum
	);
		ip_checksum1 = ~( sum[15:0] + {8'h0, sum[23:16]} );
	endfunction :ip_checksum1

	 /* ip_init */
	function iphdr ip_init (
		input bit [15:0] frame_len
	);
		ip_init.version  = IPVERSION;
		ip_init.ihl      = 4'd5;
		ip_init.tos      = 0;
		ip_init.tot_len  = frame_len - ETH_HDR_LEN - ETH_FCS_LEN;
		ip_init.id       = 0;
		ip_init.frag_off = 0;
		ip_init.ttl      = IPDEFTTL;
		ip_init.protocol = IP4_PROTO_UDP;
		ip_init.check    = 0;
		ip_init.saddr    = {8'd192, 8'd168, 8'd1, 8'd101};
		ip_init.daddr    = {8'd192, 8'd168, 8'd2, 8'd102};
	endfunction :ip_init

endpackage :ip_pkg

