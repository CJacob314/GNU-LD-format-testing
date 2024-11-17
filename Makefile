CC = gcc
LD = ld
CFLAGS = -O2 -g3
.PHONY: clean

CRT1=$(shell ${CC} --print-file-name=crt1.o)
CRTi=$(shell ${CC} --print-file-name=crti.o)
LIBC=$(shell ${CC} --print-file-name=libc.so.6)
CRTn=$(shell ${CC} --print-file-name=crtn.o)
LDSO=$(shell ${CC} --print-file-name=ld-linux-x86-64.so.2)

# Can find option for `-b`: `binary` by looking through the output of `objdump -i`
main: main.o
	$(LD) -o $@ $^ $(CRT1) $(CRTi) $(LIBC) $(CRTn) -b binary ./msg.txt --dynamic-linker $(LDSO)

clean:
	rm -f *.o main
