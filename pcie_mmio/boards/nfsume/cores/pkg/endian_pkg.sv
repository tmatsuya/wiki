/* vivado doesn't support streaming operators in always block */
package endian_pkg;
	/* endian_conv64 */
	function [63:0] endian_conv64 (
		input [63:0] a
	);
	begin
		endian_conv64[63:0] = { a[7:0], a[15:8], a[23:16], a[31:24], a[39:32], a[47:40], a[55:48], a[63:56] };
	end
	endfunction

	/* endian_conv48 */
	function [47:0] endian_conv48 (
		input [47:0] a
	);
	begin
		endian_conv48[47:0] = { a[7:0], a[15:8], a[23:16], a[31:24], a[39:32], a[47:40] };
	end
	endfunction

	/* endian_conv32 */
	function [31:0] endian_conv32 (
		input [31:0] a
	);
	begin
		endian_conv32[31:0] = { a[7:0], a[15:8], a[23:16], a[31:24] };
	end
	endfunction

	/* endian_conv16 */
	function [15:0] endian_conv16 (
		input [15:0] a
	);
	begin
		endian_conv16[15:0] = { a[7:0], a[15:8] };
	end
	endfunction

endpackage :endian_pkg

