aaa := a,b,c,d,e:
zog :=
 proc(u::list)
  local f,k,ff;
  f := u[1];
  k := u[2];
  ff := f(aaa[1..(k-1)],z);
  [ff,convert(convert(ff,ModifiedMeijerG,z),MeijerG)];
 end:

L:= [
 [AiryAiZeros,1],
 [AiryBi,1],
 [AiryBiZeros,1],
 [AngerJ,2],
 [bernoulli,1],
 [BesselI,2],
 [BesselJ,2],
 [BesselK,2],
 [BesselY,2],
 [Beta,2],
 [ChebyshevT,2],
 [ChebyshevU,2],
 [Chi,1],
 [Ci,1],
 [CylinderD,2],
 [CylinderU,2],
 [CylinderV,2],
 [dilog,1],
 [Ei,1],
 [EllipticCE,1],
 [EllipticCK,1],
 [EllipticCPi,2],
 [EllipticE,1],
 [EllipticF,2],
 [EllipticK,1],
 [EllipticModulus,1],
 [EllipticNome,1],
 [EllipticPi,2],
 [erf,1],
 [erfc,1],
 [erfi,1],
 [euler,1],
 [exp,1],
 [FresnelC,1],
 [Fresnelf,1],
 [Fresnelg,1],
 [FresnelS,1],
 [GAMMA,1],
 [GaussAGM,2],
 [GegenbauerC,3],
 [HankelH1,2],
 [HankelH2,2],
 [harmonic,1],
 [Heaviside,1],
 [HermiteH,2],
 [JacobiP,4],
 [JacobiAM,2],
 [JacobiCN,2],
 [JacobiCD,2],
 [JacobiCS,2],
 [JacobiDN,2],
 [JacobiDC,2],
 [JacobiDS,2],
 [JacobiNC,2],
 [JacobiND,2],
 [JacobiNS,2],
 [JacobiSC,2],
 [JacobiSD,2],
 [JacobiSN,2],
 [JacobiTheta1,2],
 [JacobiTheta2,2],
 [JacobiTheta3,2],
 [JacobiTheta4,2],
 [JacobiZeta,2],
 [KelvinBer,2],
 [KelvinBei,2],
 [KelvinHer,2],
 [KelvinHei,2],
 [KelvinKer,2],
 [KelvinKei,2],
 [KummerM,3],
 [KummerU,3],
 [LaguerreL,2],
 [LegendreP,2],
 [LegendreQ,2],
 [LerchPhi,3],
 [Li,1],
 [lnGAMMA,1],
 [LommelS1,3],
 [LommelS2,3],
 [pochhammer,2],
 [polylog,2],
 [Psi,1],
 [Shi,1],
 [Si,1],
 [Ssi,1],
 [StruveH,2],
 [StruveL,2],
 [LambertW,1],
 [WeberE,2],
 [WeierstrassP,3],
 [WeierstrassPPrime,3],
 [WeierstrassZeta,3],
 [WeierstrassSigma,3],
 [WhittakerM,3],
 [WhittakerW,3],
 [Zeta,1]
]:

for u in L do
 v := zog(u):
 if v[1] = v[2] then
  print(v[1]):
 fi:
od:


 AiryAiZeros(z)
 AiryBiZeros(z)
 bernoulli(z)
 Beta(a, z)
 euler(z)
 GAMMA(z)
 GaussAGM(a, z)
 harmonic(z)
 Heaviside(z)
 LerchPhi(a, b, z)
 Li(z)
 lnGAMMA(z)
 pochhammer(a, z)
 polylog(a, z)
 Psi(z)
 Ssi(z)
 LambertW(z)
 Zeta(z)




 EllipticCPi(a, z)
 EllipticF(a, z)
 EllipticModulus(z)
 EllipticNome(z)
 EllipticPi(a, z)
 JacobiAM(a, z)
 JacobiCN(a, z)
 JacobiCD(a, z)
 JacobiCS(a, z)
 JacobiDN(a, z)
 JacobiDC(a, z)
 JacobiDS(a, z)
 JacobiNC(a, z)
 JacobiND(a, z)
 JacobiNS(a, z)
 JacobiSC(a, z)
 JacobiSD(a, z)
 JacobiSN(a, z)
 JacobiTheta1(a, z)
 JacobiTheta2(a, z)
 JacobiTheta3(a, z)
 JacobiTheta4(a, z)
 JacobiZeta(a, z)
 WeierstrassP(a, b, z)
 WeierstrassPPrime(a, b, z)
 WeierstrassZeta(a, b, z)
 WeierstrassSigma(a, b, z)
