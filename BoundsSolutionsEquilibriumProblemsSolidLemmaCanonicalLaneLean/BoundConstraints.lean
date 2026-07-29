import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure BoundConstraints where
  boundType : Type u
  linearConstraint : Prop
  convexity : Prop
  compactness : Prop
  feasibleSetNonempty : Prop

structure BoundConstraintsEvidence (C : BoundConstraints) where
  linearConstraintClosed : C.linearConstraint
  convexityClosed : C.convexity
  compactnessClosed : C.compactness
  feasibleSetNonemptyClosed : C.feasibleSetNonempty

def BoundConstraintsClosed (C : BoundConstraints) : Prop :=
  C.linearConstraint ∧ C.convexity ∧ C.compactness ∧ C.feasibleSetNonempty

theorem bound_constraints_closed_from_evidence (C : BoundConstraints) (E : BoundConstraintsEvidence C) : BoundConstraintsClosed C := by
  exact And.intro E.linearConstraintClosed (And.intro E.convexityClosed (And.intro E.compactnessClosed E.feasibleSetNonemptyClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse