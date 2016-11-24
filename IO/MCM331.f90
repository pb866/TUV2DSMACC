    IF (jl ==   2) THEN
      j(   1) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(1D)
     ELSEIF (jl ==   3) THEN
      j(   2) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(3P)
     ELSEIF (jl ==  11) THEN
      j(   3) = seval(n,theta,tmp,tmp2,b,c,d) ! H2O2 -> 2 OH
     ELSEIF (jl ==   4) THEN
      j(   4) = seval(n,theta,tmp,tmp2,b,c,d) ! NO2 -> NO + O(3P)
     ELSEIF (jl ==   5) THEN
      j(   5) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO + O2
     ELSEIF (jl ==   6) THEN
      j(   6) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO2 + O(3P)
     ELSEIF (jl ==  12) THEN
      j(   7) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO2 -> OH + NO
     ELSEIF (jl ==  13) THEN
      j(   8) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO3 -> OH + NO2
     ELSEIF (jl ==  15) THEN
      j(  11) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H + HCO
     ELSEIF (jl ==  16) THEN
      j(  12) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H2 + CO
     ELSEIF (jl ==  17) THEN
      j(  13) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHO -> CH3 + HCO
     ELSEIF (jl ==  20) THEN
      j(  14) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5CHO -> C2H5 + HCO
     ELSEIF (jl ==  75) THEN
      j(  15) = seval(n,theta,tmp,tmp2,b,c,d) ! nC3H7CHO -> nC3H7 + HCO
     ELSEIF (jl ==  76) THEN
      j(  16) = seval(n,theta,tmp,tmp2,b,c,d) ! nC3H7CHO -> C2H4 + CH3CHO
     ELSEIF (jl ==  77) THEN
      j(  17) = seval(n,theta,tmp,tmp2,b,c,d) ! iC3H7CHO -> iC3H7 + HCO
     ELSEIF (jl ==  62) THEN
      j(  18) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2C(CH3)CHO -> Products
     ELSEIF (jl ==  62) THEN
      j(  19) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2C(CH3)CHO -> Products
     ELSEIF (jl ==  25) THEN
      j(  21) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CH3CO + CH3
     ELSEIF (jl ==  87) THEN
      j(  22) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COC2H5 -> C2H5 + CH3CO
     ELSEIF (jl ==  61) THEN
      j(  23) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHCH2 -> Products
     ELSEIF (jl ==  61) THEN
      j(  24) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHCH2 -> Products
     ELSEIF (jl ==  21) THEN
      j(  31) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> 2CO + H2
     ELSEIF (jl ==  23) THEN
      j(  32) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> CH2O + CO
     ELSEIF (jl ==  22) THEN
      j(  33) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> HCO + HCO
     ELSEIF (jl ==  24) THEN
      j(  34) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHO -> CH3CO + HCO
     ELSEIF (jl ==  60) THEN
      j(  35) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOCH3 -> Products
     ELSEIF (jl ==  26) THEN
      j(  41) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3OOH -> CH3O + OH
     ELSEIF (jl ==  27) THEN
      j(  51) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3ONO2 -> CH3O + NO2
     ELSEIF (jl ==  64) THEN
      j(  52) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2ONO2 -> CH3CH2O + NO2
     ELSEIF (jl ==  91) THEN
      j(  53) = seval(n,theta,tmp,tmp2,b,c,d) ! nC3H7ONO2 -> nC3H7O + NO2
     ELSEIF (jl ==  64) THEN
      j(  54) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2ONO2 -> CH3CH2O + NO2
     ELSEIF (jl ==  94) THEN
      j(  55) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-C4H9ONO2 -> 2-C4H9O + NO2
     ELSEIF (jl ==  67) THEN
      j(  56) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
    ENDIF
