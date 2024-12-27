# Makefile
CC = gcc
CFLAGS = -Wall -g
LDFLAGS =

# Імена файлів
LIBRARY = libcalculator.a
EXEC = calculator_app
SRC = main.c calculator.c
OBJ = $(SRC:.c=.o)

# Правило для збірки виконуваного файлу
$(EXEC): $(OBJ) $(LIBRARY)
	$(CC) $(OBJ) -o $(EXEC) $(LDFLAGS)

# Правило для створення статичної бібліотеки
$(LIBRARY): calculator.o
	ar rcs $(LIBRARY) calculator.o

# Правило для компіляції .c файлів
%.o: %.c calculator.h
	$(CC) $(CFLAGS) -c $< -o $@

# Очистка файлів
clean:
	rm -f $(OBJ) $(EXEC) $(LIBRARY)

.PHONY: clean