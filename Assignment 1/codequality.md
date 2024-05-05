### Linter Configuration Changes

We used pylint to assess the quality of the code. The default configuration is however geared towards regular software engineering projects, so we introduced a number of modifications that take the unique characteristics of ML projects into account. 
- Zhang et al. [3] identified 22 code smells common in ML projects. In order to detect these code smells we adopted dslinter, a pylint plugin based on the work of Zhang et al. 
- We added variable names 'x' and 'y' to the list of allowed variable names. x and y are conventional variable names in math, since ML code often incorporates mathematical notations [1] we decided to allow them. 
- ML projects were found to have a higher prevalence of warnings related to the number of arguments than regular software projects due to the use of models that include multiple hyperparameters as hard-coded variables or individual arguments [2]. Despite this difference, ML code was not found to be more complex than regular code bases, we therefore chose to increase the maximum number of allowed arguments and local variables by 5 each. This number was arbritrarily chosen. 
- Pylint gave false positives for keras and tensorflow import statements, which is a known issue [1]. No warnings pertaining to these imports were triggered during the dvc pipeline execution or flake8 code audit, so we included keras and tensorflow in the list of modules for pylint to ignore.

In addition to pylint, we used flake8 to evaluate the code. Reading through dicussion fora such as stackoverflow gave us the impression that flake8 is a popular linter that does not suffer from false positives for import statements to the degree that pylint does. We wished to confirm this for ourselves, which was the primary motivation behind selecting flake8. Flake8 did indeed not raise any warnings regarding keras or tensorflow, unlike pylint. We relaxed the maximum line length allowed by flake8 to 100 characters since this warning was mainly triggered by comments that could not be shortened without compromising their message. The custom maximum line length of 100 was adopted from pylint's configuration. No other modifications were made to the default configuration of flake8.

The code was refactored based on suggestions offered by these linters, now yielding a perfect score when pylint is run and zero warnings when flake8 is run. 

There is currently no linter that automatically increases the number of maximum allowed local variables and arguments upon detecting the use of a ML library such as pytorch or sklearn. Future works could implement such a rule, setting the maximum to a number supported by empirical analysis of existing ML code and literature.

### References

[1] B. Van Oort, L. Cruz, M. Aniche, and A. Van Deursen, “The Prevalence of Code Smells in Machine Learning projects.” Accessed: May 05, 2024. [Online]. Available: https://arxiv.org/pdf/2103.04146

[2] A. J. Simmons, S. Barnett, J. Rivera-Villicana, A. Bajaj, and R. Vasa, “A large-scale comparative analysis of Coding Standard conformance in Open-Source Data Science projects,” Proceedings of the 14th ACM / IEEE International Symposium on Empirical Software Engineering and Measurement (ESEM), Oct. 2020, doi: https://doi.org/10.1145/3382494.3410680.

[3] H. Zhang, L. Cruz, and A. van Deursen, “Code smells for machine learning applications,” Proceedings of the 1st International Conference on AI Engineering: Software Engineering for AI, May 2022, doi: https://doi.org/10.1145/3522664.3528620.
