import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure EquilibriumSolution where
  point : Type
  equation : point → Prop
  solution : ∃ x, equation x
  uniqueness : ∀ x y, equation x → equation y → x = y

def EquilibriumClosed (E : EquilibriumSolution) : Prop :=
  E.solution ∧ E.uniqueness

theorem equilibrium_closed_from_evidence (E : EquilibriumSolution) : EquilibriumClosed E :=
  And.intro E.solution E.uniqueness

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse