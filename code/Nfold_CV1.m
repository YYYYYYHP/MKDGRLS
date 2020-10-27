clear;
gamma1 = 0.5;
gamma2 = 0.5;
gamma_fp = 0.5; 
nfolds = 10;
iter_max = 10;

% load Fdataset and Parameters settings
load('Fdataset.mat')
lamda_1 = 10;lamda_2 = 10;
beta = 2^-4; gamma = 2^-5;

% % load Cdataset and Parameters settings
% load('Cdataset.mat')
% lamda_1 = 10^-4;lamda_2 = 1;
% beta = 8; gamma = 4;

% % load LRSSL dataset and Parameters settings
% load('LRSSL_dataset.mat')
% nfolds = 5;
% lamda_1 = 10;lamda_2 = 10^-3;
% beta = 32; gamma = 4;


K1_len = size(K1_list,3);
K2_len = size(K2_list,3);


crossval_idx = crossvalind('Kfold',y(:),nfolds);
predict_matrix = zeros(size(y));
for fold = 1:nfolds
    y_train = y;
    test_idx  = find(crossval_idx==fold);
    y_train(test_idx) = 0;
    K1_list(:,:,K1_len+1) = getGipKernel(y_train,gamma1);
    K2_list(:,:,K2_len+1) = getGipKernel(y_train',gamma2);

    [F] = MKDGRLS(K1_list,K2_list,y_train,lamda_1,lamda_2,beta,gamma,iter_max);

    predict_matrix(test_idx) = F(test_idx);

end
[X_aupr,Y_aupr,tpr,aupr_MKDGRLS] = perfcurve(y(:),predict_matrix(:),1, 'xCrit', 'reca', 'yCrit', 'prec');
[X_auc,Y_acu,THRE,auc_MKDGRLS,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(y(:),predict_matrix(:),1);

