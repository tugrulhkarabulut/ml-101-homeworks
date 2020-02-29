function outliers = detectOutlier(X)
   X_std = std(X);
   X_mean = mean(X);
   X_norm = (X - X_mean) ./ X_std;
   outlier_indices = find( X_norm < -3 | X_norm > 3 );
   outliers = X(outlier_indices);
endfunction
