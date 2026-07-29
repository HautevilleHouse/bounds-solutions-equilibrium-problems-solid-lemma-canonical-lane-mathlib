import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure VariationalInequalityPackage where
  space : Type u
  innerProduct : space → space → ℝ
  norm : space → ℝ
  convexSet : Set space
  operator : space → space
  solution : Set space

structure VariationalInequalityEvidence (V : VariationalInequalityPackage) where
  convexSetNonempty : V.convexSet.Nonempty
  convexSetConvex : Convex ℝ V.convexSet
  operatorMonotone : ∀ x y, V.innerProduct (V.operator x - V.operator y) (x - y) ≥ 0
  solutionNonempty : V.solution.Nonempty
  inequalityHolds : ∀ x ∈ V.convexSet, ∀ y ∈ V.convexSet, V.innerProduct (V.operator x) (y - x) ≥ 0

def VariationalInequalityClosed (V : VariationalInequalityPackage) : Prop :=
  V.convexSet.Nonempty ∧ Convex ℝ V.convexSet ∧
  (∀ x y, V.innerProduct (V.operator x - V.operator y) (x - y) ≥ 0) ∧
  V.solution.Nonempty ∧
  (∀ x ∈ V.convexSet, ∀ y ∈ V.convexSet, V.innerProduct (V.operator x) (y - x) ≥ 0)

theorem variationalInequalityClosedFromEvidence (V : VariationalInequalityPackage)
    (E : VariationalInequalityEvidence V) : VariationalInequalityClosed V := by
  exact And.intro E.convexSetNonempty
    (And.intro E.convexSetConvex
      (And.intro E.operatorMonotone
        (And.intro E.solutionNonempty E.inequalityHolds)))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse