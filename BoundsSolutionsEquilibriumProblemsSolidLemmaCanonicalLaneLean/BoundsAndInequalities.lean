import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsAndInequalities where
  lowerBound : ℝ
  upperBound : ℝ
  function : Type → ℝ
  boundedBelow : ∀ x, lowerBound ≤ function x
  boundedAbove : ∀ x, function x ≤ upperBound

def BoundsClosed (B : BoundsAndInequalities) : Prop :=
  B.boundedBelow ∧ B.boundedAbove

theorem bounds_closed_from_evidence (B : BoundsAndInequalities) : BoundsClosed B :=
  And.intro B.boundedBelow B.boundedAbove

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse