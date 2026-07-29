import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : BoundsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BoundsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse