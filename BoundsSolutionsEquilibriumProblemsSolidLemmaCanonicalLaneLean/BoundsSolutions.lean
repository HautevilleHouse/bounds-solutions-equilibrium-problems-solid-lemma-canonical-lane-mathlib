import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.EquilibriumExistence

/-!
# Bounds and Solutions Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsSolutionsPackage where
  lowerBoundDefined : Prop
  upperBoundDefined : Prop
  solutionPerturbation : Prop
  stabilityUnderLimits : Prop

structure BoundsSolutionsEvidence (P : BoundsSolutionsPackage) where
  lowerBoundDefinedClosed : P.lowerBoundDefined
  upperBoundDefinedClosed : P.upperBoundDefined
  solutionPerturbationClosed : P.solutionPerturbation
  stabilityUnderLimitsClosed : P.stabilityUnderLimits

def BoundsSolutionsClosed (P : BoundsSolutionsPackage) : Prop :=
  P.lowerBoundDefined ∧ P.upperBoundDefined ∧ P.solutionPerturbation ∧ P.stabilityUnderLimits

theorem bounds_solutions_closed_from_evidence (P : BoundsSolutionsPackage)
    (E : BoundsSolutionsEvidence P) : BoundsSolutionsClosed P := by
  exact And.intro E.lowerBoundDefinedClosed
    (And.intro E.upperBoundDefinedClosed
      (And.intro E.solutionPerturbationClosed E.stabilityUnderLimitsClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse