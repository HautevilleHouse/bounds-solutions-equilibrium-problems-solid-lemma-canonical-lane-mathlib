import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsAndEquilibriumPackage where
  boundSpace : Type u
  solutionSpace : Type v
  equilibriumCondition : Prop
  upperBound : boundSpace → Prop
  lowerBound : boundSpace → Prop
  solutionExists : Prop
  solidConstraint : Prop

structure BoundsAndEquilibriumEvidence (P : BoundsAndEquilibriumPackage) where
  equilibriumConditionClosed : P.equilibriumCondition
  upperBoundClosed : ∀ x : P.boundSpace, P.upperBound x
  lowerBoundClosed : ∀ x : P.boundSpace, P.lowerBound x
  solutionExistsClosed : P.solutionExists
  solidConstraintClosed : P.solidConstraint

def BoundsAndEquilibriumClosed (P : BoundsAndEquilibriumPackage) : Prop :=
  P.equilibriumCondition ∧ (∀ x : P.boundSpace, P.upperBound x) ∧ (∀ x : P.boundSpace, P.lowerBound x) ∧ P.solutionExists ∧ P.solidConstraint

theorem bounds_and_equilibrium_closed_from_evidence (P : BoundsAndEquilibriumPackage) (E : BoundsAndEquilibriumEvidence P) : BoundsAndEquilibriumClosed P := by
  exact And.intro E.equilibriumConditionClosed (And.intro (fun x => E.upperBoundClosed x) (And.intro (fun x => E.lowerBoundClosed x) (And.intro E.solutionExistsClosed E.solidConstraintClosed)))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse