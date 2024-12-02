CC = cc
CFLAGS = -Wall -Wextra -DDEBUG_TRACE_EXECUTION 

SRCDIR = src
OBJDIR = obj
BINDIR = bin

TARGET = ${BINDIR}/clox

SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCS))

all: $(TARGET)

$(TARGET): $(OBJS)
	mkdir -p $(BINDIR)
	$(CC) $(OBJS) -o $(TARGET)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@
	
clean:
	rm -rf $(OBJDIR) $(BINDIR)
