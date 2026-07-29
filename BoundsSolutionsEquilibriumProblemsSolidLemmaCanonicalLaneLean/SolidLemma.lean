import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.BoundsSolutions

/-!
# Solid Lemma Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolidLemmaPackage where
  monotoneOperator : Prop
  subsolutionSupremum : Prop
  supersolutionInfimum : Prop
  fixedPointBracketed : Prop

structure SolidLemmaEvidence (P : SolidLemmaPackage) where
  monotoneOperatorClosed : P.monotoneOperator
  subsolutionSupremumClosed : P.subsolutionSupremum
  supersolutionInfimumClosed : P.supersolutionInfimum
  fixedPointBracketedClosed : P.fixedPointBracketed

def SolidLemmaClosed (P : SolidLemmaPackage) : Prop :=
  P.monotoneOperator ∧ P.subsolutionSupremum ∧ P.supersolutionInfimum ∧ P.fixedPointBracketed

theorem solid_lemma_closed_from_evidence (P : SolidLemmaPackage)
    (E : SolidLemmaEvidence P) : SolidLemmaClosed P := by
  exact And.intro E.monotoneOperatorClosed
    (And.intro E.subsolutionSupremumClosed
      (And.intro E.supersolutionInfimumClosed E.fixedPointBracketedClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse