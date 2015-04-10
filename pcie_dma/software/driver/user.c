#include <stdio.h>
#include <sys/time.h>
#include <sys/types.h>
#include <fcntl.h>
#include "rtdsc.h"

TimeWatcher tw;

#define	DEV_FILE	"/dev/pcietest/0"

int main()
{
	int i, mode, size;
	char buf[256];
	int fd;
	unsigned long long cycles[10], loops;

	if ( ( fd = open( DEV_FILE, O_RDWR ) ) < 0 ) {
		fprintf( stderr, "File can not open\n" );
		return (-1);
	}
	get_cpu_cycle_per_sec();

	i = read( fd, buf, 256 );
	write( 0, buf, i);

	sscanf( buf, "%x,%d,%d,%llu,%llu,%llu", &mode, &size, &loops, &cycles[0], &cycles[1], &cycles[2]);

	printf("CPU Frequency:%lldMHz (%lld cycles/sec)\n", cpu_cycles_per_sec / 1000000LL, cpu_cycles_per_sec);

	printf("PCIe linkmode=%x, length=%d, loops=%d\n", mode, size, loops);
	for (i=0; i<3; ++i) {
		printf("    time:%8d ns, CPU cycles:%llu\n", cycles[i] * 1000000000LL / cpu_cycles_per_sec / loops, cycles[i] / loops);
	}

	close(fd);

	return 0;
}
