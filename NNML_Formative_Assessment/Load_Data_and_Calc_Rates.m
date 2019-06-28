disp('Load Actual Results')
load ER_labels.txt;
ERActual=ER_labels;

disp('Load GP Predictions')
load ER_GP_predictions.txt;
ERGP=ER_GP_predictions;
disp('Confusion Matrix for GP Data')
[C_GP,Rate_GP]=confmat(ERGP,ERActual)
TN=C_GP(1,1);
FN=C_GP(2,1);
FP=C_GP(1,2);
TP=C_GP(2,2);
disp('Calculations for GP')
GP_Recall= TP/(TP+FN)
GP_Precision=TP/(TP+FP)
GP_F_Score=2*GP_Recall*GP_Precision/(GP_Recall+GP_Precision)
GP_FP_Rate=FP/(FP+TN)

disp('Load SR Predictions')
load ER_SR_predictions.txt;
ERSR=ER_SR_predictions;
disp('Confusion Matrix for SR Data')
[C_SR,Rate_SR]=confmat(ERSR,ERActual)
TN=C_SR(1,1);
FN=C_SR(2,1);
FP=C_SR(1,2);
TP=C_SR(2,2);
disp('Calculations for SR')
SR_Recall= TP/(TP+FN)
SR_Precision=TP/(TP+FP)
SR_F_Score=2*SR_Recall*SR_Precision/(SR_Recall+SR_Precision)
SR_FP_Rate=FP/(FP+TN)