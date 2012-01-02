# sdml

Distance metric is widely used in the machine learning literature. We used to choose a distance metric according to a priori (Euclidean Distance , L1 Distance, etc.) or according to the result of cross validation within small class of functions (e.g. choosing order of polynomial for a kernel). Actually, with priori knowledge of the data, we could learn a more suitable distance metric with (semi-)supervised distance metric learning techniques. sdml is such an R package aims to implement the state-of-the-art algorithms for supervised distance metric learning. These algorithms are commonly used in clustering, classification, and information retrieval problems.

Algorithms planned in the first development stage:

  * Probablistic Global Distance Metric Learning (PGDM)
  * Relevant Component Analysis (RCA)
  * Discriminative Component Analysis (DCA)
  * Local Fisher Discriminant Analysis (LFDA)
  * Neighbourhood Components Analysis (NCA)
  * Large Margin Nearest Neighbor Classifier (LMNN)
  
The algorithms and routines would be adjusted during the dev progress.

Track our development at https://github.com/road2stat/sdml.

