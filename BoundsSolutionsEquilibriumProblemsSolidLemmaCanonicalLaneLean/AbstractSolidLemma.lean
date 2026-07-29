import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure AbstractSolidLemmaPackage (M : MonotoneOperatorPackage) where
  baseCase : Prop
  inductionStep : Prop
  closureCondition : Prop
  baseCaseClosed : baseCase
  inductionStepClosed : inductionStep
  closureConditionClosed : closureCondition

def AbstractSolidLemmaClosed (M : MonotoneOperatorPackage) (S : AbstractSolidLemmaPackage M) : Prop :=
  S.baseCase ∧ S.inductionStep ∧ S.closureCondition

theorem abstract_solid_lemma_closed_from_evidence (M : MonotoneOperatorPackage)
    (S : AbstractSolidLemmaPackage M) (E : AbstractSolidLemmaEvidence M S) : AbstractSolidLemmaClosed M S := by
  exact And.intro E.baseCaseClosed (And.intro E.inductionStepClosed E.closureConditionClosed)

structure AbstractSolidLemmaEvidence (M : MonotoneOperatorPackage) (S : AbstractSolidLemmaPackage M) where
  baseCaseClosed : S.baseCase
  inductionStepClosed : S.inductionStep
  closureConditionClosed : S.closureCondition

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
