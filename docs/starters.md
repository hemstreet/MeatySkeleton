Starting
=== 

* Printing strings and integer numbers (both decimal and hex) on the screen is certainly a must. This is one of most basic ways of debugging, and virtually all of us have gone through a kprint() or kout in version 0.01.
* Outputting to a serial port will save you a lot of debugging time. You don't have to fear losing information due to scrolling. You will be able to test your OS from a console, filter interesting debug messages, and automatize some tests.
* Having a working and reliable interrupt/exception handling system that can dump the contents of the registers (and perhaps the address of the fault) will be very useful.
* Plan your memory map (virtual, and physical) : decide where you want the data to be
* The heap: allocating memory at runtime (malloc and free) is almost impossible to go without. It should be implemented as soon as possible. 

[What order should I make things in?](https://wiki.osdev.org/What_order_should_I_make_things_in)
