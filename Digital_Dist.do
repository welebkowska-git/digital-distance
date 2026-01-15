* Panel
encode country_i, gen(exp)
encode country_j, gen(imp)

egen exp_year = group(exp year)
egen imp_year = group(imp year)
egen dyad = group(exp imp)
xtset dyad year

tab exp, gen(exp_)
tab imp, gen(imp_)
tab year, gen(year_)



* Charts

twoway (scatter total_exp infra_dist_pca_norm, mcolor(%20) msize(medium)) (lfit total_exp infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), title("", size(medium)) xtitle("Infra DD", size(medsmall))ytitle("Total Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_hsti infra_dist_pca_norm, mcolor(%20) msize(medium)) (lfit ex_hsti infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), title("", size(medium)) xtitle("Infra DD", size(medsmall))ytitle("HSTI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_msti infra_dist_pca_norm, mcolor(%20) msize(medium)) (lfit ex_msti infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), title("c", size(medium)) xtitle("Infra DD", size(medsmall))ytitle("MSTI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_lsti infra_dist_pca_norm, mcolor(%20) msize(medium)) (lfit ex_lsti infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), title("d", size(medium)) xtitle("Infra DD", size(medsmall))ytitle("LSTI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_liri infra_dist_pca_norm, mcolor(%20) msize(medium)) (lfit ex_liri infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), title("e", size(medium)) xtitle("Infra DD", size(medsmall))ytitle("LIRI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)


* Infra
twoway ///
 (scatter ln_total_exp infra_dist_pca_norm, mcolor(%20) msize(small)) ///
 (qfit ln_total_exp infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), ///
 xtitle("Infra DD", size(medsmall)) ///
 ytitle("ln(Total Exports + 1)", size(medsmall)) ///
 legend(off) graphregion(color(white)) bgcolor(white)

gen ln_ex_hsti = ln(ex_hsti + 1)
twoway ///
 (scatter ln_ex_hsti infra_dist_pca_norm, mcolor(%20) msize(small)) ///
 (qfit ln_ex_hsti infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), ///
 xtitle("Infra DD", size(medsmall)) ///
 ytitle("ln(HSTI Exports + 1)", size(medsmall)) ///
 legend(off) graphregion(color(white)) bgcolor(white)

gen ln_ex_msti = ln(ex_msti + 1)
twoway ///
 (scatter ln_ex_msti infra_dist_pca_norm, mcolor(%20) msize(small)) ///
 (qfit ln_ex_msti infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), ///
 xtitle("Infra DD", size(medsmall)) ///
 ytitle("ln(MSTI Exports + 1)", size(medsmall)) ///
 legend(off) graphregion(color(white)) bgcolor(white)

gen ln_ex_lsti = ln(ex_lsti + 1)
twoway ///
 (scatter ln_ex_lsti infra_dist_pca_norm, mcolor(%20) msize(small)) ///
 (qfit ln_ex_lsti infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), ///
 xtitle("Infra DD", size(medsmall)) ///
 ytitle("ln(LSTI Exports + 1)", size(medsmall)) ///
 legend(off) graphregion(color(white)) bgcolor(white)

gen ln_ex_liri = ln(ex_liri + 1)
twoway ///
 (scatter ln_ex_liri infra_dist_pca_norm, mcolor(%20) msize(small)) ///
 (qfit ln_ex_liri infra_dist_pca_norm, lcolor(navy) lwidth(medthick)), ///
 xtitle("Infra DD", size(medsmall)) ///
 ytitle("ln(LIRI Exports + 1)", size(medsmall)) ///
 legend(off) graphregion(color(white)) bgcolor(white)



* Readiness
twoway (scatter total_exp ready_dist, mcolor(%20) msize(medium)) (lfit total_exp ready_dist, lcolor(navy) lwidth(medthick)), title("a", size(medium)) xtitle("DD ready", size(medsmall))ytitle("Total Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_hsti ready_dist, mcolor(%20) msize(medium)) (lfit ex_hsti ready_dist, lcolor(navy) lwidth(medthick)), title("b", size(medium)) xtitle("DD ready", size(medsmall))ytitle("HSTI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_msti ready_dist, mcolor(%20) msize(medium)) (lfit ex_msti ready_dist, lcolor(navy) lwidth(medthick)), title("c", size(medium)) xtitle("DD ready", size(medsmall))ytitle("MSTI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_lsti ready_dist, mcolor(%20) msize(medium)) (lfit ex_lsti ready_dist, lcolor(navy) lwidth(medthick)), title("d", size(medium)) xtitle("DD ready", size(medsmall))ytitle("LSTI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

twoway (scatter ex_liri ready_dist, mcolor(%20) msize(medium)) (lfit ex_liri ready_dist, lcolor(navy) lwidth(medthick)), title("e", size(medium)) xtitle("DD ready", size(medsmall))ytitle("LIRI Exports", size(medsmall)) legend(off) graphregion(color(white)) bgcolor(white)

* Variables
gen lgdp_i = log(gdp_i)
gen lgdp_j = log(gdp_j)
gen ldist = log(dist)

gen ln_total_exp = log(1 + total_exp)


* Infra distance
summarize infra_dist_pca
gen infra_dist_pca_norm = (infra_dist_pca - r(min)) / (r(max) - r(min))

gen dd_infra2 = infra_dist_pca_norm^2



*******
* Full Sample
*******

******* Linear distance

* Full MRT
asdoc ppmlhdfe total_exp L.infra_dist_pca_norm L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) replace

asdoc ppmlhdfe ex_hsti L.infra_dist_pca_norm L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.infra_dist_pca_norm L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


* Partial MRT
asdoc ppmlhdfe total_exp L.infra_dist_pca_norm L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) 

asdoc ppmlhdfe ex_hsti L.infra_dist_pca_norm L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri  L.infra_dist_pca_norm L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


*** Non-linear Distance

* Full MRT
asdoc ppmlhdfe total_exp L.infra_dist_pca_norm L.dd_infra2 L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) replace

asdoc ppmlhdfe ex_hsti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.infra_dist_pca_norm L.dd_infra2 L.ready_dist, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


* Partial MRT
asdoc ppmlhdfe total_exp L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) 

asdoc ppmlhdfe ex_hsti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j, absorb(year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)



* Turning points, CI
nlcom (-_b[L.infra_dist_pca_norm]) / (2*_b[L.dd_infra2])


*******
* Restricted Sample (High 25% of FTRI)
*******

******* Linear distance

* Full MRT
asdoc ppmlhdfe total_exp L.infra_dist_pca_norm  L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) replace

asdoc ppmlhdfe ex_hsti L.infra_dist_pca_norm  L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm  L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm  L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.infra_dist_pca_norm  L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


* Partial MRT
asdoc ppmlhdfe total_exp L.infra_dist_pca_norm L.ready_dist  L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) 

asdoc ppmlhdfe ex_hsti L.infra_dist_pca_norm L.ready_dist  L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm L.ready_dist  L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm L.ready_dist  L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.infra_dist_pca_norm L.ready_dist  L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


*** Non-linear Distance

* Full MRT
asdoc ppmlhdfe total_exp  L.infra_dist_pca_norm L.dd_infra2 L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) replace

asdoc ppmlhdfe ex_hsti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.infra_dist_pca_norm L.dd_infra2 L.ready_dist if (high_ftri_q75_i == 1), absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


* Partial MRT
asdoc ppmlhdfe total_exp  L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) 

asdoc ppmlhdfe ex_hsti  L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.infra_dist_pca_norm L.dd_infra2 L.ready_dist L.lgdp_i L.lgdp_j if (high_ftri_q75_i == 1), absorb(year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)




*******
* Robustness: Hausman-Taylor
*******
gen ltotal_exp = log(total_exp)
gen lex_hsti = log(ex_hsti)
gen lex_msti = log(ex_msti)
gen lex_lsti = log(ex_lsti)
gen lex_liri = log(ex_liri)

* Full Sample (linear)

* FE: exp, imp, year
asdoc xthtaylor ltotal_exp ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm exp_* imp_* year_*, endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX Total) save(Dist) replace

