CC = gcc
CFLAGS = -O2 -fsigned-char
LDFLAGS = -lSDL2_mixer -lSDL2_image -lSDL2_ttf -lmad -lSDL2

SRCDIR = src
SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(SRCS:$(SRCDIR)/%.c=%.o)
TARGET = roswyn

all: clean $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) *.o

.PHONY: all clean
