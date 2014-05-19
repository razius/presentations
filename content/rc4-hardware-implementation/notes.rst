It is one of the most widely used stream cipher and has been integrated
into a lot of protocols or applications like:
* TLS/SSL
* WEP
* Remote Desktop Protocol
* SSH
* BitTorrent
* Skype

Like all stream ciphers, it encrypts the information bit by bit as it
comes in and has a low complexity making it ideal to implement it in
hardware.

KSA:
    Initializes the internal state and key stream.

PRGA:
    Modifies the internal state and outputs a byte of the key stream.

----

The idea is really simple, we begin by reading the key from one of the
ports of the chip and start initializing the internal state (go through
KSA)

When the chip has finished the KSA phase and is ready to encode data it
will set the logic level of the READY pin to 1.

We can now input data using the DATA_IN port and the chip will XOR it
with the internal key stream and output it via the DATA_OUT port.

----

I'm gonna present now some of the building blocks used to build the
chip, I'll start with the accumulator.

It is used to add a sequence of numbers.

COUNTER EXAMPLE.

When it will overflow (ex: if 8 bit, when reaching 255) the CARRY pin
will be pulled high, on the next clock cycle the internal value will be
reseted to 0 and the CARRY pin will be pulled low again.

----

It is used to store one bit of information (D) when it is clocked.

If we tie multiple flip-flops together we obtain a registry cell (ex to
store 8 bits).

----

The ``k`` register bank will hold the key, to make it easier to
implement I defined a static key and I'm not reading it from the port.

The counter increments continuously on each clock cycle.

We use the accumulator as a counter to count from 0 to 255, it's output
will be ``i``. These values are stored in the ``i`` register bank (
identity permutation).

When the counter overflows (flip-flop?) we move to the next stage.

``j`` is stored in an accumulator.

``t`` is used to swap the values.
