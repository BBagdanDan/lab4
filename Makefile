# Makefile
CC = gcc
CFLAGS = -Wall -g
LDFLAGS =

# ����� �����
LIBRARY = libcalculator.a
EXEC = calculator_app
SRC = main.c calculator.c
OBJ = $(SRC:.c=.o)

# ������� ��� ����� ������������ �����
$(EXEC): $(OBJ) $(LIBRARY)
	$(CC) $(OBJ) -o $(EXEC) $(LDFLAGS)

# ������� ��� ��������� �������� ��������
$(LIBRARY): calculator.o
	ar rcs $(LIBRARY) calculator.o

# ������� ��� ��������� .c �����
%.o: %.c calculator.h
	$(CC) $(CFLAGS) -c $< -o $@

# ������� �����
clean:
	rm -f $(OBJ) $(EXEC) $(LIBRARY)

.PHONY: clean