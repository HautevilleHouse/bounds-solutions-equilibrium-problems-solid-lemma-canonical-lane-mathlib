import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BoundsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse