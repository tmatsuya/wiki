package pktgen_pkg;
	parameter PKTGEN_MAGIC = 32'h55e99bbe;

	/* pktgen header */
	typedef struct packed {
		logic [31:0] magic;
		logic [31:0] id;
		logic [63:0] pg_time;
	} pghdr;

	function pghdr pg_init;
		pg_init.magic = PKTGEN_MAGIC;
		pg_init.id = 0;
		pg_init.pg_time = 0;
	endfunction :pg_init

endpackage :pktgen_pkg

