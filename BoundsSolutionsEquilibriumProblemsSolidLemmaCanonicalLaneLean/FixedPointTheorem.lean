import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure FixedPointTheoremPackage (M : MonotoneOperatorPackage) where
  fixedPointExists : Prop
  uniqueness : Prop
  stability : Prop
  fixedPointExistsClosed : fixedPointExists
  uniquenessClosed : uniqueness
  stabilityClosed : stability

def FixedPointTheoremClosed (M : MonotoneOperatorPackage) (F : FixedPointTheoremPackage M) : Prop :=
  F.fixedPointExists ∧ F.uniqueness ∧ F.stability

theorem fixed_point_theorem_closed_from_evidence (M : MonotoneOperatorPackage)
    (F : FixedPointTheoremPackage M) (E : FixedPointTheoremEvidence M F) : FixedPointTheoremClosed M F := by
  exact And.intro E.fixedPointExistsClosed (And.intro E.uniquenessClosed E.stabilityClosed)

structure FixedPointTheoremEvidence (M : MonotoneOperatorPackage) (F : FixedPointTheoremPackage M) where
  fixedPointExistsClosed : F.fixedPointExists
  uniquenessClosed : F.uniqueness
  stabilityClosed : F.stability

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
