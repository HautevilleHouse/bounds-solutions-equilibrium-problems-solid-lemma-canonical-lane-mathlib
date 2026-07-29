import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.VariationalInequality

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsSolutionPackage where
  inequality : VariationalInequalityPackage
  lowerBound : inequality.problem.space.vectorSpace → ℝ
  upperBound : inequality.problem.space.vectorSpace → ℝ
  solutionInBounds : Prop
  boundContinuity : Prop
  solutionInBoundsTerm : solutionInBounds
  boundContinuityTerm : boundContinuity

structure BoundsSolutionEvidence (B : BoundsSolutionPackage) where
  solutionInBoundsClosed : B.solutionInBounds
  boundContinuityClosed : B.boundContinuity

def BoundsSolutionClosed (B : BoundsSolutionPackage) : Prop :=
  B.solutionInBounds ∧ B.boundContinuity

theorem bounds_solution_closed_from_evidence (B : BoundsSolutionPackage)
    (Ev : BoundsSolutionEvidence B) : BoundsSolutionClosed B := by
  exact And.intro Ev.solutionInBoundsClosed Ev.boundContinuityClosed

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
