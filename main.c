#include <unistd.h>

extern char _binary___msg_txt_start[];
extern char _binary___msg_txt_end[];

int main(void) {
	size_t len = _binary___msg_txt_end - _binary___msg_txt_start;

	write(1, _binary___msg_txt_start, len);
	return 0;
}
