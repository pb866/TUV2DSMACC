  SELECT CASE (j)
    CASE(  2)
      jval(   1) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(1D)
    CASE(  3)
      jval(   2) = seval(n,theta,tmp,tmp2,b,c,d) ! O3 -> O2 + O(3P)
    CASE(  5)
      jval(   3) = seval(n,theta,tmp,tmp2,b,c,d) ! H2O2 -> 2 OH
    CASE(  6)
      jval(   4) = seval(n,theta,tmp,tmp2,b,c,d) ! NO2 -> NO + O(3P)
    CASE(  7)
      jval(   5) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO + O2
    CASE(  8)
      jval(   6) = seval(n,theta,tmp,tmp2,b,c,d) ! NO3 -> NO2 + O(3P)
    CASE( 12)
      jval(   7) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO2 -> OH + NO
    CASE( 13)
      jval(   8) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO3 -> OH + NO2
    CASE( 18)
      jval(   9) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO4 -> HO2 + NO2
    CASE( 19)
      jval(  10) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO4 -> OH + NO3
    CASE( 22)
      jval(1001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H + HCO
    CASE( 23)
      jval(1002) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H2 + CO
    CASE( 24)
      jval(1003) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHO -> CH3 + HCO
    CASE( 26)
      jval(1004) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHO -> CH3CO + H
    CASE( 28)
      jval(1005) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5CHO -> C2H5 + HCO
    CASE(138)
      jval(1006) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7CHO -> n-C3H7 + CHO
    CASE(139)
      jval(1007) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7CHO -> C2H4 + CH2CHOH
    CASE(147)
      jval(1008) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C4H9CHO -> C4H9 +  CHO
    CASE(148)
      jval(1009) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C4H9CHO -> CH3CH=CH2 +  CH2=CHOH
    CASE(149)
      jval(1010) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C4H9CHO -> 2-methylcyclobutanol
    CASE(162)
      jval(1011) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C5H11CHO -> C5H11 + CHO
    CASE(163)
      jval(1012) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C5H11CHO -> C2H5CH=CH2 + CH2=CHOH
    CASE(164)
      jval(1013) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C5H11CHO -> 2-ethylcyclobutanol
    CASE(170)
      jval(1014) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C6H13CHO -> C6H13 + CHO
    CASE(171)
      jval(1015) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C6H13CHO -> C3H7CH=CH2 + CH2=CHOH
    CASE(172)
      jval(1016) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C6H13CHO -> 2-propylcyclobutanol
    CASE(225)
      jval(1017) = seval(n,theta,tmp,tmp2,b,c,d) ! nALD -> products
    CASE(144)
      jval(1018) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C3H7CHO -> i-C3H7 + CHO
    CASE(155)
      jval(1019) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C4H9CHO -> C4H9 + CHO
    CASE(156)
      jval(1020) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C4H9CHO -> CH3CH=CH2 + CH2=CHOH
    CASE(157)
      jval(1021) = seval(n,theta,tmp,tmp2,b,c,d) ! sec-C4H9CHO -> C4H9 + CHO
    CASE(158)
      jval(1022) = seval(n,theta,tmp,tmp2,b,c,d) ! sec-C4H9CHO  -> CH3CH=CHOH + CH2=CH2
    CASE(159)
      jval(1023) = seval(n,theta,tmp,tmp2,b,c,d) ! t-C4H9CHO -> C4H9 + CHO
    CASE(186)
      jval(1024) = seval(n,theta,tmp,tmp2,b,c,d) ! C4H9CH(C2H5)CHO -> C7H15 + CHO
    CASE(187)
      jval(1025) = seval(n,theta,tmp,tmp2,b,c,d) ! C4H9CH(C2H5)CHO -> C7H16 + CO
    CASE(228)
      jval(1026) = seval(n,theta,tmp,tmp2,b,c,d) ! MeALD -> products
    CASE(188)
      jval(1027) = seval(n,theta,tmp,tmp2,b,c,d) ! AlkALD -> products
    CASE( 52)
      jval(1028) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=CHCHO -> CH2=CH + CHO
    CASE( 53)
      jval(1029) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=CHCHO -> CH2=CH2 + CO
    CASE( 55)
      jval(1030) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=CHCHO -> CH2=CHCO + H
    CASE(180)
      jval(1031) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=CHCHO -> CH3CH=CH + CHO
    CASE(181)
      jval(1032) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=CHCHO -> CH3CH=CH2 + CO
    CASE(182)
      jval(1033) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=CHCHO -> CH3CH=CHCO + H
    CASE(183)
      jval(1034) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-hexenal -> 1-pentenyl radical + CHO
    CASE(184)
      jval(1035) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-hexenal -> 1-pentene + CO
    CASE(185)
      jval(1036) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-hexenal -> C3H7CH=CHCO + H
    CASE(213)
      jval(1037) = seval(n,theta,tmp,tmp2,b,c,d) ! hexadienal -> 1-pentenyl radical + CHO
    CASE(214)
      jval(1038) = seval(n,theta,tmp,tmp2,b,c,d) ! hexadienal -> 1,3-pentadiene + CO
    CASE(215)
      jval(1039) = seval(n,theta,tmp,tmp2,b,c,d) ! hexadienal -> CH3CH=CHCH=CHCO + H
    CASE( 56)
      jval(1040) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH2=CCH3 + CHO
    CASE( 57)
      jval(1041) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH3CH=CH2 + CO
    CASE( 59)
      jval(1042) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH2=C(CH3)CO + H
    CASE(202)
      jval(1043) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3C(CH3)=CHCHO -> (CH3)2C=CH + CHO
    CASE(203)
      jval(1044) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3C(CH3)=CHCHO -> (CH3)2C=CH2 + CO
    CASE(204)
      jval(1045) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3C(CH3)=CHCHO -> (CH3)2C=CHCO + H
    CASE(191)
      jval(1046) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C(CH3)CHO -> CH3CH=CCH3 + CHO
    CASE(192)
      jval(1047) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C(CH3)CHO -> CH3CH=CHCH3 + CO
    CASE(193)
      jval(1048) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C(CH3)CHO -> CH3CH=C(CH3)CO + H
    CASE(231)
      jval(1049) = seval(n,theta,tmp,tmp2,b,c,d) ! luALD -> NI products
    CASE(232)
      jval(1050) = seval(n,theta,tmp,tmp2,b,c,d) ! luALD -> alkene + CO
    CASE(233)
      jval(1051) = seval(n,theta,tmp,tmp2,b,c,d) ! luALD -> acyl + H
    CASE( 64)
      jval(1052) = seval(n,theta,tmp,tmp2,b,c,d) ! HOCH2CHO -> CH2OH + HCO
    CASE( 65)
      jval(1053) = seval(n,theta,tmp,tmp2,b,c,d) ! HOCH2CHO -> CH3OH + CO
    CASE( 66)
      jval(1054) = seval(n,theta,tmp,tmp2,b,c,d) ! HOCH2CHO -> CH2CHO + OH
    CASE(178)
      jval(1055) = seval(n,theta,tmp,tmp2,b,c,d) ! Glycidaldehyde -> oxyranyl radical + CHO
    CASE(179)
      jval(1056) = seval(n,theta,tmp,tmp2,b,c,d) ! Glycidaldehyde -> oxyrane + CO
    CASE( 31)
      jval(1057) = seval(n,theta,tmp,tmp2,b,c,d) ! ALD3OHqy -> R(OH) + HCO
    CASE(140)
      jval(1058) = seval(n,theta,tmp,tmp2,b,c,d) ! ALD4OHqy -> NI products
    CASE(141)
      jval(1059) = seval(n,theta,tmp,tmp2,b,c,d) ! ALD4OHqy -> NII products
    CASE(150)
      jval(1060) = seval(n,theta,tmp,tmp2,b,c,d) ! C5nALDOHqy -> NI products
    CASE(151)
      jval(1061) = seval(n,theta,tmp,tmp2,b,c,d) ! C5nALDOHqy -> NII products
    CASE(165)
      jval(1062) = seval(n,theta,tmp,tmp2,b,c,d) ! C6nALDOHqy -> NI products
    CASE(166)
      jval(1063) = seval(n,theta,tmp,tmp2,b,c,d) ! C6nALDOHqy -> NII products
    CASE(173)
      jval(1064) = seval(n,theta,tmp,tmp2,b,c,d) ! C7nALDOHqy -> NI products
    CASE(174)
      jval(1065) = seval(n,theta,tmp,tmp2,b,c,d) ! C7nALDOHqy -> NII products
    CASE(177)
      jval(1066) = seval(n,theta,tmp,tmp2,b,c,d) ! C7nALDOHoh -> cycl. product
    CASE(229)
      jval(1067) = seval(n,theta,tmp,tmp2,b,c,d) ! MeALDOHqy -> products
    CASE(189)
      jval(1068) = seval(n,theta,tmp,tmp2,b,c,d) ! AlkALDOHqy -> products
    CASE(161)
      jval(1069) = seval(n,theta,tmp,tmp2,b,c,d) ! tALDOH -> products
    CASE(234)
      jval(1070) = seval(n,theta,tmp,tmp2,b,c,d) ! luALDOHqy -> NI products
    CASE(235)
      jval(1071) = seval(n,theta,tmp,tmp2,b,c,d) ! luALDOHqy -> alkene + CO
    CASE(236)
      jval(1072) = seval(n,theta,tmp,tmp2,b,c,d) ! luALDOHqy -> acyl + H
    CASE(216)
      jval(1073) = seval(n,theta,tmp,tmp2,b,c,d) ! uuALDOHqy -> NI products
    CASE(217)
      jval(1074) = seval(n,theta,tmp,tmp2,b,c,d) ! uuALDOHqy -> diene + CO
    CASE(218)
      jval(1075) = seval(n,theta,tmp,tmp2,b,c,d) ! uuALDOHqy -> acyl + H
    CASE(194)
      jval(1076) = seval(n,theta,tmp,tmp2,b,c,d) ! aMeC4uALDOHqy -> NI products
    CASE(195)
      jval(1077) = seval(n,theta,tmp,tmp2,b,c,d) ! aMeC4uALDOHqy -> alkene + CO
    CASE(196)
      jval(1078) = seval(n,theta,tmp,tmp2,b,c,d) ! aMeC4uALDOHqy -> acyl + H
    CASE(205)
      jval(1079) = seval(n,theta,tmp,tmp2,b,c,d) ! bMeC4uALDOHqy -> NI products
    CASE(206)
      jval(1080) = seval(n,theta,tmp,tmp2,b,c,d) ! bMeC4uALDOHqy -> alkene + CO
    CASE(207)
      jval(1081) = seval(n,theta,tmp,tmp2,b,c,d) ! bMeC4uALDOHqy -> acyl + H
    CASE( 68)
      jval(2001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CH3CO + CH3
    CASE( 69)
      jval(2002) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CO + 2 CH3
    CASE( 70)
      jval(2003) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH2CH3 -> CH3CO + CH2CH3
    CASE(244)
      jval(2004) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COCH3 -> CH3CO + C3H7
    CASE(246)
      jval(2005) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COCH3 -> C3H7 + CO + CH3
    CASE(247)
      jval(2006) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COCH3 -> CH3C(OH)=CH2 + CH2=CH2
    CASE(243)
      jval(2007) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5COC2H5 -> C2H5CO + C2H5
    CASE(242)
      jval(2008) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5COC2H5 -> 2 C2H5 + CO
    CASE(248)
      jval(2009) = seval(n,theta,tmp,tmp2,b,c,d) ! C4H9COCH3 -> CH3CH=CH2 + CH2=C(OH)CH3
    CASE(249)
      jval(2010) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C2H5CO + C3H7
    CASE(250)
      jval(2011) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C3H7CO + C2H5
    CASE(251)
      jval(2012) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C3H7 + CO + C2H5
    CASE(252)
      jval(2013) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C2H5C(OH)=CH2 + CH2=CH2
    CASE(294)
      jval(2014) = seval(n,theta,tmp,tmp2,b,c,d) ! lcKet -> products
    CASE(253)
      jval(2015) = seval(n,theta,tmp,tmp2,b,c,d) ! MIPK -> CH3CO + i-C3H7
    CASE(254)
      jval(2016) = seval(n,theta,tmp,tmp2,b,c,d) ! MIPK -> i-C3H7CO + CH3
    CASE(257)
      jval(2017) = seval(n,theta,tmp,tmp2,b,c,d) ! MIBK -> products
    CASE(265)
      jval(2018) = seval(n,theta,tmp,tmp2,b,c,d) ! 5-Me-2-hexanone -> products
    CASE(263)
      jval(2019) = seval(n,theta,tmp,tmp2,b,c,d) ! 4-Me-2-hexanone -> CH3C(OH)=CH2 + 2-butene
    CASE(264)
      jval(2020) = seval(n,theta,tmp,tmp2,b,c,d) ! 4-Me-2-hexanone -> CH3C(OH)=CH2 + 1-butene
    CASE(270)
      jval(2021) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH(CH3)COCH(CH3)2 -> products
    CASE(271)
      jval(2022) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C3H4O -> C2H4 + CO
    CASE(272)
      jval(2023) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C3H4O -> further products
    CASE(274)
      jval(2024) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C4H6O -> C2H4 + CH2=C=O
    CASE(276)
      jval(2025) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C4H6O -> c-C3H6 + CO
    CASE(278)
      jval(2026) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C5H8O -> 2 C2H4 + CO
    CASE(279)
      jval(2027) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C5H8O -> c-C4H8 + CO
    CASE(280)
      jval(2028) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C5H8O -> CH2=CHCH2CH2CHO
    CASE(282)
      jval(2029) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C6H10O -> 5-hexenal
    CASE(284)
      jval(2030) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C6H10O -> 1-pentene + CO
    CASE( 61)
      jval(2031) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> CH3 + C2H3CO
    CASE( 62)
      jval(2032) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> C2H3 + CH3CO
    CASE( 63)
      jval(2033) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> C3H6 + CO
    CASE(286)
      jval(2034) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2COCH=CH2 -> C2H5 + C2H3CO
    CASE(287)
      jval(2035) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2COCH=CH2 -> C2H3 + C2H5CO
    CASE(288)
      jval(2036) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2COCH=CH2 -> 1-C4H8 + CO
    CASE(309)
      jval(2037) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C=O -> CO2 + CO + H2
    CASE(310)
      jval(2038) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C=O -> C2H4 + CO
    CASE( 71)
      jval(2039) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2(OH)COCH3 -> CH3CO + CH2(OH)
    CASE( 72)
      jval(2040) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2(OH)COCH3 -> CH2(OH)CO + CH3
    CASE(290)
      jval(2041) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COC2H4OH -> CH3CO + CH2CH2OH
    CASE(291)
      jval(2042) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH(OH)CH3 -> CH3CO + CH3CHOH
    CASE(293)
      jval(2043) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COC(CH3)2OH -> CH3CO + (CH3)2COH
    CASE(295)
      jval(2044) = seval(n,theta,tmp,tmp2,b,c,d) ! lcKet(OH) -> products
    CASE(296)
      jval(2045) = seval(n,theta,tmp,tmp2,b,c,d) ! cKet(t-OH) -> products
    CASE(298)
      jval(2046) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket(OH) -> products
    CASE(299)
      jval(2047) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket(t-OH) -> products
    CASE(300)
      jval(2048) = seval(n,theta,tmp,tmp2,b,c,d) ! b-br. Ket(OH) -> products
    CASE(304)
      jval(2049) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(t-OH) -> RdCO + ROH
    CASE(305)
      jval(2050) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(t-OH) -> ROHCO + Rd
    CASE(306)
      jval(2051) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(t-OH) -> alkene + CO
    CASE(301)
      jval(2052) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(OH) -> RdCO + ROH
    CASE(302)
      jval(2053) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(OH) -> ROHCO + Rd
    CASE(303)
      jval(2054) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(OH) -> alkene + CO
    CASE( 82)
      jval(2055) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3CHO + CO2
    CASE( 83)
      jval(2056) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3CO + COOH
    CASE( 84)
      jval(2057) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3COOH + CO
    CASE( 85)
      jval(2058) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3CO + CO + OH
    CASE( 74)
      jval(3001) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> H2 + 2 CO
    CASE( 75)
      jval(3002) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> CH2O + CO
    CASE( 73)
      jval(3003) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> 2 HO2 + 2 CO
    CASE( 76)
      jval(3004) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHO -> CH3CO + HCO
    CASE( 78)
      jval(3005) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOCH3 -> Products
    CASE(312)
      jval(3006) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCH=CHCHO -> 3H-furan-2-one
    CASE(314)
      jval(3007) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CHCHO -> 5Me-3H-2-furanone
    CASE(315)
      jval(3008) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CHCHO -> CH3 + CHOCH=CHCO
    CASE(316)
      jval(3009) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CHCHO -> CH3COCH=CH2 + CO
    CASE(320)
      jval(3010) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CHCOCH3 -> CH3CO + CH=CHCOCH3
    CASE(319)
      jval(3011) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCH=CHCH=CHCHO -> diformyl cyclobutene
    CASE(145)
      jval(3012) = seval(n,theta,tmp,tmp2,b,c,d) ! pinonaldehyde -> R + CO + HO2
    CASE(146)
      jval(3013) = seval(n,theta,tmp,tmp2,b,c,d) ! caronaldehyde -> R + CO + HO2
    CASE( 35)
      jval(4001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3ONO2 -> CH3O + NO2
    CASE( 39)
      jval(4002) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5ONO2 -> C2H5O + NO2
    CASE( 40)
      jval(4003) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7ONO2 -> C3H7O + NO2
    CASE( 41)
      jval(4004) = seval(n,theta,tmp,tmp2,b,c,d) ! 1-C4H9ONO2 -> 1-C4H9O + NO2
    CASE(321)
      jval(4005) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C5H11ONO2 -> n-C5H11O + NO2
    CASE( 43)
      jval(4006) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHONO2CH3 -> CH3CHOCH3 + NO2
    CASE( 42)
      jval(4007) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-C4H9ONO2 -> 2-C4H9O + NO2
    CASE(322)
      jval(4008) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-C5H11ONO2 -> 2-C5H11O + NO2
    CASE(323)
      jval(4009) = seval(n,theta,tmp,tmp2,b,c,d) ! 3-C5H11ONO2 -> 3-C5H11O + NO2
    CASE(324)
      jval(4010) = seval(n,theta,tmp,tmp2,b,c,d) ! C5H11ONO2 -> C5H11O + NO2
    CASE(326)
      jval(4011) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C4H9ONO2 -> i-C4H9O + NO2
    CASE( 46)
      jval(4012) = seval(n,theta,tmp,tmp2,b,c,d) ! C(CH3)3(ONO2) -> C(CH3)3(O.) + NO2
    CASE(327)
      jval(4013) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C5H11ONO2 -> i-C5H11O + NO2
    CASE(325)
      jval(4014) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C5H11ONO2 -> c-C5H11O + NO2
    CASE( 44)
      jval(4015) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2(OH)CH2(ONO2) -> CH2(OH)CH2(O.) + NO2
    CASE(329)
      jval(4016) = seval(n,theta,tmp,tmp2,b,c,d) ! C1(OH)NO3 -> C1(OH)O + NO2
    CASE(330)
      jval(4017) = seval(n,theta,tmp,tmp2,b,c,d) ! R(OH)NO3 -> R(OH)O + NO2
    CASE(331)
      jval(4018) = seval(n,theta,tmp,tmp2,b,c,d) ! iR(OH)NO3 -> iR(OH)O + NO2
    CASE(332)
      jval(4019) = seval(n,theta,tmp,tmp2,b,c,d) ! tR(OH)NO3 -> tR(OH)O + NO2
    CASE( 38)
      jval(4020) = seval(n,theta,tmp,tmp2,b,c,d) ! ROONO2 -> products
    CASE( 48)
      jval(4021) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CO(OONO2) -> CH3CO(OO) + NO2
    CASE( 49)
      jval(4022) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CO(OONO2) -> CH3CO(O) + NO3
    CASE( 50)
      jval(4023) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2CO(OONO2) -> CH3CH2CO(OO) + NO2
    CASE( 51)
      jval(4024) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2CO(OONO2) -> CH3CH2CO(O) + NO3
    CASE(333)
      jval(4025) = seval(n,theta,tmp,tmp2,b,c,d) ! PAN -> RCO(OO) + NO2
    CASE(334)
      jval(4026) = seval(n,theta,tmp,tmp2,b,c,d) ! PAN -> RCO(O) + NO3
    CASE(335)
      jval(5001) = seval(n,theta,tmp,tmp2,b,c,d)*2.000 ! CH3CH(NO3)CH2NO3 -> CH3CH(NO3)CH2O + NO2
    CASE(337)
      jval(5002) = seval(n,theta,tmp,tmp2,b,c,d)*2.000 ! C2H5CH(NO3)CH2NO3 -> C2H5CH(NO3)CH2O + NO2
    CASE(339)
      jval(5003) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH(NO3)CH(NO3)CH3 -> RO. + NO2
    CASE(344)
      jval(5004) = seval(n,theta,tmp,tmp2,b,c,d)*2.000 ! C6H9-1-CH3-1,2-NO3 -> R1O. + NO2
    CASE(340)
      jval(5005) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2(NO3)CH=CHCH2NO3 -> RO. + NO2
    CASE(341)
      jval(5006) = seval(n,theta,tmp,tmp2,b,c,d)*2.000 ! CH2=CHCH(NO3)CH2NO3 -> C2H3CH(NO3)CH2O + NO2
    CASE(343)
      jval(5007) = seval(n,theta,tmp,tmp2,b,c,d) ! uDINIT -> RO. + NO2
    CASE( 33)
      jval(6001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3OOH -> CH3O + OH
    CASE(346)
      jval(6002) = seval(n,theta,tmp,tmp2,b,c,d) ! (CH3)3COOH -> (CH3)3CO + OH
    CASE( 34)
      jval(6003) = seval(n,theta,tmp,tmp2,b,c,d) ! HOCH2OOH -> HOCH2O. + OH
    CASE( 81)
      jval(6004) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CO(OOH) -> Products
    CASE(352)
      jval(7001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2OO -> HCHO + O(3P)
    CASE(353)
      jval(7002) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHOO -> CH3CHO + O(3P)
    CASE(354)
      jval(7003) = seval(n,theta,tmp,tmp2,b,c,d) ! synCH3CHOO -> CH3CHO + O(3P)
    CASE(355)
      jval(7004) = seval(n,theta,tmp,tmp2,b,c,d) ! antiCH3CHOO -> CH3CHO + O(3P)
    CASE(356)
      jval(7005) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5CHOO -> C2H5CHO + O(3P)
    CASE(357)
      jval(7006) = seval(n,theta,tmp,tmp2,b,c,d) ! (CH3)2COO -> CH3COCH3 + O(3P)
    CASE( 45)
      jval(8001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH2(ONO2) -> CH3COCH2(O.) + NO2
    CASE(347)
      jval(8002) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5COCH2NO3 -> C2H5COCH2O + NO2
    CASE(348)
      jval(8003) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH(NO3)CH3 -> CH3COCH(O.)CH3 + NO2
    CASE(349)
      jval(8004) = seval(n,theta,tmp,tmp2,b,c,d) ! C6H9-2-=O-1-NO3 -> RO. + NO2
    CASE(350)
      jval(8005) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH2CH2CH(OOH)CH3 -> RO. + OH
    CASE(351)
      jval(8006) = seval(n,theta,tmp,tmp2,b,c,d) ! oxohexyl-hydroperoxide -> RO. + OH
    CASE( 27)
      jval(8007) = seval(n,theta,tmp,tmp2,b,c,d) ! genCH3CHO(poly)
    CASE( 29)
      jval(8008) = seval(n,theta,tmp,tmp2,b,c,d) ! genC2H5CHO(poly)
    CASE(240)
      jval(8009) = seval(n,theta,tmp,tmp2,b,c,d) ! genluALD(poly)
    CASE(211)
      jval(8010) = seval(n,theta,tmp,tmp2,b,c,d) ! genbMeuAld(poly)
    CASE(200)
      jval(8011) = seval(n,theta,tmp,tmp2,b,c,d) ! genaMeuAld(poly)
    CASE(222)
      jval(8012) = seval(n,theta,tmp,tmp2,b,c,d) ! genluuALD(poly)
    CASE( 67)
      jval(8013) = seval(n,theta,tmp,tmp2,b,c,d) ! genHOCH2CHO(poly)
    CASE( 30)
      jval(8014) = seval(n,theta,tmp,tmp2,b,c,d) ! genC2H5CHO(OHpoly)
    CASE(241)
      jval(8015) = seval(n,theta,tmp,tmp2,b,c,d) ! genluALD(OHpoly)
    CASE(212)
      jval(8016) = seval(n,theta,tmp,tmp2,b,c,d) ! genbMeuAldOH(poly)
    CASE(201)
      jval(8017) = seval(n,theta,tmp,tmp2,b,c,d) ! genaMeuAldOH(poly)
    CASE(223)
      jval(8018) = seval(n,theta,tmp,tmp2,b,c,d) ! genluuALD(OHpoly)
    CASE(273)
      jval(8019) = seval(n,theta,tmp,tmp2,b,c,d) ! genC3cKet
    CASE(277)
      jval(8020) = seval(n,theta,tmp,tmp2,b,c,d) ! genC4cKet
    CASE(281)
      jval(8021) = seval(n,theta,tmp,tmp2,b,c,d) ! genC5cKet
    CASE(285)
      jval(8022) = seval(n,theta,tmp,tmp2,b,c,d) ! genC6cKet
    CASE(289)
      jval(8023) = seval(n,theta,tmp,tmp2,b,c,d) ! genuKet(poly)
    CASE(311)
      jval(8024) = seval(n,theta,tmp,tmp2,b,c,d) ! genKete(poly)
    CASE(307)
      jval(8025) = seval(n,theta,tmp,tmp2,b,c,d) ! genuKet(OHpoly)
    CASE(308)
      jval(8026) = seval(n,theta,tmp,tmp2,b,c,d) ! genuKet(t-OHpoly)
    CASE( 86)
      jval(8027) = seval(n,theta,tmp,tmp2,b,c,d) ! genPYR(poly)
    CASE( 77)
      jval(8028) = seval(n,theta,tmp,tmp2,b,c,d) ! aDICARak(poly)
    CASE( 79)
      jval(8029) = seval(n,theta,tmp,tmp2,b,c,d) ! aDICARkk(poly)
    CASE(313)
      jval(8030) = seval(n,theta,tmp,tmp2,b,c,d) ! uDICARaa(poly)
    CASE(318)
      jval(8031) = seval(n,theta,tmp,tmp2,b,c,d) ! uDICARak(poly)
    CASE( 60)
      jval(  20) = seval(n,theta,tmp,tmp2,b,c,d) ! HPALD -> Products
  END SELECT
