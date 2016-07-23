# Pesto
Controller for Basil viewer.

Pesto is started first and manages the multiple, interconnected programs
that create the view displayed by the [Basil viewer].

A person starts Pesto, authenticates, and then specifies the world
to view and how to view. Pesto then keeps  the common 
authentication, credentials, and configuration that is shared between
all the parts of the virtual world experience.

Pesto is implemented as a [NodeJS] application so it can provide a
very dynamic and interactive interface to the user. The NodeJS messaging,
though, is not to be used for the communication between the view components.
All that communication is through the Thrift interfaces. Pesto thus
has two interfaces: the HTTP/NodeJS interface to the user and the Thrift
interface to all the view components.

The eventual dream is to have Pesto be a person's presence -- a program
that is always running and keeping one's presence in the virtual world
or whatever medium one is connected to. The [Basil viewer] creates a
view into a world but one can be there without looking at the world.

[Basil viewer]: http://misterblue.github.io/basil/
[Ragu]: http://misterblue.github.io/ragu/


