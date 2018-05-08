function [error_train,error_val]=learningCurve_average(X, y, Xval, yval, lambda)
  num_repeat=50;
  m=size(X)(1);
  error_train = zeros(m, 1);
  error_val   = zeros(m, 1);

  for i=1:m
    for j=1:num_repeat
      %choose i random samples from X and y
     indices=randperm(m,i);
      X_sample=X(indices,:);
      y_sample=y(indices,:);
      
      %choose i random samples from Xval and yval
      indices=randperm(m,i);
      Xval_sample=Xval(indices,:);
      yval_sample=yval(indices,:);
      
      %get error_train and error_val
      theta=trainLinearReg(X_sample,y_sample,lambda);
      error_train(i)+=linearRegCostFunction(X_sample,y_sample,theta,0);
      error_val(i)+=linearRegCostFunction(Xval_sample,yval_sample,theta,0);
      
    endfor
  endfor
  error_train=error_train./num_repeat;
  error_val=error_val./num_repeat;
endfunction
