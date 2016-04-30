/* from Linux/include/uapi/linux/udp.h */
package udp_pkg;
	import ethernet_pkg::*;
	import ip_pkg::*;

	/* UDP header */
	typedef struct packed {
		bit [15:0] source;
		bit [15:0] dest;
		bit [15:0] len;
		bit [15:0] check;
	} udphdr;

	/* udp_init */
	function udphdr udp_init (
		input bit [15:0] frame_len
	);
		udp_init.source = 9;
		udp_init.dest   = 9;
		udp_init.len    = frame_len - ETH_HDR_LEN - ETH_FCS_LEN - IP_HDR_DEFLEN;
		udp_init.check  = 0;
	endfunction :udp_init

endpackage :udp_pkg

