all:
	@echo "run make install"
install:
	@install -m 755 src/logbook.sh ~/.local/bin/logbook
