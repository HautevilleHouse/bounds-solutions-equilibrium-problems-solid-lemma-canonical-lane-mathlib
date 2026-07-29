import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure EquilibriumSolutionPackage (M : MonotoneOperatorPackage) where
  equilibriumState : M.domainType
  equilibriumEquation : M.operator equilibriumState = equilibriumState
  equilibriumClosed : equilibriumEquation

def EquilibriumSolutionClosed (M : MonotoneOperatorPackage) (E : EquilibriumSolutionPackage M) : Prop :=
  E.equilibriumEquation

theorem equilibrium_solution_closed_from_evidence (M : MonotoneOperatorPackage)
    (E : EquilibriumSolutionPackage M) : EquilibriumSolutionClosed M E := by
  exact E.equilibriumClosed

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
