/* internal packet buffer format (pb)
 *
 * 0                           16b
 * +----------------------------+
 * |           Length           |
 * +-------------+--------------+
 * |     Type    |   reserved   |
 * +-------------+--------------+
 * |   TS Type   |    TS Id     |
 * +-------------+--------------+
 * |                            |
 * |         Timestamp          |
 * |                            |
 * +----------------------------+
 * |        Packet data         |
 * |            ...             |
 * +----------------------------+
 *
 * data length = PKTBUF_LEN + Frame length
 *
 */

package pbuf_pkg;
	parameter PBUF_LEN = 12;

	typedef struct packed {
		shortint pb_len;
		byte     pb_type;
		byte     pb_flags;
		union packed {
			longint raw;
			struct packed {
				byte ts_type;
				byte ts_id;
				bit [47:0] ts_val;
			} f;
		} ts;
	} pbhdr;

    function pbhdr pb_init (
        input shortint frame_len
    );
        pb_init.pb_len = frame_len + PBUF_LEN;
        pb_init.pb_type = 0;
        pb_init.pb_flags = 0;
        pb_init.ts.raw = 0;
    endfunction :pb_init

endpackage :pbuf_pkg
