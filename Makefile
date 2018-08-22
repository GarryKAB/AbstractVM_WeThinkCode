CFLAGS=-std=c++11 -Wall -Wextra -Werror

all: avm

avm: VirtualMachine.class.o Exceptions.class.o Process.class.o Stack.class.o main.o
	$(CXX) $(CFLAGS) VirtualMachine.class.o Exceptions.class.o Process.class.o Stack.class.o main.o -o avm

main.o: main.cpp
	$(CXX) $(CFLAGS) -c main.cpp

Stack.class.o: includes/Stack.class.hpp Stack.class.cpp
	$(CXX) $(CFLAGS) -c Stack.class.cpp

Process.class.o: includes/Process.class.hpp Process.class.cpp
	$(CXX) $(CFLAGS) -c Process.class.cpp

Exceptions.class.o: includes/Exceptions.class.hpp Exceptions.class.cpp
	$(CXX) $(CFLAGS) -c Exceptions.class.cpp

VirtualMachine.class.o: includes/VirtualMachine.class.hpp VirtualMachine.class.cpp
	$(CXX) $(CFLAGS) -c VirtualMachine.class.cpp

clean:
	rm -f *.o avm

re: clean all
