CC = gcc

# Executables
TOOLS = sha txt_to_bin rsa merkle verify_block

all: $(TOOLS)

sha: sha.c
	$(CC) sha256.c -o sha

txt_to_bin: txt_to_bin.c
	$(CC) txt_to_bin.c -o txt_to_bin

rsa: rsa.c
	$(CC) bigrsa.c biggmp.c -o rsa -lgmp

merkle: merkle.c
	$(CC) merkle.c -o merkle -lssl -lcrypto

verify_block: verify_block.c
	$(CC) verify_block.c -o verify_block -lssl -lcrypto

clean:
	rm -f $(TOOLS)

