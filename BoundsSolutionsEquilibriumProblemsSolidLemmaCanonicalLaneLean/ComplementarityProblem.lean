import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure ComplementarityProblemPackage where
  space : Type u
  innerProduct : space → space → ℝ
  cone : Set space
  mapping : space → space
  solution : Set space
  coneSolid : SolidConePackage
  complementarity : ∀ x, x ∈ solution ↔ x ∈ cone ∧ mapping x ∈ cone ∧ innerProduct x (mapping x) = 0

structure ComplementarityProblemEvidence (C : ComplementarityProblemPackage) where
  coneNonempty : C.cone.Nonempty
  mappingContinuous : Continuous C.mapping
  solutionNonempty : C.solution.Nonempty
  complementarityClosed : ∀ x, x ∈ C.solution ↔ x ∈ C.cone ∧ C.mapping x ∈ C.cone ∧ C.innerProduct x (C.mapping x) = 0

def ComplementarityProblemClosed (C : ComplementarityProblemPackage) : Prop :=
  C.cone.Nonempty ∧ Continuous C.mapping ∧ C.solution.Nonempty ∧
  (∀ x, x ∈ C.solution ↔ x ∈ C.cone ∧ C.mapping x ∈ C.cone ∧ C.innerProduct x (C.mapping x) = 0)

theorem complementarityProblemClosedFromEvidence (C : ComplementarityProblemPackage)
    (E : ComplementarityProblemEvidence C) : ComplementarityProblemClosed C := by
  exact And.intro E.coneNonempty
    (And.intro E.mappingContinuous
      (And.intro E.solutionNonempty E.complementarityClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse