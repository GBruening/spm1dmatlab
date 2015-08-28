function [SPM] = anova2nested(Y, A, B)

design = spm1d.stats.anova.designs.ANOVA2nested(A, B);
model  = spm1d.stats.anova.LinearModel(Y, design.X);
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMList(SPM);
