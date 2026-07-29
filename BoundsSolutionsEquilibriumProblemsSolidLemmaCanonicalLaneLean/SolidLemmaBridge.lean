import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolidLemmaPackage (B : BoundsSolutionEquilibriumPackage) where
  approximationSequence : ℕ → B.feasibleSet
  convergenceToEquilibrium : Prop
  stabilityUnderPerturbation : Prop
  topologicalClosure : Prop
  regularityCondition : Prop

structure SolidLemmaEvidence {B : BoundsSolutionEquilibriumPackage} (S : SolidLemmaPackage B) where
  convergenceToEquilibriumClosed : S.convergenceToEquilibrium
  stabilityUnderPerturbationClosed : S.stabilityUnderPerturbation
  topologicalClosureClosed : S.topologicalClosure
  regularityConditionClosed : S.regularityCondition

def SolidLemmaClosed {B : BoundsSolutionEquilibriumPackage} (S : SolidLemmaPackage B) : Prop :=
  S.convergenceToEquilibrium ∧ S.stabilityUnderPerturbation ∧ S.topologicalClosure ∧ S.regularityCondition

theorem solid_lemma_closed_from_evidence
    {B : BoundsSolutionEquilibriumPackage} (S : SolidLemmaPackage B) (E : SolidLemmaEvidence S) :
    SolidLemmaClosed S := by
  exact And.intro E.convergenceToEquilibriumClosed
    (And.intro E.stabilityUnderPerturbationClosed
      (And.intro E.topologicalClosureClosed E.regularityConditionClosed))

theorem bridge_from_solid_lemma {B : BoundsSolutionEquilibriumPackage}
    (S : SolidLemmaPackage B) (E : SolidLemmaEvidence S) : bridgeClosed (AdmissibleClass.mk (B.equilibriumPoint) (BoundsSolutionEquilibriumClosed B) (SolidLemmaClosed S) (Or.inr ?_)) := by
  have hClosed : SolidLemmaClosed S := solid_lemma_closed_from_evidence S E
  have hAdmissible : AdmissibleClass (B.equilibriumPoint) (BoundsSolutionEquilibriumClosed B) (SolidLemmaClosed S) := by
    apply AdmissibleClass.mk (B.equilibriumPoint) (BoundsSolutionEquilibriumClosed B) (SolidLemmaClosed S) (Or.inr hClosed)
  exact bridgeClosed.intro hAdmissible

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse