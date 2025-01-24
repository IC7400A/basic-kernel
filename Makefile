GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARRAMS = --32
LDPARAMS = -melf_i386
objects = loader.o kernel.o


%.o: %.cc
	g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARRAMS) -o $@ $<

mykernel.bin : linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin

	