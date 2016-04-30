/* vivado doesn't support streaming operators in always block */
package utils_pkg;

	/* 8 bit reverse */
	function byte reverse8 (
		input byte a
	);
	begin
		reverse8 = { a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7] };
	end
	endfunction

	/* 8 bit reverse */
	function byte bit_reverse8 (
		input byte a
	);
		for (int i = 0; i < $bits(a); i++) begin
			bit_reverse8[$bits(a)-i-1] = a[i];
		end
	endfunction

	/* 32 bit reverse */
	function int bit_reverse32 (
		input int a
	);
		for (int i = 0; i < $bits(a); i++) begin
			bit_reverse32[$bits(a)-i-1] = a[i];
		end
	endfunction

	/* 64 bit reverse */
	function longint bit_reverse64 (
		input longint a
	);
		for (int i = 0; i < $bits(a); i++) begin
			bit_reverse64[$bits(a)-i-1] = a[i];
		end
	endfunction

endpackage :utils_pkg

