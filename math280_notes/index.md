# Probability Theory Notes
All notes are from Todd Kemp's *incredible* probability theory lectures.

## $\sigma$-algebra
### Motivation
For a lot of natural probability spaces, having an intuitive probability measure on every possible subset is infeasible. For example, say you want a probability measure on an arbritrary sample space $S$ with the following properties:

- $\mathbb{P}(S) = 1$
- $E \cap F = \empty \implies \mathbb{P}(E \cup F) = \mathbb{P}(E) + \mathbb{P}(F)$
- $\{E_j\}_{j=1}^{\infty}$ where $E_i \cap E_j = \empty$ $\forall i, j$ then, $\mathbb{P}(\bigsqcup_{j=1}^{\infty} E_j) = \sum_{j=1}^\infty \mathbb{P}(E_j)$ 
- If two sets are congruent, (e.g. they have the same legnth), then their probabilities should be the same

Such a measure cannot exist on a very natural probability space such as the $\mathbb{R} \pmod 1$. 

If such a space did exist, then we can construct $\mathbb{R} \pmod 1$ through shifted copies of $\mathbb{Q} \pmod 1$. Then construct a set taking one element from each of those shifted copies of the rationals, call it $\Phi$. Since the rationals are countable, $\mathbb{R} \pmod 1 = \bigsqcup_{r \in \mathbb{Q} \pmod 1} r + \Phi$. But since all $r + \Phi$ are congruent, they should all have the same probability. But there's also a countable number of $r + \Phi$'s. So the measure of $r+\Phi$ can either be $0$ or $\infty$ meaning the measure of $\mathbb{R} \pmod 1$ cannot equal $1$.

And that's why we need $\sigma$-fields! (I will use $\sigma$-algebra and $\sigma$-fields interchangeably). We can't consider *all* possible subsets of our sample space. That leads to weird paradoxes such as the Banach Tarski paradox. We would like to restrict it to just the ones we care about. To make the example above work, we would like to ignore $\Phi$ as a possible set. 

So let's define a $\sigma$-algebra.

__________
### Definition of $\sigma$-algebra
Take $\Omega$ to be the sample space. Then, $\mathcal{F} \subseteq 2^\Omega$ is a $\sigma$-algebra if 
- $\Omega \in \mathcal{F}$
- $\forall E \in \mathcal{F}$,  $E^c \in \mathcal{F}$
- For $\{E_j\}_{j=1}^\infty$, where $E_j \in \mathcal{F}$, $\bigcup_{j=1}^\infty E_j \in \mathcal{F}$
_____________


If instead of a countable union it was a finite union, it would be called an algebra or field instead.

Intersection of $\sigma$-algebras is a $\sigma$-algebra, and the $\sigma$-algebra genererated by a set is the intersection of all $\sigma$-algebras that contain that set.

I.e. $\sigma(\mathcal{E}) = \{\bigcap_i \mathcal{F_i}|\mathcal{E} \subseteq \mathcal{F_i}\}$

One commonly used $\sigma$-algebra is the Borel $\sigma$-algebra.

____
### Definition of Borel $\sigma$-algebra

$\mathcal{B}(X) = \sigma(\text{All open subsets of } X)$
____

For $X = \mathbb{R^d}$, it is generated by the set of all sets $(a, b), [a, b], (a, b], (-\infty, a], [a, \infty), ...$.

One way to check if two $\sigma$-algebras are equivalent is the following.

If $\mathcal{E_1} \subseteq \sigma(\mathcal{E_2})$ and $\mathcal{E_2} \subseteq \sigma(\mathcal{E_1})$, then $\sigma(\mathcal{E_1}) = \sigma(\mathcal{E_2})$.


## Meaures

These are the functions used to define probabilities most commonly. More generally the definition is as follows.