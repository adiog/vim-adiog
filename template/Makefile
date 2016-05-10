:insert
CC=gcc
CFLAGS=-Wall -pedantic
LDFLAGS=

SRC_DIR=.
SRC_FILES=$(wildcard $(SRC_DIR)/*.c)
OBJ_FILES=$(SRC_FILES:.c=.o)

%.o: %.c %.h
		$(CC) -I$(INCDIR) $(CFLAGS) -c $< -o $@

%.h:
	

all:	$(OBJ_FILES)

clean:
	rm -f *.o

