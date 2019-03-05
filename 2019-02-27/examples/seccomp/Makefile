demo_srcs = runner.c

all: demo

demo: $(demo_srcs)
	$(CC) -o $@ -g $< $$(pkg-config --cflags --libs libseccomp)

clean:
	rm -f demo
