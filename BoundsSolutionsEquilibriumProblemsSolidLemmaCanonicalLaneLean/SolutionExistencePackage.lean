import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolutionExistencePackage where
  solutionSpace : Type u
  existenceProof : Prop
  uniquenessProof : Prop
  regularityProof : Prop
  continuousDependence : Prop

structure SolutionExistenceEvidence (S : SolutionExistencePackage) where
  existenceProofClosed : S.existenceProof
  uniquenessProofClosed : S.uniquenessProof
  regularityProofClosed : S.regularityProof
  continuousDependenceClosed : S.continuousDependence

def SolutionExistenceClosed (S : SolutionExistencePackage) : Prop :=
  S.existenceProof ∧ S.uniquenessProof ∧ S.regularityProof ∧ S.continuousDependence

theorem solution_existence_closed_from_evidence (S : SolutionExistencePackage)
    (E : SolutionExistenceEvidence S) : SolutionExistenceClosed S := by
  exact And.intro E.existenceProofClosed
    (And.intro E.uniquenessProofClosed
      (And.intro E.regularityProofClosed E.continuousDependenceClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse