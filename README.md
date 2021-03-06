# 305372 Compiler Construction

This is a collection of lab exercises and homework assignments for the course
305372 Compiler Construction by [**Suradet Jitprapaikulsarn**][me] at
[**Department of Electrical and Computer Engineering**][nu-ecpe],
[**Faculty of Engineering**][nu-eng], [**Naresuan University**][nu],
Phitsanulok, Thailand (http://www.ecpe.nu.ac.th/suradet/).

The compiler is implemented in an incremental fashion.  It is implemented
backward from the target code generation to the lexical analysis.  Then, the
compiler is enhanced in a forward manner.  I choose this approach because
* it is easier and takes less time to develop the later phases of the compiler
than to develop the earlier phase of the compiler
* it supports the incremental approach vey well.
* it allows the learners to see the whole picture of the compiler in a short
time maner.

The sample codes are implemented in the ObjFPC (Object Pascal, Free Pascal)
dialect of the Pascal programming language.  The rationales behind the decision
are:
* By being unfamiliar to the sample implementation language, the learners may
try to do the exercises by themselves instead of just reading the codes from
the samples.
* The language is quite readable.
* The Free Pascal Compiler (FPC) is available on a lot of platforms.

Note that
- __*All learning materials are dual licensed.*__  For all non-commercial uses,
they are licensed under the [**Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**][cc-by-nc-sa].  For all other uses, please contact me.

    [![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

- __*All source codes are dual licensed.*__  For all non-commercial uses, they
are licensed under the [**GNU Affero General Public License v3.0**][agpl-v3].
For all other uses, please contact me.

    [![agpl-v3][agpl-v3-image]][agpl-v3]


Have fun implementing a compiler.

[me]: http://www.ecpe.nu.ac.th/suradet
[nu-ecpe]: http://www.ecpe.nu.ac.th
[nu-eng]: http://www.eng.nu.ac.th
[nu]: https:/www.nu.ac.th

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

[agpl-v3]: https://www.gnu.org/licenses/agpl-3.0.html
[agpl-v3-image]: https://www.gnu.org/graphics/agplv3-155x51.png