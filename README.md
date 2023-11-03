# Project Goals
The goal of this project is to create a containerized pipeline for [psychophysiological interaction (PPI)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3375893/) analysis in Nipype (a python package for fMRI analysis). The PPI model is essentially a three-level GLM with a nonlinear interaction coefficient. This pipeline allows us to examine the connectivity between two different networks in the brain during an activity (such as when a person is in flow). 

## Theoretical Background
The Synchronization Theory of Flow offers a neurological perspective of a ‘flow state’. It hypothesizes that that flow occurs when specific attention and reward networks synchronize in the brain. At a neurological level, understanding what flow looks like with a dynamic, real-time measure in the brain has implications for a variety of questions, such as testing the length, depth, and stability of flow episodes across various conditions and types of distractors. 

## Data
- MRI scans of 36 participants while playing a video game designed to induce flow. Participants are assigned to three conditions: flow, frustration, and boredom in random order.
- While they are playing the video game, they are also instructed to respond to a red light probe that appears randomly on their screen. When they see it, they are required click a button with their non-dominant hand. The reaction time to the probe is recorded.
- Data is available at: https://openneuro.org/datasets/ds003358/versions/1.0.0

## Process
There are four overall steps.
1. Preprocess fMRI data
2. Create a metric for 'distraction' from reaction time to the distractor probe. This is then used as a behavioral indicator of when the participant has entered flow
3. Run preprocessed participant data through psychophysiological interaction pipeline
4. Draw conclusions about whether there exists the hypothesized connectivity between neural networks during periods of flow 

## Results
### Distraction
A repeated-measures ANOVA found that the effect of condition (within-subjects factor) was significant for both the distraction (F(2, 68)=15.70, η2G=0.08, p<0.01) and reaction time models (F(2, 68)=3.42, η2G=0.025, p=0.04). However, distraction exhibited greater effect size and significance (η2G=0.08, p<0.01) compared to reaction time (η2G=0.025, p=0.04).

Descriptive statistics show that, across conditions, the mean distraction score from all repeated time points and all subjects follow the direction as predicted (MBoredom=0.66, MFlow=0.59, MFrustration=0.60), in which the mean distraction was lowest for flow compared to boredom and frustration conditions.

To test for significance in the difference between conditions, multiple pairwise paired t-tests were conducted between the levels of conditions using both distraction and reaction time as outcome variables. P-values were adjusted using the FDR correction method. Pairwise differences for distraction were significant between the flow-boredom (df=34, t=6.20, padj<0.01) and boredom-frustration (df=34, t=3.68, padj<0.01) conditions, but not for the flow-frustration condition (df=34, t=-1.63, padj=0.11). Pairwise differences for reaction time were significant between the flow-boredom condition (df=34, t=- 2.58, padj=0.04), but not significant between the boredom-frustration (df=34, t=0.40, padj=0.69) and flow-frustration (df=34, t=2.19, padj=0.05) conditions, although the flow-frustration condition was closer to approaching significance in the reaction time model compared to the distraction model.

### Psychophysiological Interaction Model
The increase in connectivity with decreasing distraction indicating a convex curve was found in frontal network areas such as SFG-iFGi (c=-0.04, p<0.01; d=0.86, p<0.01) and IFGs-FFGl (c=-0.73, p<0.01; d=0.73, p<0.01). We also predicted that there would be a concave decreasing distraction- decreasing connectivity in sensorimotor networks, which found support in cerebellar-cortical connections reflecting sensorimotor networks such as Cere-FFGm (c=0.58, p<0.01; d=-0.45, p<0.01) and Cere-ACC (c=0.05, p<0.01; d=-0.53, p<0.01). We also see that there is a significant increase in connectivity (c<0) with a concave pattern (d<0) in many thalamic connections, which provides some further support for Sync Theory. This includes thalamo-frontal regions IFGi-Thal (c=-0.2, p<0.01; d=-0.78, p<0.01) and MFG-Thal (c=-0.15, p<0.01; d=-1.78, p<0.01), thalamo- occipitotemporal regions FFGm-Thal (c=-0.38, p<0.01; d=-1.41, p<0.01) and FFGl-Thal (c=- 0.72, p<0.01; d=-1.32, p<0.01), and the thalamo-cerebellar connection Cere-Thal (c=-0.27, p<0.01; d=-0.82, p<0.01).

However, it must also be pointed out that other findings did not follow the predicted path. We found support for a concave decreasing distraction- decreasing connectivity (c>0, d<0) in some local frontal connections (IFGi-IFGs, SFG-MFG) and thalamo-frontal connections (ACC-Thal, SFG-Thal, Thal-IFGs).

We also struggled with ambiguity in Sync Theory's hypotheses. Sync Theory implies that there will be an increase in connectivity following decreasing distraction (c<0), but does not specify whether connectivity will increase at an increasing rate (convex, d>0) or increase at a decreasing rate (concave, d<0).

## Conclusions
- Distraction measures flow better than reaction time alone
- Some attention networks display an increase in connectivity in flow but some do not, perhaps implicating that there exists a specific flow network in the brain separate from the existing attention and reward networks. Needs further research to isolate. 
- Connectivity strength between flow-specific regions of the brain increases nonlinearly when one enters flow