asdoc xthtaylor lex_hsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX HSTI) save(Dist) 

asdoc xthtaylor lex_msti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX MSTI) save(Dist) 

asdoc xthtaylor lex_lsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX LSTI) save(Dist)

asdoc xthtaylor lex_liri ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX LIRI) save(Dist)

* FE: year
asdoc xthtaylor ltotal_exp ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX Total) save(Dist) 

asdoc xthtaylor lex_hsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX HSTI) save(Dist) 

asdoc xthtaylor lex_msti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX MSTI) save(Dist) 

asdoc xthtaylor lex_lsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX LSTI) save(Dist)

asdoc xthtaylor lex_liri ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm) vce(cluster dyad), nest cnames(EX LIRI) save(Dist)


* Full Sample (non-linear)

* FE: exp, imp, year
asdoc xthtaylor ltotal_exp ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2 exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX Total) save(Dist) replace

asdoc xthtaylor lex_hsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2 exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX HSTI) save(Dist) 

asdoc xthtaylor lex_msti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2 exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX MSTI) save(Dist) 

asdoc xthtaylor lex_lsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2 exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX LSTI) save(Dist)

asdoc xthtaylor lex_liri ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2 exp_* imp_* year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX LIRI) save(Dist)


* FE: year
asdoc xthtaylor ltotal_exp ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX Total) save(Dist) 

asdoc xthtaylor lex_hsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX HSTI) save(Dist) 

asdoc xthtaylor lex_msti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX MSTI) save(Dist) 

asdoc xthtaylor lex_lsti ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX LSTI) save(Dist)

asdoc xthtaylor lex_liri ldist L.lgdp_i L.lgdp_j rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2  year_* , endog( rta L.ready_dist L.infra_dist_pca_norm L.dd_infra2) vce(cluster dyad), nest cnames(EX LIRI) save(Dist)




* R-squared
predict yhat, xb

gen ehat = ltotal_exp - yhat
gen ehat = lex_hsti - yhat
gen ehat = lex_msti - yhat
gen ehat = lex_lsti - yhat
gen ehat = lex_liri - yhat

gen ehat_sq = ehat^2
summ ehat_sq
scalar SSR = r(sum)

egen mean_exp = mean(ltotal_exp)
gen tss_component = (ltotal_exp - mean_exp)^2

egen mean_exp = mean(lex_hsti)
gen tss_component = (lex_hsti - mean_exp)^2

egen mean_exp = mean(lex_msti)
gen tss_component = (lex_msti - mean_exp)^2

egen mean_exp = mean(lex_lsti)
gen tss_component = (lex_lsti - mean_exp)^2

egen mean_exp = mean(lex_liri)
gen tss_component = (lex_liri - mean_exp)^2


summ tss_component
scalar TSS = r(sum)
display "R² (Carrère 2006) = " 1 - (SSR / TSS)
drop yhat ehat ehat_sq mean_exp tss_component







******
* Robustness: Weidner–Zylkin
******
gen double L1_DD_ready  = L.ready_dist
gen double L1_DD_infra  =  L.infra_dist_pca_norm 
gen double L1_DD_infra2 = L.dd_infra2


ppmlhdfe total_exp  L1_DD_ready L1_DD_infra L1_DD_infra2, absorb(exp_year imp_year dyad) cluster(dyad) d 
predict double lambda, mu 
ppml_fe_bias total_exp L1_DD_ready L1_DD_infra L1_DD_infra2, i(exp) j(imp) t(year) lambda(lambda) 

ppmlhdfe ex_hsti L1_DD_ready L1_DD_infra L1_DD_infra2  if year > 2013, absorb(exp_year imp_year dyad) cluster(dyad) d
predict double lambda_h, mu 
ppml_fe_bias ex_hsti L1_DD_ready L1_DD_infra L1_DD_infra2 if year > 2013, i(exp) j(imp) t(year) lambda(lambda_h) 

