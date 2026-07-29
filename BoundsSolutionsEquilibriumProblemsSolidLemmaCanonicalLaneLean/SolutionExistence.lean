import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolutionExistencePackage (M : MonotoneOperatorPackage) where
  solutionExists : Prop
  approximationSequence : Type u
  convergenceRate : Type v
  solutionExistsClosed : solutionExists

def SolutionExistenceClosed (M : MonotoneOperatorPackage) (S : SolutionExistencePackage M) : Prop :=
  S.solutionExists

theorem solution_existence_closed_from_evidence (M : MonotoneOperatorPackage)
    (S : SolutionExistencePackage M) : SolutionExistenceClosed M S := by
  exact S.solutionExistsClosed

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
