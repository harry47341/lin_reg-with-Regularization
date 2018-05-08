function [rand]=get_rand_rows(X,num)
  m=size(X)(1);
  indices=randperm(m,num);
  rand=X(indices,:);
endfunction
