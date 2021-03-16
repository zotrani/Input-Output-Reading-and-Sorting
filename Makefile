# Makefile for Lab12

# Standard compile flags for C
CC       = gcc
CFLAGS =  -O1 -g -Wall -std=c99 -pedantic -lm -lgsl -lgslcblas

#Valgrind 
VALGRIND = valgrind --tool=memcheck --leak-check=yes --track-origins=yes

# Source and Object Files
HW_SOURCE = hw12.c
OBJ = $(patsubst %.c,%.o,$(HW_SOURCE))

#Program Files
HW_PROG = hw12
GENRAND = genRand

#Test Files
GE0 = ge0.txt
GE1 = ge1.txt
GE2 = ge2.txt
GE3 = ge3.txt
GE4 = ge4.txt
GE5 = ge5.txt
GE6 = ge6.txt
GE7 = ge7.txt
GE8 = ge8.txt
GE9 = ge9.txt
GE10 = ge10.txt
GE11 = ge11.txt
GE12 = ge12.txt

#Outputs
RAND = rand.txt
OUT = out.txt
MEM = mem.txt


.SILENT:

.PHONY : all
all: $(HW_PROG) 
	@echo "Data running..."
	$(CC) $(CFLAGS) $(HW_SOURCE) -o $(HW_PROG)
	
.PHONY: test
test: $(HW_PROG)
	@echo "Testing and output is in out.txt"
	@echo "----ge0.txt----" > $(OUT)
	./$(HW_PROG) -i $(GE0) >> $(OUT) 2>&1
	@echo "----ge1.txt----" >> $(OUT)
	./$(HW_PROG) -i $(GE1) >> $(OUT) 2>&1
	@echo "----ge2.txt----" >> $(OUT)
	./$(HW_PROG) -i $(GE2) >> $(OUT) 2>&1
	@echo "----ge3.txt----" >> $(OUT)
	./$(HW_PROG) -i $(GE3) >> $(OUT) 2>&1
	@echo " " >> $(OUT)
	@echo "----ge4.txt----" >> $(OUT)
	- ./$(HW_PROG) -i $(GE4) >> $(OUT) 2>&1
	@echo "----ge5.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE5) >> $(OUT) 2>&1
	@echo "----ge6.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE6) >> $(OUT) 2>&1
	@echo "----ge7.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE7) >> $(OUT) 2>&1
	@echo "----ge8.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE8) >> $(OUT) 2>&1
	@echo "----ge9.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE9) >> $(OUT) 2>&1
	@echo "----ge10.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE10) >> $(OUT) 2>&1
	@echo "----ge11.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE11) >> $(OUT) 2>&1
	@echo "----ge12.txt----" >> $(OUT)
	-./$(HW_PROG) -i $(GE12) >> $(OUT) 2>&1
	cat $(OUT)
.PHONY: mem 
mem : $(HW_PROG)
	@echo "Valgrind test"
	chmod +x $(GENRAND)
	./$(GENRAND) > $(RAND)
	$(VALGRIND) ./$(HW_PROG) -i $(RAND) > $(MEM) 2>&1


.PHONY: help
help:
	@echo "make options: all, test, mem, clean, help"
	
	
clean:
	-rm -f *.o $(HW_PROG) $(OUT) $(MEM) $(RAND)