ppmlhdfe ex_msti  L1_DD_ready L1_DD_infra L1_DD_infra2  if year > 2013, absorb(exp_year imp_year dyad) cluster(dyad) d
predict double lambda_m, mu 
ppml_fe_bias ex_msti L1_DD_ready L1_DD_infra L1_DD_infra2 if year > 2013, i(exp) j(imp) t(year) lambda(lambda_m) 

ppmlhdfe ex_lsti  L1_DD_ready L1_DD_infra L1_DD_infra2  if year > 2013, absorb(exp_year imp_year dyad) cluster(dyad) d
predict double lambda_l, mu 
ppml_fe_bias ex_lsti L1_DD_ready L1_DD_infra L1_DD_infra2 if year > 2013, i(exp) j(imp) t(year) lambda(lambda_l) 

ppmlhdfe ex_liri  L1_DD_ready L1_DD_infra L1_DD_infra2  if year > 2013, absorb(exp_year imp_year dyad) cluster(dyad) d
predict double lambda_i, mu 
ppml_fe_bias ex_liri L1_DD_ready L1_DD_infra L1_DD_infra2 if year > 2013, i(exp) j(imp) t(year) lambda(lambda_i) 


* installation
ssc install ppml_fe_bias, replace



*******
* Robustness: Dummies only
******

* 0) reghdfe up to date
cap which reghdfe
if _rc ssc install reghdfe, replace
else ssc install reghdfe, replace

* 1) DUMMIES-ONLY PPML: exporter-year, importer-year, dyad FE
ppmlhdfe total_exp, absorb(exp_year imp_year dyad) vce(cluster dyad) d
ppmlhdfe ex_hsti, absorb(exp_year imp_year dyad) vce(cluster dyad) d
ppmlhdfe ex_msti, absorb(exp_year imp_year dyad) vce(cluster dyad) d
ppmlhdfe ex_lsti, absorb(exp_year imp_year dyad) vce(cluster dyad) d
ppmlhdfe ex_liri, absorb(exp_year imp_year dyad) vce(cluster dyad) d


* 2) linear predictor (log-mean) including all FE
predict double eta, eta   
predict double eta_h, eta 
predict double eta_m, eta 
predict double eta_l, eta
predict double eta_i, eta

* 3) Decompose eta into the absorbed FE sets using reghdfe
reghdfe eta, absorb(exp_year imp_year dyad) nocons
reghdfe eta_h, absorb(exp_year imp_year dyad) nocons
reghdfe eta_m, absorb(exp_year imp_year dyad) nocons
reghdfe eta_l, absorb(exp_year imp_year dyad) nocons
reghdfe eta_i, absorb(exp_year imp_year dyad) nocons


* 4) MRT part as xb, then back out the dyad component
predict double mrt, xb          // mrt = α_{it} + γ_{jt}  (up to normalization)
gen double tauhat = eta - mrt   // tauhat ≈ δ_{ij}        (bilateral FE up to a constant)

predict double mrt_h, xb  
gen double tauhat_h = eta_h - mrt_h 

predict double mrt_m, xb  
gen double tauhat_m = eta_m - mrt_m

predict double mrt_l, xb  
gen double tauhat_l = eta_l - mrt_l

predict double mrt_i, xb  
gen double tauhat_i = eta_i - mrt_i


asdoc reghdfe tauhat ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(year) vce(cluster dyad)  save(NOVA) replace

asdoc reghdfe tauhat ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(dyad year) vce(cluster dyad)  save(NOVA)
	
	
asdoc reghdfe tauhat_h ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(year) vce(cluster dyad)  save(NOVA1) replace

asdoc reghdfe tauhat_h ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(dyad year) vce(cluster dyad)  save(NOVA1)
	

asdoc reghdfe tauhat_m ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(year) vce(cluster dyad)  save(NOVA1) replace

asdoc reghdfe tauhat_m ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(dyad year) vce(cluster dyad)  save(NOVA1)
	
	
asdoc reghdfe tauhat_l ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(year) vce(cluster dyad)  save(NOVA1) replace

asdoc reghdfe tauhat_l ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(dyad year) vce(cluster dyad)  save(NOVA1)
	
	
asdoc reghdfe tauhat_i ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(year) vce(cluster dyad)  save(NOVA1) replace

