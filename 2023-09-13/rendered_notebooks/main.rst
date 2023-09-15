Let’s walk through some basics of this SageMath-extended Jupyter
notebook.

Jupyter notebooks consist of cells, which may contain python code or
text. Code cell can be executed and execution results are displayed
below it. Text cell can use embedded :math:`\LaTeX` typesetting.

Python can work on numbers of arbitrary length.

SageMath is a mathematics software system extending python with
additional utilities. SageMath notebooks can be easily ran locally or
using services such as CoCalc (like this instance)

.. code:: ipython3

    a = 5 # assignment
    b = 2 ** 65 # two to the power of 65, a number outside of what computer CPUs usually handle
    a # a single final line with no assignment only will display its value




.. parsed-literal::

    5



.. code:: ipython3

    print(f"The value of a is {a}, which has {len(str(a))} decimal digits. Is it a prime number? a.is_prime() == {a.is_prime()}")
    print(f"The value of b is {b}, which has {b.ndigits()} decimal digits. Is it b prime number? b.is_prime() == {b.is_prime()}")


.. parsed-literal::

    The value of a is 5, which has 1 decimal digits. Is it a prime number? a.is_prime() == True
    The value of b is 36893488147419103232, which has 20 decimal digits. Is it b prime number? b.is_prime() == False


Key generation
==============

To generate RSA key pair, we first choose two random prime numbers
:math:`p` and :math:`q` that are similar in size.

.. code:: ipython3

    p = 13
    q = 17

Compute :math:`n = p * q`

.. code:: ipython3

    n = p * q
    n




.. parsed-literal::

    221



Compute least common multiple of :math:`(q-1,p-1)`

.. code:: ipython3

    l = math.lcm(q-1, p-1)
    l




.. parsed-literal::

    48



Choose a number :math:`e\in(1,48)` that is coprime with 48

.. code:: ipython3

    for i in range(2, l):
        if math.gcd(i, 48) == 1:
            print(i)


.. parsed-literal::

    5
    7
    11
    13
    17
    19
    23
    25
    29
    31
    35
    37
    41
    43
    47


Let :math:`e=5`

.. code:: ipython3

    e = 5
    e




.. parsed-literal::

    5



Find :math:`d` such that

:math:`1 \equiv (e*d) \mod l \equiv (5*d) \mod 48`

This can be expressed as calculation of modular multiplicative inverse
of :math:`e` modulo :math:`l`, similarly to how we can calculate regular
multiplicative inverse of :math:`a*x=1` as :math:`x=\frac{1}{a}`.

Computers can quickly calculate this value using extended Euclidean
algorithm.

.. code:: ipython3

    d = inverse_mod(e, l)
    d




.. parsed-literal::

    29



At this point we have concluded key generation.

As a reminder, RSA principle is :math:`(m^e)^d \equiv m \mod n`.

In our example the public (**e**\ ncryption) key is a pair
(:math:`n = 221, e = 5`) and private (**d**\ ecryption) key is pair
(:math:`n = 221, d = 29`).

Encryption and decryption
=========================

Using RSA equation of form :math:`(m^e)^d \equiv m \mod n` lets encrypt
a value of :math:`m=22`.

.. code:: ipython3

    m = 22
    m




.. parsed-literal::

    22



.. code:: ipython3

    m ** e




.. parsed-literal::

    5153632



.. code:: ipython3

    encrypted_m = (m ** e) % n
    encrypted_m




.. parsed-literal::

    133



We can now send public-key encrypted message 133 over insecure channel
to owner of corresponding private key for decryption.

Let’s see how decryption works.

.. code:: ipython3

    encrypted_m ** d




.. parsed-literal::

    39056883657367139614227739052562278609342949109376229274301653



.. code:: ipython3

    decrypted_m = (encrypted_m ** d) % n
    decrypted_m




.. parsed-literal::

    22



Signing and verification
========================

… but wait, there’s more.

Asymmetric cryptography can be used for signing and verification, where
holder of private key signs a message which authenticity can be later
verified using corresponding public key.

Let’s create a signature :math:`s` of the same message :math:`m = 22`
using our private key:

:math:`s \equiv m^d \mod n`

.. code:: ipython3

    m ** d




.. parsed-literal::

    851643319086537701956194499721106030592



.. code:: ipython3

    s = (m ** d) % n
    s




.. parsed-literal::

    3



We would usually distribute message :math:`m` and its signature
:math:`s` publicly.

And now verify signature:

:math:`(m^d)^e \mod n \equiv s^e \mod n`

.. code:: ipython3

    s ** e




.. parsed-literal::

    243



.. code:: ipython3

    (s ** e) % n




.. parsed-literal::

    22





*Reminder to switch sharing to other tab.*
