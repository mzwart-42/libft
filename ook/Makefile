
MODS = hello write

all: $(MODS)

OBJ = source.o

$(OBJ):
	gcc -o $(OBJ) -c source.c

print_hello:
	@echo "hello"

hello: $(OBJ) print_hello
	@:
.PHONY: hello print_hello
