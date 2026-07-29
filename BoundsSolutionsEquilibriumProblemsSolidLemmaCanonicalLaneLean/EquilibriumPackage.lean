import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.BoundsSolutionsPackage

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure EquilibriumPackage {B : BoundsSolutionsPackage} where
  strategySpace : Type u
  payoffFunction : strategySpace → strategySpace → ℝ
  equilibriumExists : Prop
  approximationSequence : Prop
  equilibriumExistsTerm : equilibriumExists
  approximationSequenceTerm : approximationSequence

structure EquilibriumEvidence {B : BoundsSolutionsPackage} (E : EquilibriumPackage B) where
  equilibriumExistsClosed : E.equilibriumExists
  approximationSequenceClosed : E.approximationSequence

def EquilibriumClosed {B : BoundsSolutionsPackage} (E : EquilibriumPackage B) : Prop :=
  E.equilibriumExists ∧ E.approximationSequence

theorem equilibrium_closed_from_evidence {B : BoundsSolutionsPackage} (E : EquilibriumPackage B) (Ev : EquilibriumEvidence E) :
    EquilibriumClosed E := by
  exact And.intro Ev.equilibriumExistsClosed Ev.approximationSequenceClosed

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse