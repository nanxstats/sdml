# sdml

## Brief Intro

Distance metric is widely used in the machine learning literature. We used to choose a distance metric according to a priori (Euclidean Distance , L1 Distance, etc.) or according to the result of cross validation within small class of functions (e.g. choosing order of polynomial for a kernel). Actually, with priori knowledge of the data, we could learn a more suitable distance metric with (semi-)supervised distance metric learning techniques. sdml is such an R package aims to implement the state-of-the-art algorithms for supervised distance metric learning. These algorithms are commonly used in clustering, classification, and information retrieval problems.

## Algorithms

Algorithms planned in the first development stage:

  * Supervised Global Distance Metric Learning:
  
    * Relevant Component Analysis (RCA)
    * Discriminative Component Analysis (DCA)
    * Global Distance Metric Learning by Convex Programming (GDMLCP)
    * Probablistic Global Distance Metric Learning (PGDM)

  * Supervised Local Distance Metric Learning:

    * Local Fisher Discriminant Analysis (LFDA)
    * Kernel Local Fisher Discriminant Analysis (KLFDA)
    * Localized Distance Metric Learning (LDM)
    * Information-Theoretic Metric Learning (ITML)
    * Neighbourhood Components Analysis (NCA)
    * Large Margin Nearest Neighbor Classifier (LMNN)

The algorithms and routines might be adjusted during developing.

## Links

Track Devel: https://github.com/road2stat/sdml

Report Bugs: https://github.com/road2stat/sdml/issues

## Contact

Contact the authors of this package:

Gao Tao <joegaotao@gmail.com>

Xiao Nan <road2stat@gmail.com>

