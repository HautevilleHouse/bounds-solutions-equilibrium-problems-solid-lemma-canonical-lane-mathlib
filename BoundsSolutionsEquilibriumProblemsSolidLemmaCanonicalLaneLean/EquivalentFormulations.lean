import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsSolutionEquilibriumPackage where
  feasibleSet : Type u
  objectiveFunction : feasibleSet → ℝ
  constraints : List (feasibleSet → Prop)
  boundednessAbove : Prop
  supremumAttained : Prop
  equilibriumPoint : feasibleSet
  equilibriumCondition : Prop
  solidLemmaConditions : Prop
  solutionSetClosed : Prop

structure BoundsSolutionEquilibriumEvidence (B : BoundsSolutionEquilibriumPackage) where
  boundednessAboveClosed : B.boundednessAbove
  supremumAttainedClosed : B.supremumAttained
  equilibriumConditionClosed : B.equilibriumCondition
  solidLemmaConditionsClosed : B.solidLemmaConditions
  solutionSetClosedClosed : B.solutionSetClosed

def BoundsSolutionEquilibriumClosed (B : BoundsSolutionEquilibriumPackage) : Prop :=
  B.boundednessAbove ∧ B.supremumAttained ∧ B.equilibriumCondition ∧ B.solidLemmaConditions ∧ B.solutionSetClosed

theorem bounds_solution_equilibrium_closed_from_evidence
    (B : BoundsSolutionEquilibriumPackage) (E : BoundsSolutionEquilibriumEvidence B) :
    BoundsSolutionEquilibriumClosed B := by
  exact And.intro E.boundednessAboveClosed
    (And.intro E.supremumAttainedClosed
      (And.intro E.equilibriumConditionClosed
        (And.intro E.solidLemmaConditionsClosed E.solutionSetClosedClosed)))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
