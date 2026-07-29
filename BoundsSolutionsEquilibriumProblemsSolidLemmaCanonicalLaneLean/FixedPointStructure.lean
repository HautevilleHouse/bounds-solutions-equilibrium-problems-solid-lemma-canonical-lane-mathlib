import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure FixedPointStructure where
  domain : Type
  topology : TopologicalSpace domain
  mapping : domain → domain
  contractive : Prop
  existence : ∃ x, mapping x = x
  uniqueness : contractive → ∀ x y, (mapping x = x) → (mapping y = y) → x = y

def FixedPointClosed (F : FixedPointStructure) : Prop :=
  F.contractive ∧ F.existence ∧ F.uniqueness F.contractive

theorem fixed_point_closed_from_evidence (F : FixedPointStructure)
    (h : F.contractive) (hEx : F.existence) : FixedPointClosed F :=
  And.intro h (And.intro hEx (F.uniqueness h))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse