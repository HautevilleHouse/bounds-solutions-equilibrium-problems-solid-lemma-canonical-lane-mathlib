import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundsSolutionsPackage where
  solutionSpace : Type u
  norm : solutionSpace → ℝ
  boundConstant : ℝ
  solutionExists : Prop
  boundEstablished : Prop
  solutionExistsTerm : solutionExists
  boundEstablishedTerm : boundEstablished

structure BoundsSolutionsEvidence (P : BoundsSolutionsPackage) where
  solutionExistsClosed : P.solutionExists
  boundEstablishedClosed : P.boundEstablished

def BoundsSolutionsClosed (P : BoundsSolutionsPackage) : Prop :=
  P.solutionExists ∧ P.boundEstablished

theorem bounds_solutions_closed_from_evidence (P : BoundsSolutionsPackage) (E : BoundsSolutionsEvidence P) :
    BoundsSolutionsClosed P := by
  exact And.intro E.solutionExistsClosed E.boundEstablishedClosed

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse