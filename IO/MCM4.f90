  SELECT CASE (jl)
    CASE(  2)
      j(   1) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(1D)
    CASE(  3)
      j(   2) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(3P)
    CASE(  5)
      j(   3) = seval(n,theta,tmp,tmp2,b,c,d) ! H2O2 -> 2 OH
    CASE(  6)
      j(   4) = seval(n,theta,tmp,tmp2,b,c,d) ! NO2 -> NO + O(3P)
    CASE(  7)
      j(   5) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO + O2
    CASE(  8)
      j(   6) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO2 + O(3P)
    CASE( 12)
      j(   7) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO2 -> OH + NO
    CASE( 13)
      j(   8) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO3 -> OH + NO2
    CASE( 62)
      j(  21) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CH3CO + CH3
    CASE( 64)
      j(  22) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH2CH3 -> CH3CO + CH2CH3
    CASE( 58)
      j(  23) = seval(n,theta,tmp,tmp2,b,c,d)*0.500 ! CH3COCH=CH2 -> C3H6 + CO
    CASE( 57)
      j(  24) = seval(n,theta,tmp,tmp2,b,c,d)*0.500 ! CH3COCH=CH2 -> C2H3 + CH3CO
    CASE( 68)
      j(  31) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> H2 + 2 CO
    CASE( 69)
      j(  32) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> CH2O + CO
    CASE( 67)
      j(  33) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> 2 HO2 + 2 CO
    CASE( 70)
      j(  34) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHO -> CH3CO + HCO
    CASE( 71)
      j(  35) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOCH3 -> Products
    CASE( 30)
      j(  41) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3OOH -> CH3O + OH
    CASE( 32)
      j(  51) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3ONO2 -> CH3O + NO2
    CASE( 35)
      j(  52) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5ONO2 -> C2H5O + NO2
    CASE( 36)
      j(  53) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7ONO2 -> C3H7O + NO2
    CASE( 39)
      j(  54) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHONO2CH3 -> CH3CHOCH3 + NO2
    CASE( 42)
      j(  55) = seval(n,theta,tmp,tmp2,b,c,d) ! C(CH3)3(ONO2) -> C(CH3)3(O.) + NO2
    CASE( 41)
      j(  56) = seval(n,theta,tmp,tmp2,b,c,d)*0.750 ! CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
  END SELECT
