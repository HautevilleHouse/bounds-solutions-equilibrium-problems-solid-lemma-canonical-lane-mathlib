import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure ProjectionOperatorPackage where
  space : Type u
  innerProduct : space → space → ℝ
  norm : space → ℝ
  convexSet : Set space
  projection : space → space
  fixedPoints : Set space
  nonexpansive : ∀ x y, norm (projection x - projection y) ≤ norm (x - y)
  idempotent : ∀ x, projection (projection x) = projection x

structure ProjectionOperatorEvidence (P : ProjectionOperatorPackage) where
  convexSetNonempty : P.convexSet.Nonempty
  convexSetConvex : Convex ℝ P.convexSet
  projectionMapsToConvex : ∀ x, P.projection x ∈ P.convexSet
  nonexpansiveClosed : ∀ x y, P.norm (P.projection x - P.projection y) ≤ P.norm (x - y)
  idempotentClosed : ∀ x, P.projection (P.projection x) = P.projection x
  fixedPointsConvex : Convex ℝ P.fixedPoints

def ProjectionOperatorClosed (P : ProjectionOperatorPackage) : Prop :=
  P.convexSet.Nonempty ∧ Convex ℝ P.convexSet ∧
  (∀ x, P.projection x ∈ P.convexSet) ∧
  (∀ x y, P.norm (P.projection x - P.projection y) ≤ P.norm (x - y)) ∧
  (∀ x, P.projection (P.projection x) = P.projection x) ∧
  Convex ℝ P.fixedPoints

theorem projectionOperatorClosedFromEvidence (P : ProjectionOperatorPackage)
    (E : ProjectionOperatorEvidence P) : ProjectionOperatorClosed P := by
  exact And.intro E.convexSetNonempty
    (And.intro E.convexSetConvex
      (And.intro E.projectionMapsToConvex
        (And.intro E.nonexpansiveClosed
          (And.intro E.idempotentClosed E.fixedPointsConvex))))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse