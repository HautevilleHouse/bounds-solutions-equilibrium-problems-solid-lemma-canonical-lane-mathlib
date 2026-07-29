import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.VariationalInequality

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure MonotoneOperatorPackage {V : VariationalInequalityPackage} where
  operatorDefined : Prop
  monotoneProperty : Prop
  hemicontinuity : Prop
  maximalMonotone : Prop

structure MonotoneOperatorEvidence {V : VariationalInequalityPackage}
    (M : MonotoneOperatorPackage V) where
  operatorDefinedClosed : M.operatorDefined
  monotonePropertyClosed : M.monotoneProperty
  hemicontinuityClosed : M.hemicontinuity
  maximalMonotoneClosed : M.maximalMonotone

def MonotoneOperatorClosed {V : VariationalInequalityPackage}
    (M : MonotoneOperatorPackage V) : Prop :=
  M.operatorDefined ∧ M.monotoneProperty ∧ M.hemicontinuity ∧ M.maximalMonotone

theorem monotone_operator_closed_from_evidence
    {V : VariationalInequalityPackage} (M : MonotoneOperatorPackage V)
    (E : MonotoneOperatorEvidence M) : MonotoneOperatorClosed M := by
  exact And.intro E.operatorDefinedClosed
    (And.intro E.monotonePropertyClosed
      (And.intro E.hemicontinuityClosed E.maximalMonotoneClosed))

end HautevilleHouse
end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean