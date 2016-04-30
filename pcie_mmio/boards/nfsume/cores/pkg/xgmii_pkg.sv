package xgmii_pkg;

	parameter XGMII_IDLE  = 8'h07;
	parameter XGMII_START = 8'hfb;
	parameter XGMII_TERM  = 8'hfd;
	parameter XGMII_ERROR = 8'hfe;

	// control
	typedef enum bit { data, ctrl } xgmii_ctrl_opc;
	typedef xgmii_ctrl_opc [7:0] xgmii_ctrl_t;

	// data
	//typedef enum [7:0] { idle      = XGMII_IDLE,
	//                     start     = XGMII_START,
	//                     terminate = XGMII_TERM,
	//                     error     = XGMII_ERROR } xgmii_data_opc;
	//typedef xgmii_data_opc [7:0] xgmii_data_t;
	typedef bit [7:0][7:0] xgmii_data_t;

	typedef struct packed {
		xgmii_ctrl_t ctrl;
		xgmii_data_t data;
	} xgmii_t;

endpackage :xgmii_pkg
