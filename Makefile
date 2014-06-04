CC=g++
ARCH=-arch x86_64

SANDBOX_DIR=/Users/leonnpaiva/Desktop/opencv

INCLUDE_FLAGS=-I$(SANDBOX_DIR)/include

CFLAGS=-c -Wall $(INCLUDE_FLAGS)`pkg-config --cflags opencv`
LDFLAGS= `pkg-config --libs opencv` 



SOURCES=digit.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=digit

all : $(SOURCES) $(EXECUTABLE)

clean :
	rm -f $(OBJECTS) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) Makefile
	$(CC)  $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
