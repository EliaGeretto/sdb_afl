export CC=afl-gcc
export CFLAGS=-m32
export AFL_USE_ASAN=1

SDB_MODULE=sdb
ASAN_EXEC=sdb_asan

$(ASAN_EXEC): $(SDB_MODULE)
	cp $(SDB_MODULE)/src/sdb $@

.PHONY: $(SDB_MODULE) clean

$(SDB_MODULE):
	$(MAKE) -C $@

clean:
	$(MAKE) -C $(SDB_MODULE) clean
	rm -f $(ASAN_EXEC) 
