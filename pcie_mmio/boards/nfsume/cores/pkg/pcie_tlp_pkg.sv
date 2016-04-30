/* PCI Express TLP 3DW Header:
 *  |       0       |       1       |       2       |       3       |
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *  |R|FMT|   Type  |R| TC  |   R   |T|E|Atr| R |       Length      |
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *  |           Request ID          |      Tag      |LastBE |FirstBE|
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *  |                           Address                         | R |
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 */

package pcie_tlp_pkg;

	typedef enum bit [1:0] {
		MRd_3DW_NO_DATA = 0,
		MRd_4DW_NO_DATA = 1,
		MWr_3DW_DATA    = 2,
		MWr_4DW_DATA    = 3
	} TLPPacketFormat;

	typedef enum bit [4:0] {
	MEMORY_RW   = 0,
	Cfg0_RW     = 4,
	Cpl         = 10
	} TLPPacketType;

	typedef union packed {
		bit [1:0][63:0] raw;
		struct packed {
			bit             r0;
			TLPPacketFormat format;
			TLPPacketType   pkttype;
			bit             r1;
			bit [ 2:0]      tclass;
			bit [ 3:0]      r2;
			bit             digest;
			bit             poison;
			bit [ 1:0]      attr;
			bit [ 1:0]      r3;
			bit [ 9:0]      length;
			bit [15:0]      reqid;
			bit [ 7:0]      tag;
			bit [ 3:0]      lastbe;
			bit [ 3:0]      firstbe;
			bit [29:0]      addr;
			bit [ 1:0]      r4;
		} hdr;
	} tlp_3dw_header;

	typedef union packed {
		bit [1:0][63:0] raw;
		struct packed {
			bit             r0;
			TLPPacketFormat format;
			TLPPacketType   pkttype;
			bit             r1;
			bit [ 2:0]      tclass;
			bit [ 3:0]      r2;
			bit             digest;
			bit             poison;
			bit [ 1:0]      attr;
			bit [ 1:0]      r3;
			bit [ 9:0]      length;
			bit [15:0]      reqid;
			bit [ 7:0]      tag;
			bit [ 3:0]      lastbe;
			bit [ 3:0]      firstbe;
			bit [61:0]      addr;
			bit [ 1:0]      r4;
		} hdr;
	} tlp_4dw_headr;

	typedef union packed {
		bit [1:0][63:0] raw;
		struct packed {
			bit             r0;
			TLPPacketFormat format;
			TLPPacketType   pkttype;
			bit             r1;
			bit [ 2:0]      tclass;
			bit [ 3:0]      r2;
			bit             digest;
			bit             poison;
			bit [ 1:0]      attr;
			bit [ 1:0]      r3;
			bit [ 9:0]      length;
			bit [15:0]      cplid;
			bit [ 2:0]      status;
			bit             bcm;
			bit [11:0]      bytecount;
			bit [15:0]      reqid;
			bit [ 7:0]      tag;
			bit             r4;
			bit [ 6:0]      loweraddr;
			bit [31:0]      data;
		} hdr;
	} tlp_cpl_header;


endpackage :pcie_tlp_pkg

