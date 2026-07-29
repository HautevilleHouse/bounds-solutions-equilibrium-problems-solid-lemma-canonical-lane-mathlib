import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsPackage where
  lowerBound : Prop
  upperBound : Prop
  boundEstablished : Prop

structure SolutionExistencePackage where
  solutionExists : Prop
  solutionConstructed : Prop

structure EquilibriumConditionsPackage where
  equilibriumCondition : Prop
  equilibriumSatisfied : Prop

structure SolidLemmaPackage where
  bounds : BoundsPackage
  solution : SolutionExistencePackage
  equilibrium : EquilibriumConditionsPackage
  solidLemmaProved : Prop

structure SolidLemmaEvidence (S : SolidLemmaPackage) where
  boundEstablishedClosed : S.bounds.boundEstablished
  solutionConstructedClosed : S.solution.solutionConstructed
  equilibriumSatisfiedClosed : S.equilibrium.equilibriumSatisfied
  solidLemmaProvedClosed : S.solidLemmaProved

def SolidLemmaClosed (S : SolidLemmaPackage) : Prop :=
  S.bounds.boundEstablished ∧ S.solution.solutionConstructed ∧
  S.equilibrium.equilibriumSatisfied ∧ S.solidLemmaProved

theorem solid_lemma_closed_from_evidence (S : SolidLemmaPackage) (E : SolidLemmaEvidence S) :
    SolidLemmaClosed S :=
  And.intro E.boundEstablishedClosed
    (And.intro E.solutionConstructedClosed
      (And.intro E.equilibriumSatisfiedClosed E.solidLemmaProvedClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse