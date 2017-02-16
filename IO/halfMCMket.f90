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
    CASE( 18)
      j(   9) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO4 -> HO2 + NO2
    CASE( 19)
      j(  10) = seval(n,theta,tmp,tmp2,b,c,d) ! HNO4 -> OH + NO3
    CASE( 22)
      j(1001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H + HCO
    CASE( 23)
      j(1002) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2O -> H2 + CO
    CASE( 24)
      j(1003) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHO -> CH3 + HCO
    CASE( 26)
      j(1004) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CHO -> CH3CO + H
    CASE( 27)
      j(1005) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5CHO -> C2H5 + HCO
    CASE(130)
      j(1006) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7CHO -> n-C3H7 + CHO
    CASE(131)
      j(1007) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C3H7CHO -> C2H4 + CH2CHOH
    CASE(139)
      j(1008) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C4H9CHO -> C4H9 +  CHO
    CASE(140)
      j(1009) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C4H9CHO -> CH3CH=CH2 +  CH2=CHOH
    CASE(141)
      j(1010) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C4H9CHO -> 2-methylcyclobutanol
    CASE(158)
      j(1011) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C5H11CHO -> C5H11 + CHO
    CASE(159)
      j(1012) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C5H11CHO -> C2H5CH=CH2 + CH2=CHOH
    CASE(160)
      j(1013) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C5H11CHO -> 2-ethylcyclobutanol
    CASE(166)
      j(1014) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C6H13CHO -> C6H13 + CHO
    CASE(167)
      j(1015) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C6H13CHO -> C3H7CH=CH2 + CH2=CHOH
    CASE(168)
      j(1016) = seval(n,theta,tmp,tmp2,b,c,d) ! n-C6H13CHO -> 2-propylcyclobutanol
    CASE(218)
      j(1017) = seval(n,theta,tmp,tmp2,b,c,d) ! nALD -> products
    CASE(136)
      j(1018) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C3H7CHO -> i-C3H7 + CHO
    CASE(147)
      j(1019) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C4H9CHO -> C4H9 + CHO
    CASE(148)
      j(1020) = seval(n,theta,tmp,tmp2,b,c,d) ! i-C4H9CHO -> CH3CH=CH2 + CH2=CHOH
    CASE(149)
      j(1021) = seval(n,theta,tmp,tmp2,b,c,d) ! sec-C4H9CHO -> C4H9 + CHO
    CASE(150)
      j(1022) = seval(n,theta,tmp,tmp2,b,c,d) ! sec-C4H9CHO  -> CH3CH=CHOH + CH2=CH2
    CASE(151)
      j(1023) = seval(n,theta,tmp,tmp2,b,c,d) ! t-C4H9CHO -> C4H9 + CHO
    CASE(182)
      j(1024) = seval(n,theta,tmp,tmp2,b,c,d) ! C4H9CH(C2H5)CHO -> C7H15 + CHO
    CASE(183)
      j(1025) = seval(n,theta,tmp,tmp2,b,c,d) ! C4H9CH(C2H5)CHO -> C7H16 + CO
    CASE(221)
      j(1026) = seval(n,theta,tmp,tmp2,b,c,d) ! MeALD -> NI products
    CASE(222)
      j(1027) = seval(n,theta,tmp,tmp2,b,c,d) ! MeALD -> NII products
    CASE(184)
      j(1028) = seval(n,theta,tmp,tmp2,b,c,d) ! AlkALD -> NI products
    CASE(185)
      j(1029) = seval(n,theta,tmp,tmp2,b,c,d) ! AlkALD -> NII products
    CASE(152)
      j(1030) = seval(n,theta,tmp,tmp2,b,c,d) ! tALD -> NI products
    CASE(153)
      j(1031) = seval(n,theta,tmp,tmp2,b,c,d) ! tALD -> NII products
    CASE( 48)
      j(1032) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=CHCHO -> CH2=CH + CHO
    CASE( 49)
      j(1033) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=CHCHO -> CH2=CH2 + CO
    CASE( 51)
      j(1034) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=CHCHO -> CH2=CHCO + H
    CASE(176)
      j(1035) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=CHCHO -> CH3CH=CH + CHO
    CASE(177)
      j(1036) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=CHCHO -> CH3CH=CH2 + CO
    CASE(178)
      j(1037) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=CHCHO -> CH3CH=CHCO + H
    CASE(179)
      j(1038) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-hexenal -> 1-pentenyl radical + CHO
    CASE(180)
      j(1039) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-hexenal -> 1-pentene + CO
    CASE(181)
      j(1040) = seval(n,theta,tmp,tmp2,b,c,d) ! 2-hexenal -> C3H7CH=CHCO + H
    CASE(208)
      j(1041) = seval(n,theta,tmp,tmp2,b,c,d) ! hexadienal -> 1-pentenyl radical + CHO
    CASE(209)
      j(1042) = seval(n,theta,tmp,tmp2,b,c,d) ! hexadienal -> 1,3-pentadiene + CO
    CASE(210)
      j(1043) = seval(n,theta,tmp,tmp2,b,c,d) ! hexadienal -> CH3CH=CHCH=CHCO + H
    CASE( 52)
      j(1044) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH2=CCH3 + CHO
    CASE( 53)
      j(1045) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH3CH=CH2 + CO
    CASE( 55)
      j(1046) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C(CH3)CHO -> CH2=C(CH3)CO + H
    CASE(199)
      j(1047) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3C(CH3)=CHCHO -> (CH3)2C=CH + CHO
    CASE(200)
      j(1048) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3C(CH3)=CHCHO -> (CH3)2C=CH2 + CO
    CASE(201)
      j(1049) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3C(CH3)=CHCHO -> (CH3)2C=CHCO + H
    CASE(190)
      j(1050) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C(CH3)CHO -> CH3CH=CCH3 + CHO
    CASE(191)
      j(1051) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C(CH3)CHO -> CH3CH=CHCH3 + CO
    CASE(192)
      j(1052) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C(CH3)CHO -> CH3CH=C(CH3)CO + H
    CASE(230)
      j(1053) = seval(n,theta,tmp,tmp2,b,c,d) ! luALD -> NI products
    CASE(231)
      j(1054) = seval(n,theta,tmp,tmp2,b,c,d) ! luALD -> alkene + CO
    CASE(232)
      j(1055) = seval(n,theta,tmp,tmp2,b,c,d) ! luALD -> acyl + H
    CASE( 60)
      j(1056) = seval(n,theta,tmp,tmp2,b,c,d) ! HOCH2CHO -> CH2OH + HCO
    CASE( 61)
      j(1057) = seval(n,theta,tmp,tmp2,b,c,d) ! HOCH2CHO -> CH3OH + CO
    CASE( 62)
      j(1058) = seval(n,theta,tmp,tmp2,b,c,d) ! HOCH2CHO -> CH2CHO + OH
    CASE(174)
      j(1059) = seval(n,theta,tmp,tmp2,b,c,d) ! Glycidaldehyde -> oxyranyl radical + CHO
    CASE(175)
      j(1060) = seval(n,theta,tmp,tmp2,b,c,d) ! Glycidaldehyde -> oxyrane + CO
    CASE( 28)
      j(1061) = seval(n,theta,tmp,tmp2,b,c,d) ! ALD3OHqy -> R(OH) + HCO
    CASE(132)
      j(1062) = seval(n,theta,tmp,tmp2,b,c,d) ! ALD4OHqy -> NI products
    CASE(133)
      j(1063) = seval(n,theta,tmp,tmp2,b,c,d) ! ALD4OHqy -> NII products
    CASE(142)
      j(1064) = seval(n,theta,tmp,tmp2,b,c,d) ! C5nALDOHqy -> NI products
    CASE(143)
      j(1065) = seval(n,theta,tmp,tmp2,b,c,d) ! C5nALDOHqy -> NII products
    CASE(161)
      j(1066) = seval(n,theta,tmp,tmp2,b,c,d) ! C6nALDOHqy -> NI products
    CASE(162)
      j(1067) = seval(n,theta,tmp,tmp2,b,c,d) ! C6nALDOHqy -> NII products
    CASE(169)
      j(1068) = seval(n,theta,tmp,tmp2,b,c,d) ! C7nALDOHqy -> NI products
    CASE(170)
      j(1069) = seval(n,theta,tmp,tmp2,b,c,d) ! C7nALDOHqy -> NII products
    CASE(173)
      j(1070) = seval(n,theta,tmp,tmp2,b,c,d) ! C7nALDOHoh -> cycl. product
    CASE(223)
      j(1071) = seval(n,theta,tmp,tmp2,b,c,d) ! MeALDOHqy -> NI products
    CASE(224)
      j(1072) = seval(n,theta,tmp,tmp2,b,c,d) ! MeALDOHqy -> NII products
    CASE(186)
      j(1073) = seval(n,theta,tmp,tmp2,b,c,d) ! AlkALDOHqy -> NI products
    CASE(187)
      j(1074) = seval(n,theta,tmp,tmp2,b,c,d) ! AlkALDOHqy -> NII products
    CASE(154)
      j(1075) = seval(n,theta,tmp,tmp2,b,c,d) ! tALDOHqy -> NI products
    CASE(155)
      j(1076) = seval(n,theta,tmp,tmp2,b,c,d) ! tALDOHqy -> NII products
    CASE(233)
      j(1077) = seval(n,theta,tmp,tmp2,b,c,d) ! luALDOHqy -> NI products
    CASE(234)
      j(1078) = seval(n,theta,tmp,tmp2,b,c,d) ! luALDOHqy -> alkene + CO
    CASE(235)
      j(1079) = seval(n,theta,tmp,tmp2,b,c,d) ! luALDOHqy -> acyl + H
    CASE(211)
      j(1080) = seval(n,theta,tmp,tmp2,b,c,d) ! uuALDOHqy -> NI products
    CASE(212)
      j(1081) = seval(n,theta,tmp,tmp2,b,c,d) ! uuALDOHqy -> diene + CO
    CASE(213)
      j(1082) = seval(n,theta,tmp,tmp2,b,c,d) ! uuALDOHqy -> acyl + H
    CASE(193)
      j(1083) = seval(n,theta,tmp,tmp2,b,c,d) ! aMeC4uALDOHqy -> NI products
    CASE(194)
      j(1084) = seval(n,theta,tmp,tmp2,b,c,d) ! aMeC4uALDOHqy -> alkene + CO
    CASE(195)
      j(1085) = seval(n,theta,tmp,tmp2,b,c,d) ! aMeC4uALDOHqy -> acyl + H
    CASE(202)
      j(1086) = seval(n,theta,tmp,tmp2,b,c,d) ! bMeC4uALDOHqy -> NI products
    CASE(203)
      j(1087) = seval(n,theta,tmp,tmp2,b,c,d) ! bMeC4uALDOHqy -> alkene + CO
    CASE(204)
      j(1088) = seval(n,theta,tmp,tmp2,b,c,d) ! bMeC4uALDOHqy -> acyl + H
    CASE(227)
      j(1089) = seval(n,theta,tmp,tmp2,b,c,d) ! cALD -> NI products
    CASE(228)
      j(1090) = seval(n,theta,tmp,tmp2,b,c,d) ! cALDOHqy -> NI products
    CASE( 63)
      j(2001) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CH3CO + CH3
    CASE( 64)
      j(2002) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH3 -> CO + 2 CH3
    CASE( 65)
      j(2003) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH2CH3 -> CH3CO + CH2CH3
    CASE(241)
      j(2004) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COCH3 -> CH3CO + C3H7
    CASE(243)
      j(2005) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COCH3 -> C3H7 + CO + CH3
    CASE(244)
      j(2006) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COCH3 -> CH3C(OH)=CH2 + CH2=CH2
    CASE(240)
      j(2007) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5COC2H5 -> C2H5CO + C2H5
    CASE(239)
      j(2008) = seval(n,theta,tmp,tmp2,b,c,d) ! C2H5COC2H5 -> 2 C2H5 + CO
    CASE(245)
      j(2009) = seval(n,theta,tmp,tmp2,b,c,d) ! C4H9COCH3 -> CH3CH=CH2 + CH2=C(OH)CH3
    CASE(246)
      j(2010) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C2H5CO + C3H7
    CASE(247)
      j(2011) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C3H7CO + C2H5
    CASE(248)
      j(2012) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C3H7 + CO + C2H5
    CASE(249)
      j(2013) = seval(n,theta,tmp,tmp2,b,c,d) ! C3H7COC2H5 -> C2H5C(OH)=CH2 + CH2=CH2
    CASE(284)
      j(2014) = seval(n,theta,tmp,tmp2,b,c,d) ! lKet -> products
    CASE(284)
      j(2015) = seval(n,theta,tmp,tmp2,b,c,d) ! lKet -> products
    CASE(250)
      j(2016) = seval(n,theta,tmp,tmp2,b,c,d) ! MIPK -> CH3CO + i-C3H7
    CASE(251)
      j(2017) = seval(n,theta,tmp,tmp2,b,c,d) ! MIPK -> i-C3H7CO + CH3
    CASE(254)
      j(2018) = seval(n,theta,tmp,tmp2,b,c,d) ! MIBK -> CH3CO + i-C4H9
    CASE(255)
      j(2019) = seval(n,theta,tmp,tmp2,b,c,d) ! MIBK -> i-C4H9CO + CH3
    CASE(256)
      j(2020) = seval(n,theta,tmp,tmp2,b,c,d) ! MIBK -> i-C4H9 + CO + CH3
    CASE(257)
      j(2021) = seval(n,theta,tmp,tmp2,b,c,d) ! MIBK -> CH3C(OH)=CH2 + CH3CH=CH2
    CASE(260)
      j(2022) = seval(n,theta,tmp,tmp2,b,c,d) ! 5-Me-2-hexanone -> CH3CO + CH2CH2CH(CH3)2
    CASE(261)
      j(2023) = seval(n,theta,tmp,tmp2,b,c,d) ! 5-Me-2-hexanone -> (CH3)2CHCH2CH2CO + CH3
    CASE(262)
      j(2024) = seval(n,theta,tmp,tmp2,b,c,d) ! 5-Me-2-hexanone -> CH2CH2CH(CH3)2 + CO + CH3
    CASE(263)
      j(2025) = seval(n,theta,tmp,tmp2,b,c,d) ! 5-Me-2-hexanone -> CH3C(OH)=CH2 + CH2=C(CH3)2
    CASE(258)
      j(2026) = seval(n,theta,tmp,tmp2,b,c,d) ! 4-Me-2-hexanone -> CH3C(OH)=CH2 + 2-butene
    CASE(259)
      j(2027) = seval(n,theta,tmp,tmp2,b,c,d) ! 4-Me-2-hexanone -> CH3C(OH)=CH2 + 1-butene
    CASE(264)
      j(2028) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH(CH3)COCH(CH3)2 -> i-C3H7CO + i-C3H7
    CASE(265)
      j(2029) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH(CH3)COCH(CH3)2 -> 2 i-C3H7 + CO
    CASE(290)
      j(2030) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket -> NI products
    CASE(291)
      j(2031) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket -> NII products
    CASE(266)
      j(2032) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C3H4O -> C2H4 + CO
    CASE(267)
      j(2033) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C3H4O -> further products
    CASE(268)
      j(2034) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C4H6O -> C2H4 + CH2=C=O
    CASE(270)
      j(2035) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C4H6O -> c-C3H6 + CO
    CASE(271)
      j(2036) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C5H8O -> 2 C2H4 + CO
    CASE(272)
      j(2037) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C5H8O -> c-C4H8 + CO
    CASE(273)
      j(2038) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C5H8O -> CH2=CHCH2CH2CHO
    CASE(274)
      j(2039) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C6H10O -> 5-hexenal
    CASE(276)
      j(2040) = seval(n,theta,tmp,tmp2,b,c,d) ! c-C6H10O -> 1-pentene + CO
    CASE(287)
      j(2041) = seval(n,theta,tmp,tmp2,b,c,d) ! cKet -> products
    CASE( 57)
      j(2042) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> CH3 + C2H3CO
    CASE( 58)
      j(2043) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> C2H3 + CH3CO
    CASE( 59)
      j(2044) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH=CH2 -> C3H6 + CO
    CASE(277)
      j(2045) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2COCH=CH2 -> C2H5 + C2H3CO
    CASE(278)
      j(2046) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2COCH=CH2 -> C2H3 + C2H5CO
    CASE(279)
      j(2047) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH2COCH=CH2 -> 1-C4H8 + CO
    CASE(304)
      j(2048) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2=C=O -> CO2 + CO + H2
    CASE(305)
      j(2049) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3CH=C=O -> C2H4 + CO
    CASE( 66)
      j(2050) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2(OH)COCH3 -> CH3CO + CH2(OH)
    CASE( 67)
      j(2051) = seval(n,theta,tmp,tmp2,b,c,d) ! CH2(OH)COCH3 -> CH2(OH)CO + CH3
    CASE(280)
      j(2052) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COC2H4OH -> CH3CO + CH2CH2OH
    CASE(281)
      j(2053) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCH(OH)CH3 -> CH3CO + CH3CHOH
    CASE(283)
      j(2054) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COC(CH3)2OH -> CH3CO + (CH3)2COH
    CASE(285)
      j(2055) = seval(n,theta,tmp,tmp2,b,c,d) ! lKet(OH) -> NI products
    CASE(286)
      j(2056) = seval(n,theta,tmp,tmp2,b,c,d) ! lKet(OH) -> NII products
    CASE(292)
      j(2057) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket(OH) -> NI products
    CASE(293)
      j(2058) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket(OH) -> NII products
    CASE(294)
      j(2059) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket(t-OH) -> NI products
    CASE(295)
      j(2060) = seval(n,theta,tmp,tmp2,b,c,d) ! a-br. Ket(t-OH) -> NII products
    CASE(296)
      j(2061) = seval(n,theta,tmp,tmp2,b,c,d) ! b-br. Ket(OH) -> NI products
    CASE(297)
      j(2062) = seval(n,theta,tmp,tmp2,b,c,d) ! b-br. Ket(OH) -> NII products
    CASE(288)
      j(2063) = seval(n,theta,tmp,tmp2,b,c,d) ! cKet(OH) -> products
    CASE(289)
      j(2064) = seval(n,theta,tmp,tmp2,b,c,d) ! cKet(t-OH) -> products
    CASE(301)
      j(2065) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(t-OH) -> RdCO + ROH
    CASE(302)
      j(2066) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(t-OH) -> ROHCO + Rd
    CASE(303)
      j(2067) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(t-OH) -> alkene + CO
    CASE(298)
      j(2068) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(OH) -> RdCO + ROH
    CASE(299)
      j(2069) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(OH) -> ROHCO + Rd
    CASE(300)
      j(2070) = seval(n,theta,tmp,tmp2,b,c,d) ! uKet(OH) -> alkene + CO
    CASE( 75)
      j(2071) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3CHO + CO2
    CASE( 76)
      j(2072) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3CO + COOH
    CASE( 77)
      j(2073) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3COOH + CO
    CASE( 78)
      j(2074) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCOOH -> CH3CO + CO + OH
    CASE( 56)
      j(  20) = seval(n,theta,tmp,tmp2,b,c,d) ! HPALD -> Products
    CASE( 69)
      j(  31) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> H2 + 2 CO
    CASE( 70)
      j(  32) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> CH2O + CO
    CASE( 68)
      j(  33) = seval(n,theta,tmp,tmp2,b,c,d) ! CHOCHO -> 2 HO2 + 2 CO
    CASE( 71)
      j(  34) = seval(n,theta,tmp,tmp2,b,c,d) ! CH3COCHO -> CH3CO + HCO
    CASE( 72)
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
