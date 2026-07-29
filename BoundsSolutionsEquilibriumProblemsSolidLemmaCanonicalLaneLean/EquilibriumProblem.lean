import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.SolidCone

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure EquilibriumProblemPackage where
  space : SolidConePackage
  bifunction : space.vectorSpace → space.vectorSpace → Prop
  feasibleSet : Set space.vectorSpace
  closedConvex : Prop
  monotoneBifunction : Prop
  closedConvexTerm : closedConvex
  monotoneBifunctionTerm : monotoneBifunction

structure EquilibriumProblemEvidence (E : EquilibriumProblemPackage) where
  closedConvexClosed : E.closedConvex
  monotoneBifunctionClosed : E.monotoneBifunction

def EquilibriumProblemClosed (E : EquilibriumProblemPackage) : Prop :=
  E.closedConvex ∧ E.monotoneBifunction

theorem equilibrium_problem_closed_from_evidence (E : EquilibriumProblemPackage)
    (Ev : EquilibriumProblemEvidence E) : EquilibriumProblemClosed E := by
  exact And.intro Ev.closedConvexClosed Ev.monotoneBifunctionClosed

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
