# Makefile for libtdsuv

.PHONY: all clean

# Source files for the tdsuv test
SRCS = tds_uv.c
OBJS = tds_uv.o

CC = gcc
INTERNAL_CFLAGS = -Wall -O2 -I/usr/local/include -pthread -I.
CPPFLAGS += -MMD -MP -MT $@
LDFLAGS = -L/usr/local/lib

EXE = tds_uv
LIBS = -luv

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) $(INTERNAL_CFLAGS) -o $(EXE) $(OBJS) $(LDFLAGS) $(LIBS)

clean:
	rm -f $(EXE) $(OBJS)

.c.o:
	$(CC) $(INTERNAL_CFLAGS) $(CPPFLAGS) -o $@ -c $<

# Include automatically generated dependency files
-include $(wildcard *.d)