asdoc reghdfe tauhat_i ready_dist infra_dist_pca_norm dd_infra2, ///
    absorb(dyad year) vce(cluster dyad)  save(NOVA1)

	
**** 
* Robustness: orthogonalized readiness
****

* Linear infra
reg ready_dist infra_dist_pca_norm 
predict double u_ready_2, resid
gen ready_dist_orth_2 = abs(u_ready_2)

asdoc ppmlhdfe total_exp  L.ready_dist_orth_2 L.infra_dist_pca_norm, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) replace

asdoc ppmlhdfe ex_hsti   L.ready_dist_orth_2 L.infra_dist_pca_norm , absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti  L.ready_dist_orth_2 L.infra_dist_pca_norm, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti  L.ready_dist_orth_2 L.infra_dist_pca_norm , absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri  L.ready_dist_orth_2 L.infra_dist_pca_norm , absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)



asdoc ppmlhdfe total_exp L.lgdp_i L.lgdp_j L.ready_dist_orth_2 L.infra_dist_pca_norm, absorb(year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) 

asdoc ppmlhdfe ex_hsti  L.lgdp_i L.lgdp_j L.ready_dist_orth_2 L.infra_dist_pca_norm, absorb(year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.lgdp_i L.lgdp_j L.ready_dist_orth_2 L.infra_dist_pca_norm, absorb(year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.lgdp_i L.lgdp_j L.ready_dist_orth_2 L.infra_dist_pca_norm, absorb(year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.lgdp_i L.lgdp_j L.ready_dist_orth_2 L.infra_dist_pca_norm, absorb(year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


* Non-linear
reg ready_dist infra_dist_pca_norm dd_infra2
predict double u_ready, resid
gen ready_dist_orth = abs(u_ready)

asdoc ppmlhdfe total_exp  L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) replace

asdoc ppmlhdfe ex_hsti   L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti  L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti  L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri  L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)



asdoc ppmlhdfe total_exp L.lgdp_i L.lgdp_j L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2, absorb(year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) 

asdoc ppmlhdfe ex_hsti L.lgdp_i L.lgdp_j  L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.lgdp_i L.lgdp_j L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.lgdp_i L.lgdp_j L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.lgdp_i L.lgdp_j L.ready_dist_orth L.infra_dist_pca_norm L.dd_infra2 , absorb(year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


*******
* Bottleneck measure
*******

gen bottleneck_infra = min(pca_index_i, pca_index_j)


asdoc ppmlhdfe total_exp  L.ready_dist L.bottleneck_infra, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) replace

asdoc ppmlhdfe ex_hsti   L.ready_dist L.bottleneck_infra, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti  L.ready_dist L.bottleneck_infra, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti  L.ready_dist L.bottleneck_infra, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri  L.ready_dist L.bottleneck_infra, absorb(exp_year imp_year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)


asdoc ppmlhdfe total_exp L.lgdp_i L.lgdp_j L.ready_dist L.bottleneck_infra, absorb(year dyad) cluster(dyad) nest cnames(EX Total) save(Dist) 

asdoc ppmlhdfe ex_hsti  L.lgdp_i L.lgdp_j L.ready_dist L.bottleneck_infra, absorb(year dyad) cluster(dyad) nest cnames(EX HSTI) save(Dist)

asdoc ppmlhdfe ex_msti L.lgdp_i L.lgdp_j L.ready_dist L.bottleneck_infra, absorb(year dyad) cluster(dyad) nest cnames(EX MSTI) save(Dist)

asdoc ppmlhdfe ex_lsti L.lgdp_i L.lgdp_j L.ready_dist L.bottleneck_infra, absorb(year dyad) cluster(dyad) nest cnames(EX LSTI) save(Dist)

asdoc ppmlhdfe ex_liri L.lgdp_i L.lgdp_j L.ready_dist L.bottleneck_infra, absorb(year dyad) cluster(dyad) nest cnames(EX LIRI) save(Dist)

