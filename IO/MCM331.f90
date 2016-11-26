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
    CASE( 75)
      j(  15) = seval(n,theta,tmp,tmp2,b,c,d) ! nC3H7CHO -> nC3H7 + HCO
    CASE( 76)
      j(  16) = seval(n,theta,tmp,tmp2,b,c,d) ! nC3H7CHO -> C2H4 + CH3CHO
    CASE( 77)
      j(  17) = seval(n,theta,tmp,tmp2,b,c,d) ! iC3H7CHO -> iC3H7 + HCO
    CASE( 62)
      j(  18) = seval(n,theta,tmp,tmp2,b,c,d)*0.500 ! CH2C(CH3)CHO -> Products
      j(  19) = seval(n,theta,tmp,tmp2,b,c,d)*0.500 ! CH2C(CH3)CHO -> Products
    CASE(  0)
      j(  20) = seval(n,theta,tmp,tmp2,b,c,d) ! HPALD
    CASE( 25)
      j(  21) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CH3CO + CH3
    CASE( 87)
      j(  22) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COC2H5 -> C2H5 + CH3CO
    CASE( 61)
      j(  23) = seval(n,theta,tmp,tmp2,b,c,d)*0.500 ! CH3COCHCH2 -> Products
      j(  24) = seval(n,theta,tmp,tmp2,b,c,d)*0.500 ! CH3COCHCH2 -> Products
    CASE( 21)
      j(  31) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> 2CO + H2
    CASE( 23)
      j(  32) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> CH2O + CO
    CASE( 22)
      j(  33) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> HCO + HCO
    CASE( 24)
      j(  34) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHO -> CH3CO + HCO
    CASE( 60)
      j(  35) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOCH3 -> Products
    CASE( 26)
      j(  41) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3OOH -> CH3O + OH
    CASE( 27)
      j(  51) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3ONO2 -> CH3O + NO2
    CASE( 64)
      j(  52) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2ONO2 -> CH3CH2O + NO2
    CASE( 91)
      j(  53) = seval(n,theta,tmp,tmp2,b,c,d) ! nC3H7ONO2 -> nC3H7O + NO2
    CASE( 64)
      j(  54) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2ONO2 -> CH3CH2O + NO2
    CASE( 94)
      j(  55) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-C4H9ONO2 -> 2-C4H9O + NO2
    CASE( 67)
      j(  56) = seval(n,theta,tmp,tmp2,b,c,d)*0.750 ! CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
      j(  57) = seval(n,theta,tmp,tmp2,b,c,d)*0.250 ! CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
  END SELECT
