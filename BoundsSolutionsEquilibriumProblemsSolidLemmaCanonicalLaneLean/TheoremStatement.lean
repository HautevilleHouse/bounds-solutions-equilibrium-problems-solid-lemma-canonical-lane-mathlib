import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolidLemmaSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidLemmaAdmittedObject where
  space : SolidLemmaSpace
  boundedDomain : Prop
  equilibriumSolution : Prop
  solidLemmaConclusion : Prop
  conclusion : solidLemmaConclusion

def SolidLemmaWitnessClosed (O : SolidLemmaAdmittedObject) : Prop :=
  O.solidLemmaConclusion

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse
