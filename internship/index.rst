.. image:: img/iconfinder-logo-full.png

.. class:: text-center

**Simply the largest collection of premium icons in the world.**


----

About
#####

.. class:: text-center

Working from the lovely city of Copenhagen, Denmark, we are building the world's most popular icon site. A small team fueled by large amounts of caffeinated beverages.

.. image:: img/iconfinder-team.png

----

Iconfinder in numbers
#####################

.. image:: img/dilbert-pie.png

----

Iconfinder in numbers
#####################

Bla bla bla

----

Tools of the trade
##################

Main codebase:
    Django (Python)

Others:
    Go, NodeJS (Javascript), Java, C++, Bash

Database:
    PostgreSQL

Revision control:
    Git (DVCS)

Configuration management:
    Puppet

----

Architecture and workflow
#########################

Bla bla

http://blog.iconfinder.com/staying-sane-while-defying-joel-spolsky-with-django/

----

Code Sample
###########

Landslide supports code snippets

.. code-block:: python

    def log(self, message, level='notice'):
        if self.logger and not callable(self.logger):
            raise ValueError(u"Invalid logger set, must be a callable")

        if self.verbose and self.logger:
            self.logger(message, level)
