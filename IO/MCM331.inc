  SELECT CASE (jl)
    CASE(  2)
      j(   1) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(1D)
    CASE(  3)
      j(   2) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(3P)
    CASE( 11)
      j(   3) = seval(n,theta,tmp,tmp2,b,c,d) ! H2O2 -> 2 OH
    CASE(  4)
      j(   4) = seval(n,theta,tmp,tmp2,b,c,d) ! NO2 -> NO + O(3P)
    CASE(  5)
      j(   5) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO + O2
    CASE(  6)
      j(   6) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO2 + O(3P)
    CASE( 12)
      j(   7) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO2 -> OH + NO
    CASE( 13)
      j(   8) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO3 -> OH + NO2
    CASE( 15)
      j(  11) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H + HCO
    CASE( 16)
      j(  12) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H2 + CO
    CASE( 17)
      j(  13) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHO -> CH3 + HCO
    CASE( 20)
      j(  14) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5CHO -> C2H5 + HCO
    CASE(  0)
      j(  15) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7CHO -> n-C3H7 + CHO
    CASE(  0)
      j(  16) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7CHO -> C2H4 + CH2CHOH
    CASE(  0)
      j(  17) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C3H7CHO -> i-C3H7 + CHO
    CASE(  0)
      j(  18) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH2=CCH3 + CHO
    CASE(  0)
      j(  19) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH2=C(CH3)CO + H
    CASE( 63)
      j(  20) = seval(n,theta,tmp,tmp2,b,c,d) ! HPALD -> Products
    CASE( 25)
      j(  21) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CH3CO + CH3
    CASE(  0)
      j(  22) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH2CH3 -> CH3CO + CH2CH3
    CASE(  0)
      j(  23) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> C3H6 + CO
    CASE(  0)
      j(  24) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> C2H3 + CH3CO
    CASE(  0)
      j(  31) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> H2 + 2 CO
    CASE( 23)
      j(  32) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> CH2O + CO
    CASE(  0)
      j(  33) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> 2 HO2 + 2 CO
    CASE( 24)
      j(  34) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHO -> CH3CO + HCO
    CASE( 60)
      j(  35) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOCH3 -> Products
    CASE( 26)
      j(  41) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3OOH -> CH3O + OH
    CASE( 27)
      j(  51) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3ONO2 -> CH3O + NO2
    CASE(  0)
      j(  52) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5ONO2 -> C2H5O + NO2
      j(  52) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5ONO2 -> C2H5O + NO2
    CASE(  0)
      j(  53) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7ONO2 -> C3H7O + NO2
    CASE( 95)
      j(  55) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-C4H9ONO2 -> 2-C4H9O + NO2
    CASE( 68)
      j(  56) = seval(n,theta,tmp,tmp2,b,c,d)*0.750 ! CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
      j(  57) = seval(n,theta,tmp,tmp2,b,c,d)*0.250 ! CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
  END SELECT
