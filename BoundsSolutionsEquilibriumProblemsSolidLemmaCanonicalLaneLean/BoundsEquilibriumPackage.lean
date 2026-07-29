import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsEquilibriumPackage where
  boundsSpace : Type u
  equilibriumSolution : Prop
  solidLemma : Prop
  boundsObtained : Prop
  equilibriumClosed : Prop

structure BoundsEquilibriumEvidence (B : BoundsEquilibriumPackage) where
  equilibriumSolutionClosed : B.equilibriumSolution
  solidLemmaClosed : B.solidLemma
  boundsObtainedClosed : B.boundsObtained
  equilibriumClosedTerm : B.equilibriumClosed

def BoundsEquilibriumClosed (B : BoundsEquilibriumPackage) : Prop :=
  B.equilibriumSolution ∧ B.solidLemma ∧ B.boundsObtained ∧ B.equilibriumClosed

theorem bounds_equilibrium_closed_from_evidence (B : BoundsEquilibriumPackage)
    (E : BoundsEquilibriumEvidence B) : BoundsEquilibriumClosed B := by
  exact And.intro E.equilibriumSolutionClosed
    (And.intro E.solidLemmaClosed
      (And.intro E.boundsObtainedClosed E.equilibriumClosedTerm))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse