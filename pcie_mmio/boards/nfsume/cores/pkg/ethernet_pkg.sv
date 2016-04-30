package ethernet_pkg;

	/* from linux/if_ether.h */
	parameter ETH_ALEN = 6;
	parameter ETH_FCS_LEN = 16'd4;
	parameter ETH_HDR_LEN = 16'd14;
	parameter ETH_DATA_LEN = 1500;
	parameter ETH_FRAME_LEN = 1514;
	parameter ETH_MIN_LEN = 60 + ETH_FCS_LEN;
	parameter ETH_MAX_LEN = ETH_FRAME_LEN + ETH_FCS_LEN;

	parameter ETH_P_IP = 16'h0800;

	/* Ethernet MAC */
	parameter ETH_SFD = 8'hd5;
	parameter ETH_PREAMBLE = 8'h55;

	/* MAC adderss */
	typedef logic [ETH_ALEN-1:0][7:0] macaddr_t;

	/* ethernet header */
	typedef struct packed {
		macaddr_t h_dest;
		macaddr_t h_source;
		bit [15:0] h_proto;
	} ethhdr;

	/* eth_init */
	function ethhdr eth_init (
		input macaddr_t dst,
		input macaddr_t src,
		input [15:0] ethtype
	);
		eth_init.h_dest   = dst;
		eth_init.h_source = src;
		eth_init.h_proto  = ethtype;
	endfunction :eth_init

endpackage :ethernet_pkg

