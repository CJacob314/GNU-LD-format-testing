CC = gcc
LD = ld
CFLAGS = -c -O2 -g3
.PHONY: clean

# Can find option for `-b`: `binary` by looking through the output of `objdump -i`
main: main.o
	$(LD) -o $@ $^ /usr/lib/crt1.o /usr/lib/crti.o /usr/lib/libc.so.6 /usr/lib/crtn.o -b binary ./msg.txt --dynamic-linker /lib64/ld-linux-x86-64.so.2

main.o: main.c

clean:
	rm -f *.o main
