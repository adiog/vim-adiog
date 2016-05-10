CXX=g++
CFLAGS=-std=c++11 -Wall -pedantic
LDFLAGS=

SRC_DIR=.
SRC_FILES=$(wildcard $(SRC_DIR)/*.cpp)
EXE_FILES=$(SRC_FILES:.cpp=.exe)

%.exe: %.cpp %.hpp
		$(CXX) -I$(INCDIR) $(CFLAGS) $< -o $@

%.hpp:
	

all:	$(EXE_FILES)

clean:
	rm -f *.exe

