SHELL=/bin/sh
CC = gcc
# directories
SRCDIR = src
ODIR = build
BINDIR = bin
# targets
SRC_FILES = $(wildcard $(SRCDIR)/*.c)
OBJ_FILES = $(patsubst $(SRCDIR)/%.c,$(ODIR)/%.o, $(SRC_FILES))
.PHONY: all clean

all: directories target
# output files
$(ODIR)/%.o: $(SRCDIR)/%.c | directories
	$(info "Compile target")
	$(CC) -c -o $@ $<

# Link into binary
target: $(OBJ_FILES)
	$(info "Binary target")
	$(CC) -o $(BINDIR)/shell $(OBJ_FILES)

# Create directories
directories:
	$(info "directories target")
	mkdir -p $(ODIR)
	mkdir -p $(BINDIR)
clean:
	echo Clean target
	rm -f $(OBJ)


