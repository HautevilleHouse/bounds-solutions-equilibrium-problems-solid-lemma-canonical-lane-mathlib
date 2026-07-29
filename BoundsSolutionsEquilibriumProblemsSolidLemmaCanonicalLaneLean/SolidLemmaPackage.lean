import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolidLemmaPackage where
  functionalSpace : Type u
  solidEstimate : Prop
  coercivityCondition : Prop
  compactnessProperty : Prop
  lowerSemicontinuity : Prop

structure SolidLemmaEvidence (S : SolidLemmaPackage) where
  solidEstimateClosed : S.solidEstimate
  coercivityConditionClosed : S.coercivityCondition
  compactnessPropertyClosed : S.compactnessProperty
  lowerSemicontinuityClosed : S.lowerSemicontinuity

def SolidLemmaClosed (S : SolidLemmaPackage) : Prop :=
  S.solidEstimate ∧ S.coercivityCondition ∧ S.compactnessProperty ∧ S.lowerSemicontinuity

theorem solid_lemma_closed_from_evidence (S : SolidLemmaPackage)
    (E : SolidLemmaEvidence S) : SolidLemmaClosed S := by
  exact And.intro E.solidEstimateClosed
    (And.intro E.coercivityConditionClosed
      (And.intro E.compactnessPropertyClosed E.lowerSemicontinuityClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse