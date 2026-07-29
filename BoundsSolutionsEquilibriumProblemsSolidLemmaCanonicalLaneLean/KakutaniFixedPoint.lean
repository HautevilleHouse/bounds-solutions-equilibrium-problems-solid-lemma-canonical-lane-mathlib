import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.SolidCone

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure KakutaniFixedPointPackage where
  space : SolidConePackage
  correspondence : space.vectorSpace → Set (space.vectorSpace)
  closedGraph : Prop
  convexImages : Prop
  nonemptyCompactImages : Prop
  fixedPointExists : Prop
  closedGraphTerm : closedGraph
  convexImagesTerm : convexImages
  nonemptyCompactImagesTerm : nonemptyCompactImages
  fixedPointExistsTerm : fixedPointExists

structure KakutaniFixedPointEvidence (K : KakutaniFixedPointPackage) where
  closedGraphClosed : K.closedGraph
  convexImagesClosed : K.convexImages
  nonemptyCompactImagesClosed : K.nonemptyCompactImages
  fixedPointExistsClosed : K.fixedPointExists

def KakutaniFixedPointClosed (K : KakutaniFixedPointPackage) : Prop :=
  K.closedGraph ∧ K.convexImages ∧ K.nonemptyCompactImages ∧ K.fixedPointExists

theorem kakutani_fixed_point_closed_from_evidence (K : KakutaniFixedPointPackage)
    (Ev : KakutaniFixedPointEvidence K) : KakutaniFixedPointClosed K := by
  exact And.intro Ev.closedGraphClosed
    (And.intro Ev.convexImagesClosed
      (And.intro Ev.nonemptyCompactImagesClosed Ev.fixedPointExistsClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
