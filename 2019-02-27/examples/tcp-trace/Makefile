demo_srcs = client.c

all: demo

demo: $(demo_srcs)
	$(CC) -o $@ -g $(demo_srcs) $$(pkg-config --cflags --libs libsoup-2.4)

clean:
	rm -f demo
