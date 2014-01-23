function pass = test_chebfun2_cdr( pref ) 
% Test CDR 

if ( nargin == 0) 
    pref = chebpref; 
end

tol = 1000*pref.cheb2Prefs.eps; 
j = 1; 

f = chebfun2(@(x,y) cos(x.*y)); 
[C, D, R] = cdr( f ); 
pass(j) = norm( f - C * D * R' ) < tol; j = j + 1; 

f = chebfun2(@(x,y) cos(x.*y), [-3 4 -1 10]);
[C, D, R] = cdr( f ); 
pass(j) = norm( f - C * D * R' ) < tol; j = j + 1; 

d = cdr( f ); 
pass(j) = norm( diag( D ) - d(:) ) < tol; j = j + 1; 

end
