import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolidConePackage where
  space : Type u
  cone : Set space
  interiorNonempty : (interior cone).Nonempty
  pointed : ∀ x ∈ cone, x = 0 ∨ x ∉ (-cone)
  closed : IsClosed cone

structure SolidConeEvidence (S : SolidConePackage) where
  interiorNonemptyClosed : S.interiorNonempty
  pointedClosed : ∀ x ∈ S.cone, x = 0 ∨ x ∉ (-S.cone)
  closedClosed : IsClosed S.cone
  convex : Convex ℝ S.cone
  generating : S.cone - S.cone = Set.univ

def SolidConeClosed (S : SolidConePackage) : Prop :=
  S.interiorNonempty ∧ (∀ x ∈ S.cone, x = 0 ∨ x ∉ (-S.cone)) ∧ IsClosed S.cone ∧
  Convex ℝ S.cone ∧ (S.cone - S.cone = Set.univ)

theorem solidConeClosedFromEvidence (S : SolidConePackage) (E : SolidConeEvidence S) : SolidConeClosed S := by
  exact And.intro E.interiorNonemptyClosed
    (And.intro E.pointedClosed
      (And.intro E.closedClosed
        (And.intro E.convex E.generating)))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse