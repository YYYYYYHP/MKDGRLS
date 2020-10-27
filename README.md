Multiple Kernels Dual Graph Regularized Least Squares (MKDGRLS)
=================
> MKDGRLS is one novel computational method, which utilizes Multiple kernels learning and Dual Regularized Least Squares to predict the association between drugs and diseases.
![Image text](http://yhpjc.vip/download/MKDGRLS/mkdgrls_flow.jpg)
1.Code.
>1)Knormalized.m: function implementing normalize kernel;

>2)getGipKernel.m: function implementing Gaussian Interaction Profile kernel;

>3)MKDGRLS.p: predict the association between drugs and diseases;

>4)Nfold_CV1.m:function implementing ten fold cross validation under CV1;

2.Dataset.
>1)Fdataset.mat: including drug-disease association matrix, which contain 1993 associations between 593 drugs and 313 diseases, drug and disease similarity matrices;

>2)Cdataset.mat: including drug-disease association matrix, which contain 2353 associations between 663 drugs and 409 diseases, drug and disease similarity matrices;

>2)LRSSL_dataset.mat: including drug-disease association matrix, which contain 3051 associations between 763 drugs and 468109 diseases, drug and disease similarity matrices;
