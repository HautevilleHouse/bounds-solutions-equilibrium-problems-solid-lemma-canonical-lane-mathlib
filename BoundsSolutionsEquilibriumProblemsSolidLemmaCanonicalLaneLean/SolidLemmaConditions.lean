import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SolidLemmaConditions where
  space : Type u
  cone : Set space
  solidInterior : Prop
  closedness : Prop
  boundedness : Prop
  coneSolid : Prop

structure SolidLemmaEvidence (C : SolidLemmaConditions) where
  solidInteriorClosed : C.solidInterior
  closednessClosed : C.closedness
  boundednessClosed : C.boundedness
  coneSolidClosed : C.coneSolid

def SolidLemmaClosed (C : SolidLemmaConditions) : Prop :=
  C.solidInterior ∧ C.closedness ∧ C.boundedness ∧ C.coneSolid

theorem solid_lemma_closed_from_evidence (C : SolidLemmaConditions) (E : SolidLemmaEvidence C) : SolidLemmaClosed C := by
  exact And.intro E.solidInteriorClosed (And.intro E.closednessClosed (And.intro E.boundednessClosed E.coneSolidClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse