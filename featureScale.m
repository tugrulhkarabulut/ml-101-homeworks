function X_scaled = featureScale(X)
  X_scaled = ( X .- mean(X) ) ./ std(X)
endfunction
