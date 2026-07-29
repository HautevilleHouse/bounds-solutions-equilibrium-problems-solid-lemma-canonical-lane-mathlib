import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

open CanonicalLaneMathlibCore

def boundsSolutionsProjection : Projection BoundsSolutionsEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem bounds_solutions_projection_idempotent (x : BoundsSolutionsEndgameState) :
    boundsSolutionsProjection.toFun (boundsSolutionsProjection.toFun x) = boundsSolutionsProjection.toFun x := by
  exact boundsSolutionsProjection.idempotent x

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse